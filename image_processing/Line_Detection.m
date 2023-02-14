function varargout = Line_Detection(varargin)
% LINE_DETECTION MATLAB code for Line_Detection.fig
%      LINE_DETECTION, by itself, creates a new LINE_DETECTION or raises the existing
%      singleton*.
%
%      H = LINE_DETECTION returns the handle to a new LINE_DETECTION or the handle to
%      the existing singleton*.
%
%      LINE_DETECTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LINE_DETECTION.M with the given input arguments.
%
%      LINE_DETECTION('Property','Value',...) creates a new LINE_DETECTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Line_Detection_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Line_Detection_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Line_Detection

% Last Modified by GUIDE v2.5 19-Dec-2022 22:16:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Line_Detection_OpeningFcn, ...
                   'gui_OutputFcn',  @Line_Detection_OutputFcn, ...
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


% --- Executes just before Line_Detection is made visible.
function Line_Detection_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Line_Detection (see VARARGIN)

% Choose default command line output for Line_Detection
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Line_Detection wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Line_Detection_OutputFcn(hObject, eventdata, handles) 
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



% --- Executes on button press in Horizental.
function Horizental_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
line_detect_horizintal(X);




% --- Executes on button press in Left_Diagonal.
function Left_Diagonal_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
line_detect_left_di(X);


% --- Executes on button press in Vertical.
function Vertical_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
line_detect_vertical(X);

% --- Executes on button press in Right_Diagonal.
function Right_Diagonal_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
line_detect_right_di(X);

% --- Executes on button press in Horizental_robert.
function Horizental_robert_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
line_detect_robert_horizntal(X);


% --- Executes on button press in vertical_robert.
function vertical_robert_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
line_detect_robert_vertical(X);

% --- Executes on button press in right_robert.
function right_robert_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
line_detect_robert_right(X);
% --- Executes on button press in left_robert.
function left_robert_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
line_detect_robert_left(X);


% --- Executes on button press in z.
function z_Callback(hObject, eventdata, handles)
global X
global i
cla(handles.axes1,'reset')
cla(handles.axes2,'reset')

X=i;
axes(handles.axes1);
imshow(X);
