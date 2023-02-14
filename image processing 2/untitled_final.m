function varargout = task(varargin)
% TASK MATLAB code for task.fig
%      TASK, by itself, creates a new TASK or raises the existing
%      singleton*.
%
%      H = TASK returns the handle to a new TASK or the handle to
%      the existing singleton*.
%
%      TASK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TASK.M with the given input arguments.
%
%      TASK('Property','Value',...) creates a new TASK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before task_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to task_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help task

% Last Modified by GUIDE v2.5 19-Dec-2022 01:39:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @task_OpeningFcn, ...
                   'gui_OutputFcn',  @task_OutputFcn, ...
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


% --- Executes just before task is made visible.
function task_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to task (see VARARGIN)

% Choose default command line output for task
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes task wait for user response (see UIRESUME)
% uiwait(handles.figure1);

function frequency_axes_Createfcn(varargin)

% --- Outputs from this function are returned to the command line.
function varargout = task_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in RGBTOGRAY.
function RGBTOGRAY_Callback(hObject, eventdata, handles)
global X
A = RGB2GRAY (X,1);
X = A;

axes(handles.axes2);
imshow(X);

% --- Executes on button press in RGBtoBinary.
function RGBtoBinary_Callback(hObject, eventdata, handles)
global X
A = gray2bin(X);
X = A;
axes(handles.axes2);
imshow(X)

% --- Executes on button press in GraytoBinary.
function GraytoBinary_Callback(hObject, eventdata, handles)
global X
A = gray2bin(X);
X = A;
axes(handles.axes2);
imshow(X)

% --- Executes on button press in histogram.
function histogram_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
histogram_rgb_gray(X);


% --- Executes on button press in contraststretching.
function contraststretching_Callback(hObject, eventdata, handles)
global X
A=contrast_stretcing(X);
X = A;
axes(handles.axes2);
imshow(X)


% --- Executes on button press in histogram_equalization.
function histogram_equalization_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
histogram_equalization(X);


% --- Executes on button press in Brightness.
function Brightness_Callback(hObject, eventdata, handles)
global X
A = Brightness(X,128);
X = A;
axes(handles.axes2);
imshow(X)


% --- Executes on button press in Negative.
function Negative_Callback(hObject, eventdata, handles)
global X
A = negative(X);
X = A;
axes(handles.axes2);
imshow(X)


% --- Executes on button press in LOG.
function LOG_Callback(hObject, eventdata, handles)
global X
A =LOG_EXP(X);
X = A;
axes(handles.axes2);
imshow(X)


% --- Executes on button press in in_LOG.
function in_LOG_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
in_LOG_EXP(X);



% --- Executes on button press in power.
function power_Callback(hObject, eventdata, handles)
global X
A =powers(X,0.6);
X = A;
axes(handles.axes2);
imshow(X)


% --- Executes on button press in root.
function root_Callback(hObject, eventdata, handles)
global X
A =root(X);
X = A;
axes(handles.axes2);
imshow(X)


% --- Executes on button press in averagefilter.
function averagefilter_Callback(hObject, eventdata, handles)
global X
w=fspecial('average', [3 3]);
A=imfilter(X,w);
X = A;
axes(handles.axes2);
imshow(X)


% --- Executes on button press in weightfilter.
function weightfilter_Callback(hObject, eventdata, handles)
global X
w=[1 2 1;2 4 2;1 2 1]*(1/16);
A=imfilter(X,w);
X = A;
axes(handles.axes2);
imshow(X)


% --- Executes on button press in medianfilter.
function medianfilter_Callback(hObject, eventdata, handles)
global X
X=imnoise(X,'salt & pepper',0.02);
axes(handles.axes1);
imshow(X)
A=medfilt2(X,[3 3]);
X = A;
axes(handles.axes2);
imshow(X)


% --- Executes on button press in laplacianfilter.
function laplacianfilter_Callback(hObject, eventdata, handles)
global X
w=fspecial('laplacian', 0);
A=imfilter(X,w);
X = A;
axes(handles.axes2);
imshow(X)


% --- Executes on button press in unsharp.
function unsharp_Callback(hObject, eventdata, handles)
global X
w=fspecial('average', [3 3]);
s=imfilter(X,w);
mask=X-s;
unsharp=X+mask;
axes(handles.axes2);
imshow(unsharp)


% --- Executes on button press in highboost.
function highboost_Callback(hObject, eventdata, handles)
global X
w=fspecial('average', [3 3]);
s=imfilter(X,w);
mask=X-s;
unsharp=X+mask;
high_boost=X+mask*3;
axes(handles.axes2);
imshow(high_boost)


% --- Executes on button press in sobel_rebortr.
function sobel_rebortr_Callback(hObject, eventdata, handles)
Line_Detection


% --- Executes on button press in gradient.
function gradient_Callback(hObject, eventdata, handles)
global X
h=fspecial('sobel');
v=h';
a=imfilter(X,h);
b=imfilter(X,v);
g=abs(a)+abs(b);
axes(handles.axes2);
imshow(g)


