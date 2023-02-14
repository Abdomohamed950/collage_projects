function varargout = Line_Sharpening(varargin)
% LINE_SHARPENING MATLAB code for Line_Sharpening.fig
%      LINE_SHARPENING, by itself, creates a new LINE_SHARPENING or raises the existing
%      singleton*.
%
%      H = LINE_SHARPENING returns the handle to a new LINE_SHARPENING or the handle to
%      the existing singleton*.
%
%      LINE_SHARPENING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LINE_SHARPENING.M with the given input arguments.
%
%      LINE_SHARPENING('Property','Value',...) creates a new LINE_SHARPENING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Line_Sharpening_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Line_Sharpening_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Line_Sharpening

% Last Modified by GUIDE v2.5 16-Dec-2022 05:16:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Line_Sharpening_OpeningFcn, ...
                   'gui_OutputFcn',  @Line_Sharpening_OutputFcn, ...
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


% --- Executes just before Line_Sharpening is made visible.
function Line_Sharpening_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Line_Sharpening (see VARARGIN)

% Choose default command line output for Line_Sharpening
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Line_Sharpening wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Line_Sharpening_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in upload.
function upload_Callback(hObject, eventdata, handles)
global X
global i
X=uigetfile('*.*');
X=imread(X);
i=X;
axes(handles.axes1);
imshow(X);


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
cla(handles.axes1,'reset')
cla(handles.axes2,'reset')


% --- Executes on button press in Horizintal.
function Horizintal_Callback(hObject, eventdata, handles)
global X
filtter=[0 1 0;0 1 0;0 -1 0 ]; 
axes(handles.axes2);
line_sharp(X,filtter);


% --- Executes on button press in Vertical.
function Vertical_Callback(hObject, eventdata, handles)
global X
filtter=[ 0 0 0;1 1 -1;0 0 0]; 
axes(handles.axes2);
line_sharp(X,filtter);


% --- Executes on button press in right_diagonal.
function right_diagonal_Callback(hObject, eventdata, handles)
global X
filtter=[ 0 0 1 ;0 1 0 ;-1 00 0 ];
axes(handles.axes2);
line_sharp(X,filtter);


% --- Executes on button press in left_diagonal.
function left_diagonal_Callback(hObject, eventdata, handles)
global X
filtter=[ 1 0 0 ;0 1 0 ;0 0 -1 ];
axes(handles.axes2);
line_sharp(X,filtter);
