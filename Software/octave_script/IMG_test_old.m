function IMG_test
  
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
  # show the reult (just for visual inspection)
  imshow(img8trueColor);
  #transpose the image - needed to save it correctly
  img8trueColor=img8trueColor.';
  myFile=fopen("out.txt", "w");
  fwrite(myFile,img8trueColor);
  fclose(myFile);
  #{
    The out put file now should look like this: 
    07 E0 00 1A 1A 1A E0 1C 
    07 E0 00 1A 00 1A E0 1C 
    07 00 00 1A 1A 1A 00 1C 
    07 00 00 1A 00 1A 00 1C 
    07 00 23 00 F2 F2 00 1C 
    07 00 23 00 00 F2 00 1C 
    07 00 23 00 00 F2 00 1C 
    07 E0 23 23 00 F2 E0 1C
    The first eigt bytes (first line) are the top line of the
    display also. 
  #}
endfunction