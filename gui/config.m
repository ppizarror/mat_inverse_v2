% CONFIG
% GUI Configuration and mat_inverse configurations are stored in this file.
%
% Author: Pablo Pizarro @ppizarror.com, 2017.
%
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

% --------------------------------------------------------------------
% GUI APP CONFIGURATION

% Language selection
%   1:  Spanish (Español)
%   2:  English (United States)
lang = load_lang(1);

% Deletes entry if invalid
delete_entry_if_invalid = false;

% Enable GUI sounds
gui_sound_enabled = true;
% --------------------------------------------------------------------


% --------------------------------------------------------------------
% INVERSE MATLAB CONFIGURATION

% Maximum number of iterations, used by mat_inverse
inv_maxiter = 10;

% Mu coefficient, mat_inverse
inv_mu = 10;

% Vs tolerance error, mat_inverse
inv_tol_vs = 0.01;

% Sigma, mat_inverse
inv_sigma = 0.03;
% --------------------------------------------------------------------


% --------------------------------------------------------------------
% PLOT CONFIGURATION

% Dispertion plot style
plt_dispertion_style = 'ro-';

% Dispertion plot label fontsize
plt_dispertion_label_fontsize = 10;

% Solution dispertion curve plot style
soltion_plt_dispertion_style = 'ro--';

% Solution plot label fontsize
solution_plt_dispertion_fontsize = 10;
% --------------------------------------------------------------------