function [z,r,dr] = disp_stress(freq,vr,thk,dns,cvs,cvp,Fz)
% line 73, Yiran Ma modified the formula as (36) Chen, 1993, the origional
% code is different by some constant though.

% This function calulates the displacement-stress vectors (i.e., the eigenfunctions)
% corresponding to the phase velocities (i.e., wavenumbers) contained in the vr
% matrix

% Copyright 1999 by Glenn J. Rix and Carlo G. Lai

% This program is free software; you can redistribute it and/or
% modify it under the terms of the GNU General Public License
% as published by the Free Software Foundation; either version 2
% of the License, or (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

% Establish global parameters
global NUMPOINTS LAMBDA MAXROOT vr_half

% Calculate the vector of circular frequencies
om = 2*pi*freq;

% Determine the number of layers not including the half space
N = length(thk);

% Calulate the maximum depth for determining the displacement-stress vectors
lambda_max = max(sum(thk)+thk(end),LAMBDA*(real(vr(:,1)).^2 + imag(vr(:,1)).^2)./real(vr(:,1))./freq);
lambda_max = round(lambda_max);
% Initiate the depth and displacement-stress vectors and their numerical derivatives
z = zeros(NUMPOINTS,length(freq));
r = zeros(length(freq),MAXROOT,NUMPOINTS,4);
dr = zeros(length(freq),MAXROOT,NUMPOINTS,2);

% Loop through the frequencies
for j = 1:length(freq)
    
    % Create a vector of depths
    z(:,j) = linspace(0,lambda_max(j),NUMPOINTS)';
    step = floor(0.1/(z(2,j)-z(1,j)));
    n_try = [1:step:NUMPOINTS-1 NUMPOINTS];
    
    % Loop through the modes at each frequency
    index1 = find(vr(j,:));
    for m = 1:length(index1)
        
        % Calculate the wavenumber and load vector
        k = om(j)/vr(j,index1(m));
        delqz = [0 ; k*Fz/(2*pi)];
        
        % Check to see if the phase velocity is equal to the shear wave velocity
        % or compression wave velocity of one of the layers
        epsilon = 0.0001;
        while any(abs(om(j)/k-cvs)<epsilon) | any(abs(om(j)/k-cvp)<epsilon)
            k = k * (1+epsilon);
        end
        
        % Calculate the PSV element matrices for each layer and generalized R/T matrices
        [e11,e12,e21,e22,du,mu,nus,nup] = psv(thk,dns,cvp,cvs,om(j),k);
        [td,tu,rd,ru] = modrt(e11,e12,e21,e22,du);
        [Td,Rd] = genrt(td,tu,rd,ru);
        
        % Initialize the Cd and Cu matrices
        cd = zeros(2,1,N+1);
        cu = zeros(2,1,N+1);
        
        % Calculate Cd for the first layer
        [lamd,lamu] = updown(thk,cvp,cvs,om(j),k,0,1);
        
        %cd(:,:,1) = (e21(:,:,1) + e22(:,:,1)*lamu*Rd(:,:,1))\delqz;
        %Ru_0 = -inv(e21(:,:,1))*e22(:,:,1)*du(:,:,1);
        % fundamental mode
        if index1(m) == 1
            if abs(vr(j,1) - vr_half) > 1e-4
                F = -e21(:,:,1)\(e22(:,:,1)*du(:,:,1)*Rd(:,:,1));
                cd(:,:,1) = [F(1,2); 1-F(1,1)]./sqrt( abs(1-F(1,1))^2 + abs(F(1,2))^2 );
            else
                A = e21(:,:,1)./om(j);
                B = e22(:,:,1)*du(:,:,1)*Rd(:,:,1)./om(j);
                cd(:,:,1) = [A(1,2)+B(1,2); -A(1,1)-B(1,1)]./sqrt(abs(A(1,1)+B(1,1))^2 + abs(A(1,2)+B(1,2))^2);
            end
        else
            F = -e21(:,:,1)\(e22(:,:,1)*du(:,:,1)*Rd(:,:,1));
            cd(:,:,1) = [F(1,2); 1-F(1,1)]./sqrt( abs(1-F(1,1))^2 + abs(F(1,2))^2 ); 
        end
        
       
        cu(:,:,1) = Rd(:,:,1)*cd(:,:,1);
        % Calculate Cd and Cu for the remaining layers
        for n = 1:N-1
            cd(:,:,n+1) = Td(:,:,n)*cd(:,:,n);
            cu(:,:,n+1) = Rd(:,:,n+1)*cd(:,:,n+1);
        end
        cd(:,:,N+1) = Td(:,:,N)*cd(:,:,N);
        
        
        % Loop through the vector of depths
        for n = n_try
            
            % Determine the layer corresponding to the current depth
            index2 = find(z(n,j) <= [cumsum(thk) ; z(NUMPOINTS,j)]);
            layer = index2(1);
            
            % Calculate the up-going and down-going matrices for this depth
            [lamd,lamu] = updown(thk,cvp,cvs,om(j),k,z(n,j),layer);
            
            % Calculate the displacement-stress vector
            r(j,m,n,:) = [e11(:,:,layer) e12(:,:,layer) ; e21(:,:,layer) e22(:,:,layer)] * ...
                [lamd zeros(2) ; zeros(2) lamu] * [cd(:,:,layer) ; cu(:,:,layer)];
        end
        r1_try = abs(squeeze(r(j,m,n_try,1)));
        id = max(find(abs(diff(r1_try)) > 1e-6));
        
        for n = 1:n_try(id)
            
            % Determine the layer corresponding to the current depth
            index2 = find(z(n,j) <= [cumsum(thk) ; z(NUMPOINTS,j)]);
            layer = index2(1);
            
            % Calculate the up-going and down-going matrices for this depth
            [lamd,lamu] = updown(thk,cvp,cvs,om(j),k,z(n,j),layer);
            
            % Calculate the displacement-stress vector
            r(j,m,n,:) = [e11(:,:,layer) e12(:,:,layer) ; e21(:,:,layer) e22(:,:,layer)] * ...
                [lamd zeros(2) ; zeros(2) lamu] * [cd(:,:,layer) ; cu(:,:,layer)];
        end
        
        if n_try(id)~=NUMPOINTS
            r(j,m,n_try(id+1):NUMPOINTS,1) = interp1(  n_try(id+1:end),squeeze(r(j,m,n_try(id+1:end),1)),n_try(id+1):NUMPOINTS );
            r(j,m,n_try(id+1):NUMPOINTS,2) = interp1(  n_try(id+1:end),squeeze(r(j,m,n_try(id+1:end),2)),n_try(id+1):NUMPOINTS );
            r(j,m,n_try(id+1):NUMPOINTS,3) = interp1(  n_try(id+1:end),squeeze(r(j,m,n_try(id+1:end),3)),n_try(id+1):NUMPOINTS );
            r(j,m,n_try(id+1):NUMPOINTS,4) = interp1(  n_try(id+1:end),squeeze(r(j,m,n_try(id+1:end),4)),n_try(id+1):NUMPOINTS );
        end
        
        
        
        
        % Calculate the numerical derivative of the displacement-stress vectors
        % Note that only dr1 and dr2 are needed later. dr3 and dr4 are not calculated.
        [temp,dr(j,m,:,:)] = gradient(squeeze(r(j,m,:,1:2)),1,z(:,j));
        
    end
    

end
