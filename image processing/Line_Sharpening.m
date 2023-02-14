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

% Last Modified by GUIDE v2.5 19-Jan-2021 01:22:41

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



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
path=uigetimagefile();
img= imread(path);
imshow(img, [], 'Parent', handles.axes1);
handles.img = img;
guidata(hObject, handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
GUI;
close(Line_Sharpening);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(Line_Sharpening);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img = handles.img;
filtter=[ 0 1 0;0 1 0;0 -1 0 ]; 
[h,w,l] =size(img);
[fh,fw] = size(filtter);
NImg=zeros(h,w,l);
FImg=zeros(h+2,w+2,l);
for k=1:l
for i=1:h
    for j=1:w
        FImg(i+1,j+1,k)=img(i,j,k);
    end
end
end
m = zeros(fh,fw);
for k=1:l
for i=1:h
    for j=1:w
        m = FImg(i:i+fh-1, j:j+fh-1,k);
        NImg(i,j,k) = sum(sum(m .* filtter));
    end
end
end
output_image=uint8(NImg);
imshow(output_image, [], 'Parent', handles.axes2);




function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img = handles.img;
filtter=[ 0 0 0;1 1 -1;0 0 0 ]; 
[h,w,l] =size(img);
[fh,fw] = size(filtter);
NImg=zeros(h,w,l);
FImg=zeros(h+2,w+2,l);
for k=1:l
for i=1:h
    for j=1:w
        FImg(i+1,j+1,k)=img(i,j,k);
    end
end
end
m = zeros(fh,fw);
for k=1:l
for i=1:h
    for j=1:w
        m = FImg(i:i+fh-1, j:j+fh-1,k);
        NImg(i,j,k) = sum(sum(m .* filtter));
    end
end
end
output_image=uint8(NImg);
imshow(output_image, [], 'Parent', handles.axes2);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img = handles.img;
filtter=[ 1 0 0 ;0 1 0;0 0 -1 ];
[h,w,l] =size(img);
[fh,fw] = size(filtter);
NImg=zeros(h,w,l);
FImg=zeros(h+2,w+2,l);
for k=1:l
for i=1:h
    for j=1:w
        FImg(i+1,j+1,k)=img(i,j,k);
    end
end
end
m = zeros(fh,fw);
for k=1:l
for i=1:h
    for j=1:w
        m = FImg(i:i+fh-1, j:j+fh-1,k);
        NImg(i,j,k) = sum(sum(m .* filtter));
    end
end
end
output_image=uint8(NImg);
imshow(output_image, [], 'Parent', handles.axes2);


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img = handles.img;
filtter=[ 0 0 1 ;0 1 0 ;-1 0 0 ];
[h,w,l] =size(img);
[fh,fw] = size(filtter);
NImg=zeros(h,w,l);
FImg=zeros(h+2,w+2,l);
for k=1:l
for i=1:h
    for j=1:w
        FImg(i+1,j+1,k)=img(i,j,k);
    end
end
end
m = zeros(fh,fw);
for k=1:l
for i=1:h
    for j=1:w
        m = FImg(i:i+fh-1, j:j+fh-1,k);
        NImg(i,j,k) = sum(sum(m .* filtter));
    end
end
end
output_image=uint8(NImg);
imshow(output_image, [], 'Parent', handles.axes2);
