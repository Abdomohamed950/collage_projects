from tkinter import *
import cv2
from tkinter import messagebox
from matplotlib import image
import numpy as np
from PIL import ImageTk, Image
from skimage import io
import matplotlib.pyplot as plt
from skimage.util import random_noise
from tkinter.filedialog import askopenfilename
from skimage.filters import median
from scipy.fft import fft, fft2, ifft, ifft2
from scipy.ndimage import maximum_filter, minimum_filter
from scipy import ndimage, misc
import os

root = Tk()
root.iconbitmap('project-management.ico')
#-------------------icons -------------------------
root.title("Image Processing ...")
icon_change = PhotoImage(file=r'project-management.png')
bcon1 = PhotoImage(file=r'brightness.png')
bcon2 = PhotoImage(file=r'knowledge.png')
bcon3 = PhotoImage(file=r'gamma.png')
bcon4 = PhotoImage(file=r'contrast.png')
bcon5 = PhotoImage(file=r'histogram1.png')
bcon6 = PhotoImage(file=r'3d-modeling.png')
bcon7 = PhotoImage(file=r'blind.png')
bcon8 = PhotoImage(file=r'high-visibility.png')
bcon9 = PhotoImage(file=r'histogram.png')
bcon11 = PhotoImage(file=r'uniform.png')
bcon12 = PhotoImage(file=r'salt.png')
bcon13 = PhotoImage(file=r'cracked.png')
bcon14 = PhotoImage(file=r'gray.png')
bcon15 = PhotoImage(file=r'noise.png')
bcon16 = PhotoImage(file=r'image.png')
bcon17 = PhotoImage(file=r'min.png')
bcon18 = PhotoImage(file=r'max.png')
bcon19 = PhotoImage(file=r'clear.png')
#--------------------End Of Icons------------------

root.configure(background='#8e9e95')

#------------------function to change image-----------
f2 = LabelFrame(root, font=("Consolas", 12, 'bold'), bg='#8e9e95', fg='black')
f2.pack(fill=BOTH)
e = Entry(
    f2,
    font=('Consolas', 20, 'bold'),
    borderwidth=2,
)
e.pack(side='left', fill=BOTH, expand=True)
#---------------path textbox------------------
path_e = Entry(
    f2,
    font=('Consolas', 20, 'bold'),
    borderwidth=2,
    bg='black',
    fg='white',
    relief='groove'
)
path_e.pack(side='left', fill=BOTH, expand=True)
#----------------------Change Photo-----------
b = Button(
    f2,
    text='Load Image',
    font=("Consolas", 20, "bold"),
    bg='black',
    fg='white',
    borderwidth=2,
    relief='groove',
    command=lambda: load()
)
b.pack(side='left', fill=BOTH, expand=True)
#--------------------------


#-------------------------
def load():
  global img_2
  img_2 = ''
  filename = askopenfilename()
  path_e.delete(0, END)
  path_e.insert(0, filename)
  img_2 = ImageTk.PhotoImage(Image.open(filename))
  photo_label.config(image=img_2)
#---------------------------- ---------------------
#----------------gray function -----------------


def gray():
  global img, img2, img_f2
  img = cv2.imread(path_e.get(), 0)
  cv2.imwrite('gray_one.png', img)
  img_f2 = ImageTk.PhotoImage(Image.open('gray_one.png'))
  photo_label.config(image=img_f2)
  '''cv2.imshow('Gray Image',img)
  cv2.waitKey(0)
  cv2.destroyAllWindows()'''

#---------------------log.pngness Event--------------------------------


