function varargout = untitleds(varargin)
% UNTITLEDS MATLAB code for untitleds.fig
%      UNTITLEDS, by itself, creates a new UNTITLEDS or raises the existing
%      singleton*.
%
%      H = UNTITLEDS returns the handle to a new UNTITLEDS or the handle to
%      the existing singleton*.
%
%      UNTITLEDS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLEDS.M with the given input arguments.
%
%      UNTITLEDS('Property','Value',...) creates a new UNTITLEDS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitleds_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitleds_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitleds

% Last Modified by GUIDE v2.5 15-Dec-2022 05:57:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitleds_OpeningFcn, ...
                   'gui_OutputFcn',  @untitleds_OutputFcn, ...
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


% --- Executes just before untitleds is made visible.
function untitleds_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitleds (see VARARGIN)

% Choose default command line output for untitleds
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitleds wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitleds_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X
X=uigetfile('*.*');
X=imread(X);
axes(handles.axes1);
imshow(X);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X
A =Uniform_Noise((X,3,4);
X = A;
axes(handles.axes2);
imshow(X)
