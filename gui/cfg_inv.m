function varargout = cfg_inv(varargin)
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
%      applied to the GUI before cfg_inv_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cfg_inv_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help root

% Last Modified by GUIDE v2.5 27-Jan-2017 19:50:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cfg_inv_OpeningFcn, ...
                   'gui_OutputFcn',  @cfg_inv_OutputFcn, ...
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
function cfg_inv_OpeningFcn(hObject, eventdata, handles, varargin) %#ok<*INUSL>
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
set(handles.root, 'Name', lang{130});
set(handles.panel_initialparams, 'Title', lang{135});
set_lang_string(handles.btn_save, lang{20}, 'string');
set_lang_string(handles.btn_close, lang{147}, 'string');
set(handles.text_mu, 'String', lang{136});
set(handles.text_sigma, 'String', lang{137});
set(handles.text_maxiter, 'String', lang{138});
set(handles.text_tolvs, 'String', lang{139});

% Import config
config_app;
config_inverse;

% Save configs
setappdata(handles.root, 'delete_entry_if_invalid', delete_entry_if_invalid);
setappdata(handles.root, 'gui_sound', gui_sound_enabled);

% Set initial configuration
set(handles.param_inv_mu, 'String', inv_mu);
set(handles.param_inv_sigma, 'String', inv_sigma);
set(handles.param_maxiter, 'String', inv_maxiter);
set(handles.param_tolvs, 'String', inv_tol_vs);

% Center window
movegui(gcf, 'center');

% Choose default command line output for root
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes root wait for user response (see UIRESUME)
% uiwait(handles.root);


% --- Outputs from this function are returned to the command line.
function varargout = cfg_inv_OutputFcn(hObject, eventdata, handles) 
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
config_inverse;

% Check entry status
status = check_inv_parameters(handles, lang, true);
if status
    sigma = get(handles.param_inv_sigma, 'string');
    mu = get(handles.param_inv_mu, 'string');
    maxiter = get(handles.param_maxiter, 'string');
    tol_vs = get(handles.param_tolvs, 'string');
else
    return
end

% Check if something changed
if (str2double(sigma) == inv_sigma) && (str2double(maxiter) == inv_maxiter) && ...
        (str2double(mu) == inv_mu) && (inv_tol_vs == str2double(tol_vs))
else
    
    % Create strings
    str_maxiter = sprintf('inv_maxiter = %s;', maxiter);
    str_mu = sprintf('inv_mu = %s;', mu);
    str_sigma = sprintf('inv_sigma = %s;', sigma);
    str_tolvs = sprintf('inv_tol_vs = %s;', tol_vs);

    % Save config file
    conf_file = fopen('gui/config_inverse.m', 'wt');
    write_conf_header(conf_file, ' INVERSE MATLAB CONFIGURATION', ' Set configurations used by mat_inverse libraries.');
    fprintf(conf_file, '%s\n', '% Maximum number of iterations, used by mat_inverse');
    fprintf(conf_file, '%s\n\n', str_maxiter);
    fprintf(conf_file, '%s\n', '% Mu coefficient, mat_inverse');
    fprintf(conf_file, '%s\n\n', str_mu);
    fprintf(conf_file, '%s\n', '% Vs tolerance error, mat_inverse');
    fprintf(conf_file, '%s\n\n', str_tolvs);
    fprintf(conf_file, '%s\n', '% Sigma, mat_inverse');
    fprintf(conf_file, '%s\n\n', str_sigma);
    fclose(conf_file);
    
    % Set inversion config
    sigma = str2double(sigma);
    mu = str2double(mu);
    maxiter = str2double(maxiter);
    tol_vs = str2double(tol_vs);
    setappdata(root_handles, 'cgf_sigma', sigma);
    setappdata(root_handles, 'cgf_mu', mu);
    setappdata(root_handles, 'cgf_maxiter', maxiter);
    setappdata(root_handles, 'cgf_tolvs', tol_vs);
    
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