def change():
  #img=cv2.imread(path_e.get(),0)
  img = cv2.imread(path_e.get(), 0)
  r, c = img.shape
  E = e.get()
  if len(E) == 0:
    messagebox.showwarning(
        "Empty Field !!", "Please Fill Up The Box With It's Value")
  else:
    sign = E[0]
    value = E[1:]
    s_list = ['*', '-', '+', '/']
    img_2 = np.zeros((r, c), np.uint8)
    if sign not in s_list:
      messagebox.showwarning(
          "Sign Missed", f"You Should Add Sign like that {s_list} Be careful")
      e.delete(0, END)
    else:
      if sign == '*':
        for i in range(r):
            for j in range(c):
                v = img.item(i, j)*int(value)
                if v > 255:
                    v = 255
                elif v < 0:
                    v = 0
                img_2.itemset((i, j), v)

      elif sign == '+':
          for i in range(r):
              for j in range(c):
                  v = img.item(i, j)+int(value)
                  if v > 255:
                      v = 255
                  elif v < 0:
                      v = 0
                  img_2.itemset((i, j), v)

      elif sign == '-':
          for i in range(r):
              for j in range(c):
                  v = img.item(i, j)-int(value)
                  if v > 255:
                      v = 255
                  elif v < 0:
                      v = 0
                  img_2.itemset((i, j), v)

      elif sign == '/':
          for i in range(r):
              for j in range(c):
                  v = img.item(i, j)
                  if v > 255:
                      v = 255
                  elif v < 0:
                      v = 0
                  img_2.itemset((i, j), v)
      cv2.imshow('log.png', img_2)
      cv2.waitKey(0)
      cv2.destroyAllWindows()
      e.delete(0, END)
#------------------------------log.pngness Event----------------------------

#-----------------------Log Event-------------------------------


def Log():
  img = cv2.imread(path_e.get(), 0)
  r, c = img.shape
  c = 255 / np.log(1 + np.max(img))
  log_img = c * (np.log(img + 1))
  log_img = np.array(log_img, dtype=np.uint8)
  cv2.imshow('Log Transformation', img)
  cv2.waitKey(0)
  cv2.destroyAllWindows()
  e.delete(0, END)
#-----------------------End Of Log Event------------------------

#------------------ Contrast Function --------------


def C_fun(img):
  xmin = img.min()
  xmax = img.max()
  r, c = img.shape  # the dimensions of the image like width and height
  minmax_img = np.zeros((r, c), dtype='uint8')
  ratio = ((255-0)/(xmax-xmin))+0
  # then we will follow up this fromula [ x=(xinput-xmin)/(xmax-xmin)*255 ]
  for i in range(r):
      for j in range(c):
          minmax_img[i, j] = ((img[i, j]-xmin)*ratio)
  return minmax_img
#---------------- End Of Contrast Function ---------------

#----------------- Edge Detection Function -----------


def edges():
  img = cv2.imread(path_e.get(), 0)  # the original Image
  eq = cv2.equalizeHist(img)
  img_blur = cv2.GaussianBlur(img, (3, 3), 0)  # blured Image
  img_stretch = C_fun(img)  # stretched img
  # blured Image after stretched
  img_blur2 = cv2.GaussianBlur(img_stretch, (3, 3), 0)
  img_blur3 = cv2.GaussianBlur(eq, (3, 3), 0)
  E = e.get()
  if len(E) == 0:
    messagebox.showwarning(
        "Empty Field !!", "Please Fill Up The Box With Value [ value + ' edge ' ]")
  else:
    if 'edge' not in E:
      messagebox.showwarning(
          "order Wrong", "Please Set The Correct order [' edge']")
      e.delete(0, END)
    else:
      if E[0] == 'x':
        sobelx = cv2.Sobel(src=img_blur, ddepth=cv2.CV_64F,
                           dx=1, dy=0, ksize=5)  # x edges
        cv2.imshow('X Edge Detect', sobelx)
        cv2.waitKey(0)
        cv2.destroyAllWindows()
        e.delete(0, END)
      #------------------------------
      elif E[0] == 'y':
        sobelx = cv2.Sobel(src=img_blur, ddepth=cv2.CV_64F,
                           dx=0, dy=1, ksize=5)  # x edges
        cv2.imshow('Y Edge Detect', sobelx)
        cv2.waitKey(0)
        cv2.destroyAllWindows()
        e.delete(0, END)
      #------------------------------
      elif E[0] == 'xy':
        sobelx = cv2.Sobel(src=img_blur, ddepth=cv2.CV_64F,
                           dx=1, dy=1, ksize=5)  # x edges
        cv2.imshow('XY Edge Detect', sobelx)
        cv2.waitKey(0)
        cv2.destroyAllWindows()
        e.delete(0, END)
      #------------------------------
      elif E[0] == 'c':
        edge = cv2.Canny(image=img_blur, threshold1=100,
                         threshold2=10)  # canny edges
        edge_s = cv2.Canny(image=img_blur2, threshold1=100,
                           threshold2=10)  # canny edges after stretch
        edge_s2 = cv2.Canny(image=img_blur3, threshold1=100, threshold2=10)
        cv2.imshow('Canny Edge Detect', edge)
        cv2.imshow('Canny Edge Detect on Stretched Image', edge_s)
        cv2.imshow('Canny Edge Detect on Equalized Image', edge_s2)
        cv2.waitKey(0)
        cv2.destroyAllWindows()
        e.delete(0, END)

