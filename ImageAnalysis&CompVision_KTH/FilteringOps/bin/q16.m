function q16(pic)
  
  figure(1)
  
  subplot(3,2,1)
  showgrey(pic);
  title("Original Pic");
  
  subplot(3,2,2)
  showgrey(gaussfft(pic,1));
  title("Image with t=1.0");
  
  subplot(3,2,3)
  showgrey(gaussfft(pic,4.0));
  title("Image with t=4.0");
  
  subplot(3,2,4);
  showgrey(gaussfft(pic,16.0));
  title("Image with t=16.0");
  
  subplot(3,2,5);
  showgrey(gaussfft(pic,64.0));
  title("Image with t=64.0");

  subplot(3,2,6);
  showgrey(gaussfft(pic,256.0));
  title("Image with t=256.0");
  
  saveas(1,"q16_gauss.png");