function show_plots(handles, lang)
% SHOW PLOTS
% Show final plots.
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

% Get solution status
solution_status = getappdata(handles.root, 'solution_ok');
set_status(handles, lang{96});
set(handles.root, 'pointer', 'watch');

% Check if solution is ok
if ~ solution_status
    disp_error(handles, lang, 65);
    return
end

% Get solution from app
niter = getappdata(handles.root, 'n_iter');
vr_iter = getappdata(handles.root, 'vr_iter');
vp_iter = getappdata(handles.root, 'vp_iter');
vs_iter = getappdata(handles.root, 'vs_iter');
dns_iter = getappdata(handles.root, 'dns_iter');

% Get data from GUI
freq = getappdata(handles.root, 'disp_freq');
vr_exp = getappdata(handles.root, 'disp_vrexp');
sigma = get(handles.param_inv_sigma, 'string');
mu = get(handles.param_inv_mu, 'string');
maxiter = get(handles.param_maxiter, 'string');
tol_vs = get(handles.param_tolvs, 'string');

% Convert data to source
sigma = str2double(sigma) + zeros(length(freq), 1);
mu = str2double(mu);
maxiter = str2double(maxiter);
tol_vs = str2double(tol_vs);

% Create thk, vp, vs and dns vectors
thk = getappdata(handles.root, 'thk_sol');
vs = getappdata(handles.root, 'vs_sol');
vp = getappdata(handles.root, 'vp_sol');
dns = getappdata(handles.root, 'dns_sol');

% Get plot config
disp_style_err = getappdata(handles.root, 'sol_plot_disp_style_exp');
disp_style_sol = getappdata(handles.root, 'sol_plot_disp_style_sol');
disp_fontsize = getappdata(handles.root, 'sol_plot_disp_fontsize');
showlegend_dispersion = getappdata(handles.root, 'plt_dispersion_solution_showlegend');
showlegend_shear = getappdata(handles.root, 'sol_plot_shear_showlegend');
shear_fontsize = getappdata(handles.root, 'sol_plot_shear_fontsize');
dispersion_iteration_style = getappdata(handles.root, 'dispersion_iteration_style');
dispersion_iteration_fontsize = getappdata(handles.root, 'dispersion_iteration_fontsize');
dispersion_iteration_show_legend = getappdata(handles.root, 'dispersion_iteration_show_legend');
dispersion_iteration_color = getappdata(handles.root, 'dispersion_iteration_color');
solution_plt_shear_curve_style = getappdata(handles.root, 'solution_plt_shear_curve_style');
dispersion_iteration_linewidth = getappdata(handles.root, 'dispersion_iteration_linewidth');
solution_plt_dispersion_experimental_linewidth = getappdata(handles.root, 'solution_plt_dispersion_experimental_linewidth');
solution_plt_dispersion_linewidth = getappdata(handles.root, 'solution_plt_dispersion_linewidth');
solution_plot_shear_linewidth = getappdata(handles.root, 'solution_plot_shear_linewidth');

% Get solution config
show_dispersion_comparision = getappdata(handles.root, 'show_dispersion_comparision');
show_shear_velocity_plot = getappdata(handles.root, 'show_shear_velocity_plot');
show_dispersion_iterations = getappdata(handles.root, 'show_dispersion_iterations');

% Get plot units
vr_units = get(handles.unit_vr, 'String');
vs_units = get(handles.unit_vsvp, 'String');
h_units = get(handles.unit_h, 'String');

unit_vr = vr_units{get(handles.unit_vr, 'Value')};
unit_vs = vs_units{get(handles.unit_vsvp, 'Value')};
unit_h = h_units{get(handles.unit_h, 'Value')};

% Calculated vs Experimental dispersion curve
if show_dispersion_comparision
    try
        h1 = figure('Name', lang{66}, 'NumberTitle', 'off'); %#ok<*NASGU>
        hold on;
        errorbar(freq, vr_exp, sigma, disp_style_err, 'Linewidth', solution_plt_dispersion_experimental_linewidth);
        plot(freq, vr_iter(:, niter), disp_style_sol, 'Linewidth', solution_plt_dispersion_linewidth);
        xlabel(lang{37}, 'Interpreter', 'latex', 'FontSize', disp_fontsize);
        ylabel(sprintf(lang{39}, unit_vr), 'Interpreter', 'latex', 'FontSize', disp_fontsize);
        hold off;
        if showlegend_dispersion % Show legend
            legend(lang{67}, lang{68});
        end
    catch
        close(h1);
        disp_error(handles, lang, 98);
    end
end

% Shear velocity on depth plot
if show_shear_velocity_plot
    try
        vsfinal = vs_iter(:, niter)';
        vsinitial = vs';
        thk = thk';
        if ~ isempty(vsfinal)
            cumthk = [0 cumsum(thk)];
            depth = 0;
            velocity = vsfinal(1);
            for j = 1:length(thk)
                depth = [depth cumthk(j + 1) cumthk(j + 1)]; %#ok<*AGROW>
                velocity = [velocity vsfinal(j) vsfinal(j + 1)];
            end
            depth = [depth sum(thk) + thk(length(thk))];
            velocity = [velocity vsfinal(length(vsfinal))];
         
            h2 = figure('Name', lang{69}, 'NumberTitle', 'off'); % #ok<*NASGU>
            plot(velocity, depth, solution_plt_shear_curve_style, 'Linewidth', solution_plot_shear_linewidth);
            set(gca, 'YDir', 'reverse', 'XAxisLocation', 'top');
            set(gca, 'Position', [0.13 0.05 0.775 0.815], 'PlotBoxAspectRatio', [0.75 1 1]);
            xlabel(sprintf(lang{70}, unit_vs), 'Interpreter', 'latex', 'FontSize', shear_fontsize);
            ylabel(sprintf(lang{71}, unit_h), 'Interpreter', 'latex', 'FontSize', shear_fontsize);       
            if showlegend_shear
                legend(lang{72});
            end            
        end
    catch
        close(h2);
        disp_error(handles, lang, 99);
    end
end

% Inversion v/s frequency v/s iteration number
if show_dispersion_iterations
 
    % Create plot color
    switch dispersion_iteration_color
        case 'r'
            plt_color = [1 0 0];
        case 'g'
            plt_color = [0 1 0];
        case 'b'
            plt_color = [0 0 1];
        case 'k'
            plt_color = [1 1 1];
        otherwise
            plt_color = [1 1 1];
    end
 
    try
        h3 = figure('Name', lang{102}, 'NumberTitle', 'off'); %#ok<*NASGU>
        hold on;
        errorbar(freq, vr_exp, sigma, disp_style_err, 'Linewidth', solution_plt_dispersion_experimental_linewidth);
        for i = 1:niter
            plot(freq, vr_iter(:, i), dispersion_iteration_style, 'Color', ...
                plt_color .* (i / niter), 'Linewidth', dispersion_iteration_linewidth);
        end
        xlabel(lang{37}, 'Interpreter', 'latex', 'FontSize', dispersion_iteration_fontsize);
        ylabel(sprintf(lang{39}, unit_vr), 'Interpreter', 'latex', 'FontSize', dispersion_iteration_fontsize);
        hold off;
        if dispersion_iteration_show_legend
            legnd = cell(niter + 1, 1);
            legnd{1} = lang{67};
            for i = 1:niter
                legnd{i + 1} = sprintf(lang{104}, i);
            end
            legend(legnd);
        end   
    catch
        close(h3);
        disp_error(handles, lang, 103);
    end
end

% Set status and pointer to normal
set_status(handles, lang{97});
set(handles.root, 'pointer', 'arrow');

end

