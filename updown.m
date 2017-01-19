function [lamd,lamu] = updown(thk,cvp,cvs,om,k,z,layer)

% This function calculates the up-going and down-going matrices for the P-SV case
% Note that the function psv also calculates up-going and down-going matrices
% (called du) which are optimized for use in calculating the modified R/T
% coefficients. The matrices calculated in this function are used in calculating
% the displacement-stress vectors.

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

cvs2 = cvs(layer).^2; cvp2 = cvp(layer).^2;
depth = [0 ; cumsum(thk)];

lamd = zeros(2,2);
lamu = zeros(2,2);

k2 = k^2; om2 = om^2;
   
ks2 = om2/cvs2;
nus = sqrt(k2-ks2);
if imag(-i*nus) > 0;
    nus = -nus;
end   
   
kp2 = om2/cvp2;
nup = sqrt(k2-kp2);
if imag(-i*nup) > 0;
    nup = -nup;
end   
   
lamd(1,1) = exp(-nup*(z-depth(layer)));
lamd(2,2) = exp(-nus*(z-depth(layer)));
   
if layer <= length(thk)
    lamu(1,1) = exp(-nup*(depth(layer+1)-z));
    lamu(2,2) = exp(-nus*(depth(layer+1)-z));
end
