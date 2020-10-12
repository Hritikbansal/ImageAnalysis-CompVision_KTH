# point-wise thresholding :)

function pixel=q2(tools)
  
  #delta x
  deltax=[0 0 0;0.5 0 -0.5;0 0 0];
  
  #deltay
  deltay=[0 0.5 0;0 0 0;0 -0.5 0];

  dxtools=conv2(tools,deltax,'same');
  dytools=conv2(tools,deltay,'same');
  
  figure(1)
  subplot(1,3,1);
  showgrey(tools);
  title("Original Image");
  
  subplot(1,3,2);
  showgrey(dxtools);
  title("Gradient in X direction");
  
  subplot(1,3,3);
  showgrey(dytools);
  title("Gradient in Y direction");
  
  gradmagntools=sqrt(dxtools.^2 + dytools .^2);
  figure(2)
  hist(gradmagntools(:));
  
  #will try 4 thresholds for few256
  #figure(3);
  
  #subplot(1,4,1);
  #showgrey((gradmagntools - 10) > 0);
  #title("Threshold:10");
  
  #subplot(1,4,2);
  #showgrey((gradmagntools - 20) > 0);
  #title("Threshold:20");
  
  #subplot(1,4,3);
  #showgrey((gradmagntools - 25) > 0);
  #title("Threshold:25");
  
  #subplot(1,4,4);
  #showgrey((gradmagntools - 30) > 0);
  #title("Threshold:30");
  
  #will try 4 thresholds for godthem256
  figure(3);
  
  subplot(1,4,1);
  showgrey((gradmagntools - 20) > 0);
  title("Threshold:20");
  
  subplot(1,4,2);
  showgrey((gradmagntools - 30) > 0);
  title("Threshold:30");
  
  subplot(1,4,3);
  showgrey((gradmagntools - 40) > 0);
  title("Threshold:45");
  
  subplot(1,4,4);
  showgrey((gradmagntools - 50) > 0);
  title("Threshold:50");
  
  
endfunction
