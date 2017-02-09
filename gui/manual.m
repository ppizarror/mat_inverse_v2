function varargout = manual(varargin)
% MANUAL MATLAB code for manual.fig
%      MANUAL, by itself, creates a new MANUAL or raises the existing
%      singleton*.
%
%      H = MANUAL returns the handle to a new MANUAL or the handle to
%      the existing singleton*.
%
%      MANUAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MANUAL.M with the given input arguments.
%
%      MANUAL('Property','Value',...) creates a new MANUAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before manual_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to manual_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help manual

% Last Modified by GUIDE v2.5 26-Jan-2017 09:57:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @manual_OpeningFcn, ...
                   'gui_OutputFcn',  @manual_OutputFcn, ...
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


% --- Executes just before manual is made visible.
function manual_OpeningFcn(hObject, eventdata, handles, varargin) %#ok<*INUSL>
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to manual (see VARARGIN)

% Choose default command line output for manual
handles.output = hObject;

% Center window
movegui(gcf, 'center');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes manual wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = manual_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

