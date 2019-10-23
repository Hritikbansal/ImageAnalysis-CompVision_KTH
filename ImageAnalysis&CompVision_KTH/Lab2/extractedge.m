function edgecurves=extractedge(inpic,scale,threshold,shape)
  
  smooth_image=discgaussfft(inpic,scale);
  
  lvv=Lvvtilde(smooth_image,shape); %will act as the input image for zerocrosscurves function
  lvvv=-Lvvvtilde(smooth_image,shape);  %will act as the mask for zerocrosscurves function
  
  edgecurves=zerocrosscurves(lvv,lvvv);
  
  if(nargin<4) %threshold is not given
    return
  else 
    delta_x=[0 0 0 0 0;0 0 0 0 0;0 -0.5 0 0.5 0;0 0 0 0 0;0 0 0 0 0];
    delta_y=[0 0 0 0 0;0 0 -0.5 0 0;0 0 0 0 0;0 0 0.5 0 0;0 0 0 0 0];
    L_x=filter2(delta_x,smooth_image,shape);
    L_y=filter2(delta_y,smooth_image,shape);
    gradmagn=sqrt(L_x.^2 + L_y.^2);
    figure(1);
    hist(gradmagn(:));
    mask=gradmagn-threshold;   
    edgecurves=thresholdcurves(edgecurves,mask); 
  end
  
  
endfunction
