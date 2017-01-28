function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
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
%
% Last Modified by GUIDE v2.5 27-Jan-2017 21:00:36
%
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main
handles.output = hObject;

% Add bin, and gui to path from folder (recursive)
PATH_DEPTH = 3;

for i=1:PATH_DEPTH

    try
        path_str = '';
        if i~=1
            for j=1:i-1
                path_str = strcat(path_str, '../');
            end
        end
        path_bin = cd(cd(strcat(path_str, 'bin')));
        path_gui = cd(cd(strcat(path_str, 'gui')));
        addpath(path_bin);
        addpath(path_gui);
        break
        
    catch Exception
        
        % Folders could not be found
        if i==PATH_DEPTH
            fprintf(getReport(Exception));
            error('Error while setting software path.');
        end
        
    end
end

% Center window
movegui(gcf,'center');

% Import configurations
config;

% Load language strings
lang = load_lang(lang_id);

% Disable Excel warning
warning('off','MATLAB:xlswrite:AddSheet');

% Set gui-app config
setappdata(handles.root, 'lang', lang);
setappdata(handles.root, 'gui_sound', gui_sound_enabled);
setappdata(handles.root, 'delete_entry_if_invalid', delete_entry_if_invalid);

% Set inversion config
setappdata(handles.root, 'cgf_sigma', inv_sigma);
setappdata(handles.root, 'cgf_mu', inv_mu);
setappdata(handles.root, 'cgf_maxiter', inv_maxiter);
setappdata(handles.root, 'cgf_tolvs', inv_tol_vs);

% Set plot configuration - style
setappdata(handles.root, 'plt_disp_labl_fontsize', plt_dispersion_label_fontsize);
setappdata(handles.root, 'plt_dispersion_style', plt_dispersion_style);
setappdata(handles.root, 'sol_plot_disp_fontsize', solution_plt_dispersion_fontsize);
setappdata(handles.root, 'sol_plot_disp_style_exp', solution_plt_dispersion_experimental_style);
setappdata(handles.root, 'sol_plot_disp_style_sol', solution_plt_dispersion_solution_style);
setappdata(handles.root, 'plt_dispersion_showlegend', plt_dispersion_show_legend);
setappdata(handles.root, 'plt_dispersion_solution_showlegend', solution_plt_dispersion_show_legend);
setappdata(handles.root, 'sol_plot_shear_showlegend', solution_plt_shear_show_legend);
setappdata(handles.root, 'sol_plot_shear_fontsize', solution_plt_shear_fontsize);
setappdata(handles.root, 'dispersion_iteration_style', dispersion_iteration_style);
setappdata(handles.root, 'dispersion_iteration_fontsize', dispersion_iteration_fontsize);
setappdata(handles.root, 'dispersion_iteration_color', dispersion_iteration_color);
setappdata(handles.root, 'dispersion_iteration_show_legend', dispersion_iteration_show_legend);
setappdata(handles.root, 'solution_plt_shear_curve_style', solution_plt_shear_curve_style);
setappdata(handles.root, 'dispersion_iteration_linewidth', dispersion_iteration_linewidth);
setappdata(handles.root, 'plt_dispersion_linewidth', plt_dispersion_linewidth);
setappdata(handles.root, 'solution_plt_dispersion_experimental_linewidth', solution_plt_dispersion_experimental_linewidth);
setappdata(handles.root, 'solution_plt_dispersion_linewidth', solution_plt_dispersion_linewidth);
setappdata(handles.root, 'solution_plot_shear_linewidth', solution_plot_shear_linewidth);
setappdata(handles.root, 'solution_shear_comparision_fontsize', solution_shear_comparision_fontsize);
setappdata(handles.root, 'solution_shear_comparision_shear_curve_linewidth', solution_shear_comparision_shear_curve_linewidth);
setappdata(handles.root, 'solution_shear_comparision_iguess_curve_linewidth', solution_shear_comparision_iguess_curve_linewidth);
setappdata(handles.root, 'solution_shear_comparision_shear_curve_style', solution_shear_comparision_shear_curve_style);
setappdata(handles.root, 'solution_shear_comparision_iguess_curve_style', solution_shear_comparision_iguess_curve_style);
setappdata(handles.root, 'solution_plt_shear_comparision_legend', solution_plt_shear_comparision_legend);

% Set solution configuration
setappdata(handles.root, 'show_dispersion_comparision', show_dispersion_comparision);
setappdata(handles.root, 'show_shear_velocity_plot', show_shear_velocity_plot);
setappdata(handles.root, 'show_dispersion_iterations', show_dispersion_iterations);
setappdata(handles.root, 'show_shear_velocity_comparision', show_shear_velocity_comparision);

% Set GUI Strings from lang
set_gui_lang(handles, lang);