#------------------------Bluring----------------------


def bluring():
  img = cv2.imread(path_e.get(), 0)  # the original Image
  E = e.get()
  if len(E) == 0:
    messagebox.showwarning(
        "Empty Field !!", "Please Fill Up The Box With Value [ dim + ' blur ' ]")
  else:
    if 'blur' not in E:
      messagebox.showwarning(
          "order Wrong", "Please Set The Correct string ['blur']")
      e.delete(0, END)
    else:
      if E[0] == '3':
        blur_filter1 = np.ones((3, 3), np.float)/(9.0)
        image_blur1 = cv2.filter2D(img, -1, blur_filter1)
        cv2.imshow('3 * 3', image_blur1)
        cv2.waitKey(0)
        cv2.destroyAllWindows()
        e.delete(0, END)
      #------------------------
      elif E[0] == '5':
        blur_filter2 = np.ones((5, 5), np.float)/(25.0)
        image_blur2 = cv2.filter2D(img, -1, blur_filter2)
        cv2.imshow('5 * 5', image_blur2)
        cv2.waitKey(0)
        cv2.destroyAllWindows()
        e.delete(0, END)
      #------------------------
      elif E[0] == '7':
        blur_filter3 = np.ones((7, 7), np.float)/(49.0)
        image_blur3 = cv2.filter2D(img, -1, blur_filter3)
        cv2.imshow('7 * 7', image_blur3)
        cv2.waitKey(0)
        cv2.destroyAllWindows()
        e.delete(0, END)
      #------------------------
      else:
        messagebox.showwarning("Erorr!!", "dim not available")
        e.delete(0, END)

#-----------------------------End Of Bluring-------------------------


#--------------------------Sharpening----------------------
def sharp():
  img = cv2.imread(path_e.get(), 0)  # the original Image
  E = e.get()
  if len(E) == 0:
    messagebox.showwarning(
        "Empty Field !!", "Fill Up The Box With Value [ ' point ' || ' v ' || ' h ' ]")
  else:
    if (E != 'v') and (E != 'h') and (E != 'point'):
      messagebox.showwarning(
          "order Wrong", "Please Set The Correct Word [ ' point ' || ' v ' || ' h ' ]")
      e.delete(0, END)
    else:
      if E == 'point':
        point = np.array([[0, -1, 0],
                          [-1, 5, -1],
                          [0, -1, 0]])
        sharp_point = cv2.filter2D(img, -1, point)
        cv2.imshow('sharp_point', sharp_point)
        cv2.waitKey(0)
        cv2.destroyAllWindows()
        e.delete(0, END)
      #------------------
      elif E == 'v':
          v = np.array([[0, 0, 0],
                        [1, 1, -1],
                        [0, 0, 0]])
          sharp_v = cv2.filter2D(img, -1, v)
          cv2.imshow('sharp_v', sharp_v)
          cv2.waitKey(0)
          e.delete(0, END)
      #------------------
      elif E == 'h':
          h = np.array([[0, 1, 0],
                        [0, 1, 0],
                        [0, -1, 0]])
          sharp_h = cv2.filter2D(img, -1, h)
          cv2.imshow('sharp_h', sharp_h)
          cv2.waitKey(0)
          e.delete(0, END)
#---------------------------End Of Sharpening------------------

#--------------------------Contrast Stretching Event--------------------


def contrast():
  img = cv2.imread(path_e.get(), 0)
  r, c = img.shape
  E = e.get()
  if len(E) == 0:
    messagebox.showwarning(
        "Empty Field !!", "Please Fill Up The Box With Value ' Stretch '")
  else:
    if E != 'Stretch':
      messagebox.showwarning(
          "order Wrong", "Please Set The Correct order [' Stretch']")
      e.delete(0, END)
    else:
        minmax_img = C_fun(img)
        cv2.imshow('Stretched Image', minmax_img)
        cv2.waitKey(0)
        cv2.destroyAllWindows()
        e.delete(0, END)
