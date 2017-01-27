function varargout = cfg_app(varargin)
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
%      applied to the GUI before cfg_app_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cfg_app_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help root

% Last Modified by GUIDE v2.5 27-Jan-2017 01:07:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cfg_app_OpeningFcn, ...
                   'gui_OutputFcn',  @cfg_app_OutputFcn, ...
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
function cfg_app_OpeningFcn(hObject, eventdata, handles, varargin) %#ok<*INUSL>
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to root (see VARARGIN)

% Check if application is opened from main
if ~ (length(varargin)==2 && strcmp(varargin{2}, 'main'))
    close;
end

% Set main variables
lang = varargin{1}; %#ok<*NASGU>
setappdata(handles.root, 'lang', lang);

% Set app strings
set(handles.root, 'Name', lang{122});
set_lang_string(handles.btn_save, lang{20}, 'string');
set_lang_string(handles.btn_close, lang{22}, 'string');
set_lang_string(handles.text_lang, lang{123}, 'string');
set_lang_string(handles.text_sound, lang{124}, 'string');
set_lang_string(handles.text_delete_invalid_entry, lang{125}, 'string');

% Import config
config_app;

% Save configs
setappdata(handles.root, 'gui_sound', gui_sound_enabled);

% Set app config values
set(handles.conf_lang, 'Value', lang_id);
if delete_entry_if_invalid
    set(handles.cfg_delete_inv_entry, 'Value', 1.0);
else
    set(handles.cfg_delete_inv_entry, 'Value', 0.0);
end
if gui_sound_enabled
    set(handles.cfg_sound, 'Value', 1.0);
else
    set(handles.cfg_sound, 'Value', 0.0);
end

% Center window
movegui(gcf,'center');

% Choose default command line output for root
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes root wait for user response (see UIRESUME)
% uiwait(handles.root);


% --- Outputs from this function are returned to the command line.
function varargout = cfg_app_OutputFcn(hObject, eventdata, handles) 
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

% Get configs
selected_lang = get(handles.conf_lang, 'Value');
selected_delt = get(handles.cfg_delete_inv_entry, 'Value');
selected_sound = get(handles.cfg_sound, 'Value');

% Set config strings
str_lang = sprintf('lang_id = %d;', selected_lang);
if selected_delt
    str_delt = 'delete_entry_if_invalid = true;';
else
    str_delt = 'delete_entry_if_invalid = false;';
end
if selected_sound
    str_sound = 'gui_sound_enabled = true;';
else
    str_sound = 'gui_sound_enabled = false;';
end

% Save config file
conf_file = fopen('gui/config_app.m', 'wt');
write_conf_header(conf_file, ' GUI APP CONFIGURATION', ' GUI Configuration.');
fprintf(conf_file, '%s\n', '% Language id selection');
fprintf(conf_file, '%s\n', '%   1:  English (United States)');
fprintf(conf_file, '%s\n', '%   2:  Spanish (Español)');
fprintf(conf_file, '%s\n', '%   3:  French (Français)');
fprintf(conf_file, '%s\n\n', str_lang);
fprintf(conf_file, '%s\n', '% Deletes entry if invalid');
fprintf(conf_file, '%s\n\n', str_delt);
fprintf(conf_file, '%s\n', '% Enable GUI sounds');
fprintf(conf_file, '%s\n\n', str_sound);
fclose(conf_file);

% Display message and close app
if getappdata(handles.root, 'gui_sound')
    beep();
end
waitfor(msgbox(lang{127}, lang{126}, 'help'));
close;


% --- Executes on button press in btn_close.
function btn_close_Callback(hObject, eventdata, handles)
% hObject    handle to btn_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;


% --- Executes on button press in cfg_sound.
function cfg_sound_Callback(hObject, eventdata, handles)
% hObject    handle to cfg_sound (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cfg_sound


% --- Executes on button press in cfg_delete_inv_entry.
function cfg_delete_inv_entry_Callback(hObject, eventdata, handles)
% hObject    handle to cfg_delete_inv_entry (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cfg_delete_inv_entry