% Set new file
new_file(handles, lang, false);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.root);


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles)  %#ok<*INUSL>
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function menu_file_Callback(hObject, eventdata, handles) %#ok<*DEFNU,*INUSD>
% hObject    handle to menu_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function initial_solution_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initial_solution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --------------------------------------------------------------------
function table_menu_Callback(hObject, eventdata, handles)
% hObject    handle to table_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function table_add_row_Callback(hObject, eventdata, handles)
% hObject    handle to table_add_row (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
add_row(handles);


% --- Executes when entered data in editable cell(s) in initial_solution.
function initial_solution_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to initial_solution (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
replace_nan_initialtable(handles, getappdata(handles.root, 'lang'));


% --------------------------------------------------------------------
function delete_last_row_Callback(hObject, eventdata, handles)
% hObject    handle to delete_last_row (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete_last_row(handles, getappdata(handles.root, 'lang'));


% --------------------------------------------------------------------
function table_import_from_excel_Callback(hObject, eventdata, handles)
% hObject    handle to table_import_from_excel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
import_initialtable_excel(handles, getappdata(handles.root, 'lang'));


% --------------------------------------------------------------------
function menu_edition_Callback(hObject, eventdata, handles)
% hObject    handle to menu_edition (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_edition_cleantable_Callback(hObject, eventdata, handles)
% hObject    handle to menu_edition_cleantable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear_initialtable(handles, getappdata(handles.root, 'lang'), true);


% --------------------------------------------------------------------
function menu_file_new_Callback(hObject, eventdata, handles)
% hObject    handle to menu_file_new (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
new_file(handles, getappdata(handles.root, 'lang'), true);


% --------------------------------------------------------------------
function menu_file_load_Callback(hObject, eventdata, handles)
% hObject    handle to menu_file_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load_project(handles, getappdata(handles.root, 'lang'));


% --- Executes during object creation, after setting all properties.
function initial_solution_table_title_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initial_solution_table_title (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --------------------------------------------------------------------
function menu_help_Callback(hObject, eventdata, handles)
% hObject    handle to menu_help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_view_help_Callback(hObject, eventdata, handles)
% hObject    handle to menu_view_help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
manual;


% --------------------------------------------------------------------
function menu_about_Callback(hObject, eventdata, handles)
% hObject    handle to menu_about (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
about(getappdata(handles.root, 'lang'));


% --------------------------------------------------------------------
function menu_file_save_Callback(hObject, eventdata, handles)
% hObject    handle to menu_file_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
save_project(handles, getappdata(handles.root, 'lang'), false);


% --------------------------------------------------------------------
function menu_file_save_as_Callback(hObject, eventdata, handles)
% hObject    handle to menu_file_save_as (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
save_project(handles, getappdata(handles.root, 'lang'), true);


% --------------------------------------------------------------------
function menu_file_close_Callback(hObject, eventdata, handles)
% hObject    handle to menu_file_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
doclose = close_app(handles, getappdata(handles.root, 'lang'));
if doclose
    close all;
end


% --- Executes on button press in btn_opendispersion.
function btn_opendispersion_Callback(hObject, eventdata, handles)
% hObject    handle to btn_opendispersion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load_dispersion_file(handles, getappdata(handles.root, 'lang'));

% --------------------------------------------------------------------
function panel_dispersion_file_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to panel_dispersion_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in unit_h.
function unit_h_Callback(hObject, eventdata, handles)
% hObject    handle to unit_h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns unit_h contents as cell array
%        contents{get(hObject,'Value')} returns selected item from unit_h


% --- Executes during object creation, after setting all properties.
function unit_h_CreateFcn(hObject, eventdata, handles)
% hObject    handle to unit_h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in unit_vsvp.
function unit_vsvp_Callback(hObject, eventdata, handles)
% hObject    handle to unit_vsvp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns unit_vsvp contents as cell array
%        contents{get(hObject,'Value')} returns selected item from unit_vsvp


% --- Executes during object creation, after setting all properties.
function unit_vsvp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to unit_vsvp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in unit_vr.
function unit_vr_Callback(hObject, eventdata, handles)
% hObject    handle to unit_vr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns unit_vr contents as cell array
%        contents{get(hObject,'Value')} returns selected item from unit_vr


% --- Executes during object creation, after setting all properties.
function unit_vr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to unit_vr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in unit_rho.
function unit_rho_Callback(hObject, eventdata, handles)
% hObject    handle to unit_rho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns unit_rho contents as cell array
%        contents{get(hObject,'Value')} returns selected item from unit_rho


% --- Executes during object creation, after setting all properties.
function unit_rho_CreateFcn(hObject, eventdata, handles)
% hObject    handle to unit_rho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on mouse press over axes background.
function plt_dispersion_file_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to plt_dispersion_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function disp_plt_viewlarger_Callback(hObject, eventdata, handles)
% hObject    handle to disp_plt_viewlarger (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plot_large_dispersioncurve(handles, getappdata(handles.root, 'lang'));


% --------------------------------------------------------------------
function dispersion_curve_menu_Callback(hObject, eventdata, handles)
% hObject    handle to dispersion_curve_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in start_button.
function start_button_Callback(hObject, eventdata, handles)
% hObject    handle to start_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
start_inversion(handles, hObject, getappdata(handles.root, 'lang'));


function param_inv_sigma_Callback(hObject, eventdata, handles)
% hObject    handle to param_inv_sigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of param_inv_sigma as text
%        str2double(get(hObject,'String')) returns contents of param_inv_sigma as a double


% --- Executes during object creation, after setting all properties.
function param_inv_sigma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to param_inv_sigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function param_inv_mu_Callback(hObject, eventdata, handles)
% hObject    handle to param_inv_mu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of param_inv_mu as text
%        str2double(get(hObject,'String')) returns contents of param_inv_mu as a double


% --- Executes during object creation, after setting all properties.
function param_inv_mu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to param_inv_mu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function param_maxiter_Callback(hObject, eventdata, handles)
% hObject    handle to param_maxiter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of param_maxiter as text
%        str2double(get(hObject,'String')) returns contents of param_maxiter as a double


% --- Executes during object creation, after setting all properties.
function param_maxiter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to param_maxiter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function param_tolvs_Callback(hObject, eventdata, handles)
% hObject    handle to param_tolvs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of param_tolvs as text
%        str2double(get(hObject,'String')) returns contents of param_tolvs as a double


% --- Executes during object creation, after setting all properties.
function param_tolvs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to param_tolvs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in view_sol_plot.
function view_sol_plot_Callback(hObject, eventdata, handles)
% hObject    handle to view_sol_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
show_plots(handles, getappdata(handles.root, 'lang'));


% --- Executes on button press in export_results.
function export_results_Callback(hObject, eventdata, handles)
% hObject    handle to export_results (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
export_results(handles, hObject, getappdata(handles.root, 'lang'));


% --- Executes on key press with focus on param_inv_sigma and none of its controls.
function param_inv_sigma_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to param_inv_sigma (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over param_inv_sigma.
function param_inv_sigma_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to param_inv_sigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% check_inv_parameters(handles, getappdata(handles.root, 'lang'), true);


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over param_inv_mu.
function param_inv_mu_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to param_inv_mu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on param_inv_mu and none of its controls.
function param_inv_mu_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to param_inv_mu (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
% check_inv_parameters(handles, getappdata(handles.root, 'lang'), true);


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over param_maxiter.
function param_maxiter_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to param_maxiter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on param_maxiter and none of its controls.
function param_maxiter_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to param_maxiter (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
% check_inv_parameters(handles, getappdata(handles.root, 'lang'), true);


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over param_tolvs.
function param_tolvs_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to param_tolvs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on param_tolvs and none of its controls.
function param_tolvs_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to param_tolvs (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
% check_inv_parameters(handles, getappdata(handles.root, 'lang'), true);


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over btn_opendispersion.
function btn_opendispersion_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to btn_opendispersion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on btn_opendispersion and none of its controls.
function btn_opendispersion_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to btn_opendispersion (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected cell(s) is changed in initial_solution.
function initial_solution_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to initial_solution (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_import_table_from_excel_Callback(hObject, eventdata, handles)
% hObject    handle to menu_import_table_from_excel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
import_initialtable_excel(handles, getappdata(handles.root, 'lang'));


% --------------------------------------------------------------------
function menu_add_row_table_Callback(hObject, eventdata, handles)
% hObject    handle to menu_add_row_table (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
add_row(handles);


% --------------------------------------------------------------------
function menu_delete_row_table_Callback(hObject, eventdata, handles)
% hObject    handle to menu_delete_row_table (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete_last_row(handles, getappdata(handles.root, 'lang'));


% --------------------------------------------------------------------
function menu_edit_import_Callback(hObject, eventdata, handles)
% hObject    handle to menu_edit_import (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_import_dispersion_file_Callback(hObject, eventdata, handles)
% hObject    handle to menu_import_dispersion_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load_dispersion_file(handles, getappdata(handles.root, 'lang'));


% --------------------------------------------------------------------
function menu_clean_initial_invparam_Callback(hObject, eventdata, handles)
% hObject    handle to menu_clean_initial_invparam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear_invparam(handles);


% --------------------------------------------------------------------
function menu_preferences_Callback(hObject, eventdata, handles)
% hObject    handle to menu_preferences (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_cfg_app_Callback(hObject, eventdata, handles)
% hObject    handle to menu_cfg_app (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get lang variable
lang = getappdata(handles.root, 'lang');

% Check if gui dir exist, if not a message error is displayed
if exist('gui', 'dir')
    cfg_app(lang, 'main', handles);
else
    disp_error(handles, lang, 128);
end


% --------------------------------------------------------------------
function menu_cfg_plot_Callback(hObject, eventdata, handles)
% hObject    handle to menu_cfg_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_cfg_inversion_Callback(hObject, eventdata, handles)
% hObject    handle to menu_cfg_inversion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get lang variable
lang = getappdata(handles.root, 'lang');

% Check if gui dir exist, if not a message error is displayed
if exist('gui', 'dir')
    cfg_inv(lang, 'main', handles.root);
else
    disp_error(handles, lang, 128);
end


% --------------------------------------------------------------------
function menu_cfg_solution_Callback(hObject, eventdata, handles)
% hObject    handle to menu_cfg_solution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get lang variable
lang = getappdata(handles.root, 'lang');

% Check if gui dir exist, if not a message error is displayed
if exist('gui', 'dir')
    cfg_sol(lang, 'main', handles.root);
else
    disp_error(handles, lang, 128);
end