% --- Executes on button press in min.
function min_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
min_filter(X);


% --- Executes on button press in max.
function max_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
max_filter(X);


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
cla(handles.axes1,'reset')
cla(handles.axes2,'reset')


% --- Executes on button press in MidPoint.
function MidPoint_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
MidPoint(X);


% --- Executes on button press in median_filter_rgb.
function median_filter_rgb_Callback(hObject, eventdata, handles)
global X
X=imnoise(X,'salt & pepper',0.02);
axes(handles.axes1);
imshow(X)
axes(handles.axes2);
median_filter_rgb(X);


% --- Executes on button press in FourierTransformation.
function FourierTransformation_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
fourier_transform_n(X)






% --- Executes on button press in inverseFourierTransformation.
function inverseFourierTransformation_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
inverse_fourier_transform(X)



% --- Executes on button press in butterworthHigh.
function butterworthHigh_Callback(hObject, eventdata, handles)
global X
A = butterworth_high(X,30,1);
X = A;
axes(handles.axes2);
imshow(X)


% --- Executes on button press in butterworthlow.
function butterworthlow_Callback(hObject, eventdata, handles)
global X
A = butterworth_low(X,30,1);
X = A;
axes(handles.axes2);
imshow(X)



% --- Executes on button press in IdleHigh.
function IdleHigh_Callback(hObject, eventdata, handles)
global X
A = idealhigh(X,18);
X = A;
axes(handles.axes2);
imshow(X)


% --- Executes on button press in Idlelow.
function Idlelow_Callback(hObject, eventdata, handles)
global X
A = ideal_low(X,50);
X = A;
axes(handles.axes2);
imshow(X)



% --- Executes on button press in GaussianHigh.
function GaussianHigh_Callback(hObject, eventdata, handles)
global X
A = gaussian_high(X,20);
X = A;
axes(handles.axes2);
imshow(X)



% --- Executes on button press in GaussianLow.
function GaussianLow_Callback(hObject, eventdata, handles)
global X
A = gaussian_low(X,25);
X = A;
axes(handles.axes2);
imshow(X)



% --- Executes on button press in Exponential_Noise.
function Exponential_Noise_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
exp_noise(X,50)


% --- Executes on button press in Gaussian_Normal_Noise.
function Gaussian_Normal_Noise_Callback(hObject, eventdata, handles)
global X
A =  Gaussian_Normal_Noise(X,5,12);
X = A;
axes(handles.axes2);
imshow(X)



% --- Executes on button press in Bipoler_SaltandPepper_Noise.
function Bipoler_SaltandPepper_Noise_Callback(hObject, eventdata, handles)
global X
A = Bipoler_SaltandPepper_Noise(X,0.3,0.4);
X = A;
axes(handles.axes2);
imshow(X)





% --- Executes on button press in Erlang_Gamma_Noise.
function Erlang_Gamma_Noise_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
gamma_noise(X,100,100);


% --- Executes on button press in Uniform_Noise.
function Uniform_Noise_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
uniformNoise(X,100,100,100);


% --- Executes on button press in Ryligh_Niose.
function Ryligh_Niose_Callback(hObject, eventdata, handles)

global X
axes(handles.axes2);
rayligh_noisse(X,100,100);


% --- Executes on button press in Uniform_Noise_RGB.
function Uniform_Noise_RGB_Callback(hObject, eventdata, handles)
% hObject    handle to Uniform_Noise_RGB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X
axes(handles.axes2);
uniformNoise_rgb(X,200,200,200);


% --- Executes on button press in Gaussianlow_rgb.
function Gaussianlow_rgb_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
gaussian_rgb_low(X,20);

% --- Executes on button press in GaussianHigh_rgb.
function GaussianHigh_rgb_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
gaussian_rgb(X,20);


% --- Executes on button press in idlelow_rgb.
function idlelow_rgb_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
ideal_low_rgb(X,20);


% --- Executes on button press in IdleHigh_rgb.
function IdleHigh_rgb_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
ideal_high_rgb(X,20);


% --- Executes on button press in butterlow_rgb.
function butterlow_rgb_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
butterworth_l_RGB(X,20,1);


% --- Executes on button press in butterworthHigh_rgb.
function butterworthHigh_rgb_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
butterworth_h_RGB(X,20,1);


% --- Executes on button press in pushbutton79.
function pushbutton79_Callback(hObject, eventdata, handles)
global X
global i
cla(handles.axes1,'reset')
cla(handles.axes2,'reset')
X=i;
axes(handles.axes1);
imshow(X);


% --- Executes on button press in Line_Sharpening.
function Line_Sharpening_Callback(hObject, eventdata, handles)
Line_Sharpening


% --- Executes on button press in point_detection.
function point_detection_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
PointDetection(X);


% --- Executes on button press in Point_Sharpening.
function Point_Sharpening_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
PointSharpening(X);


% --- Executes on button press in correlation.
function correlation_Callback(hObject, eventdata, handles)
global X
axes(handles.axes2);
Correlation(X);
