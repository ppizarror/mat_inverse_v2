function varargout = cfg_sol(varargin)
% ROOT MATLAB code for root.fig
%      ROOT, by itself, creates a new ROOT or raises the existing
%      singleton*.
%
%      H = ROOT returns the handle to a new ROOT or the handle to
%      the existing singleton*.
%
%      ROOT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ROOT.M with the given input arguments.
%
%      ROOT('Property','Value',...) creates a new ROOT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cfg_sol_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cfg_sol_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help root

% Last Modified by GUIDE v2.5 27-Jan-2017 20:27:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cfg_sol_OpeningFcn, ...
                   'gui_OutputFcn',  @cfg_sol_OutputFcn, ...
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


% --- Executes just before root is made visible.
function cfg_sol_OpeningFcn(hObject, eventdata, handles, varargin) %#ok<*INUSL>
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to root (see VARARGIN)

% Check if application is opened from main
if ~ (length(varargin)==3 && strcmp(varargin{2}, 'main'))
    close;
end

% Set main variables
lang = varargin{1}; %#ok<*NASGU>
setappdata(handles.root, 'lang', lang);
setappdata(handles.root, 'main_handles', varargin{3});

% Set app strings
set(handles.root, 'Name', lang{129});
set_lang_string(handles.btn_save, lang{20}, 'string');
set_lang_string(handles.btn_close, lang{147}, 'string');
set_lang_string(handles.text_comparision, lang{132}, 'string');
set_lang_string(handles.text_shear, lang{133}, 'string');
set_lang_string(handles.text_iteration, lang{134}, 'string');
set_lang_string(handles.text_shear_comparision, lang{140}, 'string');

% Import config
config_solution;
config_app;

% Set config values
if show_dispersion_comparision
    set(handles.cfg_comparision, 'Value', 1.0);
end
if show_shear_velocity_plot
    set(handles.cfg_shear, 'Value', 1.0);
end
if show_dispersion_iterations
    set(handles.cfg_iteration, 'Value', 1.0);
end
if show_shear_velocity_comparision
    set(handles.cfg_comparision_shear, 'Value', 1.0);
end

% Save configs
setappdata(handles.root, 'gui_sound', gui_sound_enabled);

% Center window
movegui(gcf, 'center');

% Choose default command line output for root
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes root wait for user response (see UIRESUME)
% uiwait(handles.root);


% --- Outputs from this function are returned to the command line.
function varargout = cfg_sol_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in conf_lang.
function conf_lang_Callback(hObject, eventdata, handles)
% hObject    handle to conf_lang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns conf_lang contents as cell array
%        contents{get(hObject,'Value')} returns selected item from conf_lang


% --- Executes during object creation, after setting all properties.
function conf_lang_CreateFcn(hObject, eventdata, handles) %#ok<*INUSD,*DEFNU>
% hObject    handle to conf_lang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_save.
function btn_save_Callback(hObject, eventdata, handles)
% hObject    handle to btn_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get lang
lang = getappdata(handles.root, 'lang');

% Get original handles
root_handles = getappdata(handles.root, 'main_handles');

% Import config
config_solution;

% Get configs
comparision = get(handles.cfg_comparision, 'Value');
shear = get(handles.cfg_shear, 'Value');
iteration = get(handles.cfg_iteration, 'Value');
shear_comparision = get(handles.cfg_comparision_shear, 'Value');

% Check if something changed
if (comparision == show_dispersion_comparision) && (shear == show_shear_velocity_plot) && ...
        (show_dispersion_iterations == iteration) && (shear_comparision == show_shear_velocity_comparision)
else
    
    % Set config strings
    if comparision
        str_comparision = 'show_dispersion_comparision = true;';
    else
        str_comparision = 'show_dispersion_comparision = false;';
    end
    if shear
        str_shear = 'show_shear_velocity_plot = true;';
    else
        str_shear = 'show_shear_velocity_plot = false;';
    end
    if iteration
        str_iteration = 'show_dispersion_iterations = true;';
    else
        str_iteration = 'show_dispersion_iterations = false;';
    end
    if shear_comparision
        str_shear_comparision = 'show_shear_velocity_comparision = true;';
    else
        str_shear_comparision = 'show_shear_velocity_comparision = false;';
    end

    % Save config file
    conf_file = fopen('gui/config_solution.m', 'wt');
    write_conf_header(conf_file, ' SOLUTION CONFIGURATION', ' Configures solution behaviour.');
    fprintf(conf_file, '%s\n', '% Show Calculated vs Experimental dispersion curve');
    fprintf(conf_file, '%s\n\n', str_comparision);
    fprintf(conf_file, '%s\n', '% Show Shear velocity on depth plot');
    fprintf(conf_file, '%s\n\n', str_shear);
    fprintf(conf_file, '%s\n', '% Show Calculated dispersion - iteration changes');
    fprintf(conf_file, '%s\n\n', str_iteration);
    fprintf(conf_file, '%s\n', '% Show shear velocity comparision');
    fprintf(conf_file, '%s\n\n', str_shear_comparision);
    fclose(conf_file);
   
    % Set changes
    setappdata(root_handles, 'show_dispersion_comparision', comparision);
    setappdata(root_handles, 'show_shear_velocity_plot', shear);
    setappdata(root_handles, 'show_dispersion_iterations', iteration);
    setappdata(root_handles, 'show_shear_velocity_comparision', shear_comparision);
    
end
close;


% --- Executes on button press in btn_close.
function btn_close_Callback(hObject, eventdata, handles)
% hObject    handle to btn_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;


% --- Executes on button press in cfg_shear.
function cfg_shear_Callback(hObject, eventdata, handles)
% hObject    handle to cfg_shear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cfg_shear


% --- Executes on button press in cfg_delete_inv_entry.
function cfg_delete_inv_entry_Callback(hObject, eventdata, handles)
% hObject    handle to cfg_delete_inv_entry (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cfg_delete_inv_entry


% --- Executes on button press in cfg_comparision.
function cfg_comparision_Callback(hObject, eventdata, handles)
% hObject    handle to cfg_comparision (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cfg_comparision


% --- Executes on button press in cfg_iteration.
function cfg_iteration_Callback(hObject, eventdata, handles)
% hObject    handle to cfg_iteration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cfg_iteration


% --- Executes on button press in cfg_comparision_shear.
function cfg_comparision_shear_Callback(hObject, eventdata, handles)
% hObject    handle to cfg_comparision_shear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cfg_comparision_shear

