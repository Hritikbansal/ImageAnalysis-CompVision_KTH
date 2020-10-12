function pixel=q1(tools)
  
  #delta x
  deltax=[0 0 0;0.5 0 -0.5;0 0 0];
  
  #deltay
  deltay=[0 0.5 0;0 0 0;0 -0.5 0];

  dxtools=conv2(tools,deltax,'valid');
  dytools=conv2(tools,deltay,'valid');
  
  subplot(1,3,1);
  showgrey(tools);
  title("Original Image");
  
  subplot(1,3,2);
  showgrey(dxtools);
  title("Gradient in X direction");
  
  subplot(1,3,3);
  showgrey(dytools);
  title("Gradient in Y direction");
  
  size(dxtools) #254x254
  size(dytools)
endfunction
