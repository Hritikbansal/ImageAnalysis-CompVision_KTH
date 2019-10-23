function pixels=Lvvvtilde(inpic,shape)
  
  if(nargin<2)
    shape='same';
  end  
  
  delta_x=[0 0 0 0 0;0 0 0 0 0;0 -0.5 0 0.5 0;0 0 0 0 0;0 0 0 0 0];
  delta_y=[0 0 0 0 0;0 0 -0.5 0 0;0 0 0 0 0;0 0 0.5 0 0;0 0 0 0 0];
  
  delta_xx=[0 0 0 0 0;0 0 0 0 0;0 1 -2 1 0;0 0 0 0 0;0 0 0 0 0];
  delta_yy=[0 0 0 0 0;0 0 1 0 0;0 0 -2 0 0;0 0 1 0 0;0 0 0 0 0];
  
  delta_xy=conv2(delta_x,delta_y,'same');
  
  delta_xxx=conv2(delta_x,delta_xx,'same');
  delta_yyy=conv2(delta_y,delta_yy,'same');
  delta_xxy=conv2(delta_xx,delta_y,'same');
  delta_xyy=conv2(delta_xy,delta_y,'same');
  
  L_x=filter2(delta_x,inpic,shape);
  L_y=filter2(delta_y,inpic,shape);
  
  L_xx=filter2(delta_xx,inpic,shape);
  L_yy=filter2(delta_yy,inpic,shape);
  L_xy=filter2(delta_xy,inpic,shape);
  
  L_xxx=filter2(delta_xxx,inpic,shape);
  L_yyy=filter2(delta_yyy,inpic,shape);
  L_xxy=filter2(delta_xxy,inpic,shape);
  L_xyy=filter2(delta_xyy,inpic,shape);
  
  #L3xLxxx + 3L2xLyLxxy + 3LxL2yLxyy + L3yLyyy
  
  pixels=((L_x.^3).*(L_xxx))+(3*(L_x.^2).*L_y.*L_xxy)+(3*L_x.*(L_y.^2).*(L_xyy))+((L_y.^3).*L_yyy);
 
  
endfunction
