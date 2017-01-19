function [I1,I2,I3,U,zdvrvs,zdvrvp,zdvrrho,dvrvs,dvrvp,dvrrho] = partial(freq,vr,z,r,dr,thk,dns,cvs,cvp)

% This function calculates the partial derivatives of the phase velocity
% with respect to the shear and compression wave velocities for each mode
% at each frequency. Two forms of the partial derivatives are returned:
% 1) the partial derivatives at individual depths (zdvrvs and zdvrvs) and
% 2) the partial derivatives integrated over each layer (dvrvs and dvrvp).

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

global NUMPOINTS MAXROOT

% Initialize vectors for material properties
vs = zeros(NUMPOINTS,1);
vp = zeros(NUMPOINTS,1);
lame = zeros(NUMPOINTS,1);
shear = zeros(NUMPOINTS,1);
rho = zeros(NUMPOINTS,1);

% Initialize matrices for the energy integrals, group velocity, and partial derivatives
I1 = zeros(length(freq),MAXROOT);
I2 = zeros(length(freq),MAXROOT);
I3 = zeros(length(freq),MAXROOT);
U = zeros(length(freq),MAXROOT);
zdvrvs = zeros(length(freq),MAXROOT,NUMPOINTS);
zdvrvp = zeros(length(freq),MAXROOT,NUMPOINTS);
zdvrrho= zdvrvs;
dvrvs = zeros(length(freq),MAXROOT,length(dns));
dvrvp = zeros(length(freq),MAXROOT,length(dns));
dvrrho= dvrvs;

% Define the vector of circular frequencies
om = 2*pi*freq;

% Loop through the frequencies
for j = 1:length(freq)
   
   % Loop through the vector of depths to assign vectors of material properties
   for n = 1:NUMPOINTS
      
      % Determine the layer corresponding to the current depth
      index1 = find(z(n,j) <= [cumsum(thk) ; z(NUMPOINTS,j)]);
      layer = index1(1);
      
      % Assign layer properties to vectors
      vs(n) = cvs(layer);
      vp(n) = cvp(layer);
      shear(n) = dns(layer)*cvs(layer)*cvs(layer);
      lame(n) = dns(layer)*cvp(layer)*cvp(layer) - 2*shear(n);
      rho(n) = dns(layer);
      
   end      
   
   % Loop through the modes at each frequency
   index2 = find(vr(j,:));
   for m = 1:length(index2)
      
      % Calculate the wavenumber
      k = om(j)/vr(j,index2(m));
      
      % Assign the displacement vectors and their derivatives to local variables
      r1 = squeeze(r(j,m,:,1));
      r2 = squeeze(r(j,m,:,2));
      dr1 = squeeze(dr(j,m,:,1));
      dr2 = squeeze(dr(j,m,:,2));
      
      % Calculate the first energy integral
      integrand = rho.*(r1.^2 + r2.^2);
      I1(j,m) = 0.5*trapz(z(:,j),integrand);
      
      % Calculate the second energy integral
      integrand = (lame + 2*shear).*(r1.^2) + shear.*(r2.^2);
      I2(j,m) = 0.5*trapz(z(:,j),integrand);
      
      % Calculate the third energy integral
      integrand = lame.*r1.*dr2 - shear.*r2.*dr1;
      I3(j,m) = trapz(z(:,j),integrand);
      
      % Calculate the group velocity
      U(j,m) = (2*k*I2(j,m) + I3(j,m))/(2*om(j)*I1(j,m));
      
      % Calculate the partial derivatives at each individual depth
      zdvrvs(j,m,:) = rho.*vs.*((k*r2 - dr1).^2 - 4*k*r1.*dr2)/(2*k^2*U(j,m)*I1(j,m));
      zdvrvp(j,m,:) = rho.*vp.*((k*r1 + dr2).^2)/(2*k^2*U(j,m)*I1(j,m));
      zdvrrho(j,m,:)= (  (vp.^2-2*vs.^2).*(k*r1 + dr2).^2 + ...
          vs.^2.*( 2*k^2.*r1.^2+2*dr2.^2+(k*r2-dr1).^2 )...
          -om(j)^2.*(r1.^2+r2.^2) )...
          /(4*k^2*U(j,m)*I1(j,m));
      
      % add the layer boundary points
      znew    = [z(:,j); cumsum(thk)]; znew = unique(znew);
      dvsnew  = interp1(z(:,j), squeeze(zdvrvs(j,m,:)), znew);
      dvpnew  = interp1(z(:,j), squeeze(zdvrvp(j,m,:)), znew);
      drhonew = interp1(z(:,j), squeeze(zdvrrho(j,m,:)), znew);
      
      % Calculate the partial derivatives for each layer by integrating over the
      % thickness of the layer
      depth = [0 ; cumsum(thk) ; z(NUMPOINTS,j)];
      for n = 1:length(dns)
         index3 = find(znew >= depth(n) & znew <= depth(n+1));
         if length(index3) < 5
            disp(['Partial derivatives at ',num2str(freq(j)),' Hz for Layer ',num2str(n), ' may be incorrect.'])
         end   
         dvrvs(j,m,n)  = trapz(znew(index3),dvsnew(index3),1);
         dvrvp(j,m,n)  = trapz(znew(index3),dvpnew(index3),1);
         dvrrho(j,m,n) = trapz(znew(index3),drhonew(index3),1);
      end
   end
end

