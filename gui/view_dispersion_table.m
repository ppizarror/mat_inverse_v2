function varargout = view_dispersion_table(varargin)
% VIEW_DISPERSION_TABLE MATLAB code for view_dispersion_table.fig
%      VIEW_DISPERSION_TABLE, by itself, creates a new VIEW_DISPERSION_TABLE or raises the existing
%      singleton*.
%
%      H = VIEW_DISPERSION_TABLE returns the handle to a new VIEW_DISPERSION_TABLE or the handle to
%      the existing singleton*.
%
%      VIEW_DISPERSION_TABLE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VIEW_DISPERSION_TABLE.M with the given input arguments.
%
%      VIEW_DISPERSION_TABLE('Property','Value',...) creates a new VIEW_DISPERSION_TABLE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before view_dispersion_table_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to view_dispersion_table_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help view_dispersion_table

% Last Modified by GUIDE v2.5 09-Feb-2017 16:24:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @view_dispersion_table_OpeningFcn, ...
                   'gui_OutputFcn',  @view_dispersion_table_OutputFcn, ...
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


% --- Executes just before view_dispersion_table is made visible.
function view_dispersion_table_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to view_dispersion_table (see VARARGIN)

% Choose default command line output for view_dispersion_table
handles.output = hObject;

% Check if application is opened from main
if ~ (length(varargin)==3 && strcmp(varargin{2}, 'main'))
    close;
end

% Set main variables
lang = varargin{1}; %#ok<*NASGU>
setappdata(handles.root, 'lang', lang);
setappdata(handles.root, 'main_handles', varargin{3});

% Set app lang
set(handles.root, 'Name', lang{146});

% Set table
freq = getappdata(varargin{3}, 'disp_freq');
vrexp = getappdata(varargin{3}, 'disp_vrexp');
[nCols, ~] = size(vrexp);

% If data exists
if nCols ~= 0
    % Create new cell structure
    tabl = cell(nCols, 2);
    tabl_nom = cell(nCols, 1);

    % Copy data to new cell structures
    for i=1:nCols
        tabl{i, 1}=freq(i);
        tabl{i, 2}=vrexp(i);
        tabl_nom{i}=strcat('f', num2str(i));
    end

    % Store data to table object
    set(handles.table, 'Data', tabl);
    set(handles.table, 'RowName', tabl_nom);
else
    close;
end

% Center window
movegui(gcf, 'center');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes view_dispersion_table wait for user response (see UIRESUME)
% uiwait(handles.root);


% --- Outputs from this function are returned to the command line.
function varargout = view_dispersion_table_OutputFcn(hObject, eventdata, handles)  %#ok<*INUSL>
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