#------------------------End Of Stretching-----------------

#-------------------------Noises---------------------------


def SaltAndPepper():
  global img_f2
  img = cv2.imread(path_e.get(), 0)
  if e.get() == '' or (e.get()).isalnum():
    messagebox.showwarning(
        "Empty Field !!", "Please Enter Float Value To Continue..")
    e.delete(0, END)
  else:
    #cv2.imshow("Original_Img", img)
    img_2 = np.copy(img)
    SP_NoiseImg = img
    percetage = float(e.get())
    SP_NoiseNum = int(percetage*img.shape[0]*img.shape[1])
    for i in range(SP_NoiseNum):
        randX = np.random.randint(0, img.shape[0]-1)
        randY = np.random.randint(0, img.shape[1]-1)
        if np.random.randint(0, 1) == 0:
            SP_NoiseImg[randX, randY] = 0
        else:
            SP_NoiseImg[randX, randY] = 255

    cv2.imwrite('sp.png', SP_NoiseImg)
    img_f2 = ImageTk.PhotoImage(Image.open('sp.png'))
    photo_label.config(image=img_f2)

#----------------------guassian Noise--------------------


def gauss():
  global img_f2
  img = cv2.imread(path_e.get(), 0)
  img_2 = random_noise(img, mode='gaussian', seed=None, clip=True)
  cv2.imshow('gauss', img_2)
  cv2.waitKey(0)
  cv2.destroyAllWindows()

#----------------------------------------------------------

#--------------------------Discrete Fourier Transform------------------


def ft():
  global img_f2, img_ft
  img = cv2.imread(path_e.get(), 0)
  f = np.fft.fft2(img)
  fshift = np.fft.fftshift(f)
  magnitude_spectrum = 20*np.log(np.abs(fshift))
  magnitude_spectrum = np.asarray(magnitude_spectrum, dtype=np.uint8)
  cv2.imwrite('fft.png', magnitude_spectrum)
  img_f2 = ImageTk.PhotoImage(Image.open('fft.png'))
  photo_label.config(image=img_f2)
  return fshift
#----------------------------------------------------------------------

#---------------------Inverse discrete Fourier Transform---------------


def ft_i():
  global img_f2
  f_ishift = np.fft.ifftshift(ft())
  img_2 = np.fft.ifft2(f_ishift)
  img_back = np.abs(img_2)
  img_back = np.asarray(img_back, dtype=np.uint8)
  cv2.imwrite('main.png', img_back)
  img_f2 = ImageTk.PhotoImage(Image.open('main.png'))
  photo_label.config(image=img_f2)

#----------------------------------------------------------------------

#------------------------Max Filter----------------------------


def min_filter():
  global img_f2
  img = cv2.imread(path_e.get(), 0)
  result = ndimage.minimum_filter(img, size=2, mode='grid-constant', cval=0.0)
  cv2.imwrite('min_filter.png', result)
  img_f2 = ImageTk.PhotoImage(Image.open('min_filter.png'))
  photo_label.config(image=img_f2)
#--------------------------------------------------------------

#------------------------Min Filter----------------------------


def max_filter():
  global img_f2
  img = cv2.imread(path_e.get(), 0)
  result = ndimage.maximum_filter(img, size=2, mode='grid-constant', cval=0.0)
  cv2.imwrite('max_filter.png', result)
  img_f2 = ImageTk.PhotoImage(Image.open('max_filter.png'))
  photo_label.config(image=img_f2)
#--------------------------------------------------------------

#-------------------------------Median Filter------------------


def med():
  global img_f2
  img = cv2.imread(path_e.get(), 0)
  if e.get() == '':
      messagebox.showwarning(
          "Empty Field !!", "Please Enter int Value For Mask (3,5,7,......)")
      e.delete(0, END)
  else:
    median_gauss = cv2.medianBlur(img, int(e.get()[0]))
    cv2.imwrite('median_filter.png', median_gauss)
    img_f2 = ImageTk.PhotoImage(Image.open('median_filter.png'))
    photo_label.config(image=img_f2)
#------------------------------------------------------------------

#---------------------Gamma----------------------------------------


