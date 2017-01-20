function plot_large_dispertioncurve(handles, lang)
% PLOT LARGE DISPERION CURVE
% Plot dispertion curve on a larger scale
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

% Get plot data
freq = getappdata(handles.root, 'disp_freq');
vr_exp = getappdata(handles.root, 'disp_vrexp');

% Get plot style
plt_style = getappdata(handles.root, 'plt_dispertion_style');
plt_labelsize = getappdata(handles.root, 'plt_disp_labl_fontsize');

% Get unit from vr
vr_units = get(handles.unit_vr, 'String');
unit_vr = vr_units{get(handles.unit_vr, 'Value')};

% Create figure
h = figure('Name', lang{38}, 'NumberTitle', 'off'); % #ok<*NASGU>
plot(freq, vr_exp, plt_style);
xlabel(lang{37}, 'Interpreter', 'latex', 'FontSize', plt_labelsize);
ylabel(sprintf(lang{39}, unit_vr), 'Interpreter', 'latex', 'FontSize', plt_labelsize);
end