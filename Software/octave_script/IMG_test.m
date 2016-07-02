function IMG_test

  pkg load instrument-control
  if (exist("serial") != 3)
    disp("No Serial Support");
  endif
  
  myImage = imread("image.png");  #read 8x8 pixel image
  # the image is vreatet with MS paint. At least there each
  # pixel is encoded into three bytes (R,G,B) this could be
  # normal for png. At least I hope so
 
  # now to the conversation magic 
  red   = uint8(bitshift(myImage(:,:,1), -5));  
  green = uint8(bitshift(myImage(:,:,2), -5));
  blue  = uint8(bitshift(myImage(:,:,3), -5));
  
  #add the three colors to one byte togehter 
  img8trueColor= bitshift(red,5) + bitshift(green,2) + blue;
  #transpose the image - needed to save it correctly
  img8trueColor=img8trueColor.';
  
  #write it to display direct in octave no more a file output
  s1 = serial("\\\\.\\COM12");
  set(s1, 'baudrate', 38400);
  srl_flush(s1);
  srl_write(s1, img8trueColor);
  
endfunction