def gamma():
  img = cv2.imread(path_e.get(), 0)
  r, c = img.shape
  E = e.get()
  if len(E) == 0:
    messagebox.showwarning(
        "Empty Field !!", "Please Fill Up The Box With Following ( value + ' G ' )")
  else:
    v = E[:len(E)-1]
    sign = E[len(E)-1]
    if sign != 'G':
      messagebox.showwarning(
          "Empty Field !!", "Please Fill Up The Box With Following ( value + ' G ' )")
      e.delete(0, END)
    else:
      v = float(E[:len(E)-1])
      im2 = io.imread(path_e.get(), as_gray=True)
      gamma_corrected = np.array(255*(im2**v), dtype=np.uint8)
      cv2.imshow(f"Gamma Corrected With Value of '{ {v} }'", gamma_corrected)
      cv2.waitKey(0)
      cv2.destroyAllWindows()
      e.delete(0, END)
#--------------------------------End Of Gamma--------------------------------

#---------------------Histogram Equalization---------------------------------


def heq():
  img = cv2.imread(path_e.get(), 0)
  equ = cv2.equalizeHist(img)
  stretched = C_fun(img)
  res = np.hstack((stretched, equ))
  cv2.imshow('[ Stretched | Equalized ]', res)
  cv2.waitKey(0)
  cv2.destroyAllWindows()
  fig = plt.figure(figsize=(15, 5))
  ax1 = fig.add_subplot(1, 3, 1)
  plt.hist(img.flatten(), 256, [0, 256], color='r')
  ax1.set_title('original Histogram')
  ax2 = fig.add_subplot(1, 3, 2)
  plt.hist(equ.flatten(), 256, [0, 256], color='r')
  ax2.set_title('equlaized Histogram')
  ax3 = fig.add_subplot(1, 3, 3)
  plt.hist(stretched.flatten(), 256, [0, 256], color='r')
  ax3.set_title('Stretched histogram')
  plt.show()
#----------------------End of Equalization----------------------------------

#---------------------------Histogram----------------------------------------


def histo():
  img = cv2.imread(path_e.get(), 0)
  r, c = img.shape
  E = e.get()
  new_hist = np.zeros((256), dtype=int)

  intensity = np.arange(0, 256, 1)  # the range 0 t 255

  for i in range(256):
      new_hist[i] = np.count_nonzero(i == img)

  if E == 'Hist':
    # function that takes the frequencies and the range and give histogram
    plt.bar(intensity, new_hist, color='maroon', width=0.8)
    plt.xlabel('intensity value')
    plt.ylabel('number of pixels')
    plt.title('Histogram of the original image')
    plt.show()
    #---------------------------------after stretched----------------
    minmax_img = C_fun(img)
    new_hist2 = np.zeros((256), dtype=int)

    for c in range(256):
      new_hist2[c] = np.count_nonzero(c == minmax_img)

    # function that takes the frequencies and the range and give histogram
    plt.bar(intensity, new_hist2, color='maroon', width=0.8)
    plt.xlabel('intensity value')
    plt.ylabel('number of pixels')
    plt.title('Histogram of the Stretched image')
    plt.show()
    e.delete(0, END)

  else:
    messagebox.showwarning(
        "Order Wrong", "Please Set The Correct Order [' Hist ']")
    e.delete(0, END)
#---------------------End Of histogram--------------------------------------

#------------------------Begin of The Main Code-----------------------------


photo_label = Label(
    root,
    font=('Consolas', 20, 'bold'),
    text='image Will Show Here',
    bg='#8e9e95',
    fg='black'
)
photo_label.pack(anchor=CENTER)
#-------------------Buttons Processing---------------------------------------

frame = LabelFrame(root, font=("Consolas", 12, 'bold'),
                   bg='#8e9e95', fg='black')
frame.pack(fill=BOTH)
b1 = Button(
    frame,
    font=('Consolas', 20, 'bold'),
    command=change,
    image=bcon1,
    padx=15,
    pady=15,
    bg='#8e9e95',
    fg='black'
)
b1.pack(side='left', expand=True, fill=BOTH)

b2 = Button(
    frame,
    font=('Consolas', 20, 'bold'),
    command=Log,
    image=bcon2,
    padx=15,
    pady=15,
    bg='#8e9e95',
    fg='black'
)
b2.pack(side='left', expand=True, fill=BOTH)

