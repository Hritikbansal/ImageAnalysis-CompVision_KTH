function pixels=Lvvtilde(inpic,shape)
  
  if(nargin<2)
    shape='same';
  end  
  
  delta_x=[0 0 0 0 0;0 0 0 0 0;0 -0.5 0 0.5 0;0 0 0 0 0;0 0 0 0 0];
  delta_y=[0 0 0 0 0;0 0 -0.5 0 0;0 0 0 0 0;0 0 0.5 0 0;0 0 0 0 0];
  
  delta_xx=[0 0 0 0 0;0 0 0 0 0;0 1 -2 1 0;0 0 0 0 0;0 0 0 0 0];
  delta_yy=[0 0 0 0 0;0 0 1 0 0;0 0 -2 0 0;0 0 1 0 0;0 0 0 0 0];
  
  delta_xy=conv2(delta_x,delta_y,'same');
  
  L_x=filter2(delta_x,inpic,shape);
  L_y=filter2(delta_y,inpic,shape);
  
  L_xx=filter2(delta_xx,inpic,shape);
  L_yy=filter2(delta_yy,inpic,shape);
  L_xy=filter2(delta_xy,inpic,shape);
  
  #L2xLxx + 2LxLyLxy + L2yLyy
  
  pixels=((L_x.^2).*(L_xx))+(2*L_x.*L_y.*L_xy)+((L_y.^2).*(L_yy));
  
endfunction