b3 = Button(
    frame,
    font=('Consolas', 20, 'bold'),
    command=gamma,
    image=bcon3,
    padx=15,
    pady=15,
    bg='#8e9e95',
    fg='black'
)
b3.pack(side='left', expand=True, fill=BOTH)

b4 = Button(
    frame,
    font=('Consolas', 20, 'bold'),
    command=contrast,
    image=bcon4,
    padx=15,
    bg='#8e9e95',
    fg='black',
    pady=15,
)
b4.pack(side='left', expand=True, fill=BOTH)

b5 = Button(
    frame,
    font=('Consolas', 20, 'bold'),
    command=histo,
    image=bcon5,
    padx=22,
    pady=15,
    bg='#8e9e95',
    fg='black'
)
b5.pack(side='left', expand=True, fill=BOTH)

b6 = Button(
    frame,
    font=('Consolas', 20, 'bold'),
    command=edges,
    image=bcon6,
    padx=22,
    pady=15,
    bg='#8e9e95',
    fg='black'
)
b6.pack(side='left', expand=True, fill=BOTH)

b7 = Button(
    frame,
    font=('Consolas', 20, 'bold'),
    command=bluring,
    image=bcon7,
    padx=22,
    pady=15,
    bg='#8e9e95',
    fg='black'
)
b7.pack(side='left', expand=True, fill=BOTH)

b8 = Button(
    frame,
    font=('Consolas', 20, 'bold'),
    command=sharp,
    image=bcon8,
    padx=22,
    pady=15,
    bg='#8e9e95',
    fg='black'
)
b8.pack(side='left', expand=True, fill=BOTH)

b9 = Button(
    frame,
    font=('Consolas', 20, 'bold'),
    command=heq,
    image=bcon9,
    padx=22,
    pady=15,
    bg='#8e9e95',
    fg='black'
)
b9.pack(side='left', expand=True, fill=BOTH)

b10 = Button(
    frame,
    font=('Consolas', 20, 'bold'),
    command=SaltAndPepper,
    image=bcon12,
    padx=22,
    pady=15,
    bg='#8e9e95',
    fg='black'
)
b10.pack(side='left', expand=True, fill=BOTH)

b11 = Button(
    frame,
    font=('Consolas', 20, 'bold'),
    command=gauss,
    image=bcon13,
    padx=22,
    pady=15,
    bg='#8e9e95',
    fg='black'
)
b11.pack(side='left', expand=True, fill=BOTH)

b12 = Button(
    frame,
    font=('Consolas', 20, 'bold'),
    command=gray,
    image=bcon14,
    padx=22,
    pady=15,
    bg='#8e9e95',
    fg='black'
)
b12.pack(side='left', expand=True, fill=BOTH)

b13 = Button(
    frame,
    font=('Consolas', 20, 'bold'),
    command=ft,
    image=bcon15,
    padx=22,
    pady=15,
    bg='#8e9e95',
    fg='black'
)
b13.pack(side='left', expand=True, fill=BOTH)

b14 = Button(
    frame,
    font=('Consolas', 20, 'bold'),
    command=ft_i,
    image=bcon16,
    padx=22,
    pady=15,
    bg='#8e9e95',
    fg='black'
)
b14.pack(side='left', expand=True, fill=BOTH)

b15 = Button(
    frame,
    font=('Consolas', 20, 'bold'),
    command=min_filter,
    image=bcon17,
    padx=22,
    pady=15,
    bg='#8e9e95',
    fg='black'
)
b15.pack(side='left', expand=True, fill=BOTH)

b16 = Button(
    frame,
    font=('Consolas', 20, 'bold'),
    command=max_filter,
    image=bcon18,
    padx=22,
    pady=15,
    bg='#8e9e95',
    fg='black'
)
b16.pack(side='left', expand=True, fill=BOTH)

b17 = Button(
    frame,
    font=('Consolas', 20, 'bold'),
    command=med,
    image=bcon19,
    padx=22,
    pady=15,
    bg='#8e9e95',
    fg='black'
)
b17.pack(side='left', expand=True, fill=BOTH)

#-------------------------------------------------------
root.resizable(False, False) # For Make The Window Sizable For Current View   

root.mainloop()


#------------------End Of Project-----------------------

