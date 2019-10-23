function [outcurves linepar acc] = houghedgeline(pic, scale, gradmagnthreshold,nrho, ntheta, nlines, verbose)
  
  #We can extract EdgeCurves from extract edge function
  deg=pi/180;
  [sizex sizey]=size(pic);
  curves=extractedge(pic,scale,gradmagnthreshold,'same');  #only curves above certain manitude are catered too 
  #overlaycurves(pic,curves);
   magnitude=Lv(pic);
   
  [linepar acc]=houghline(curves,magnitude,nrho,ntheta,gradmagnthreshold,nlines,verbose); 
  disp(linepar);
  [m n]=size(linepar);
  #Xcos(theta)+Ysin(theta)=R
   x0 = sizex/2;
   dx = sizex/2;
   y0=sizey/2;
   dy=sizey/2;
   
   num_col=4*m;
   outcurves=zeros(2,num_col);
  
  for idx=1:m
    
    angle=linepar(idx,2)*deg;
    outcurves(1,4*(idx-1)+1)=0;
    outcurves(2,4*(idx-1)+1)=3;
    cos(linepar(idx,2)*deg)
    sin(linepar(idx,2)*deg)
    
   if (-45<angle)&(angle<45) 
      outcurves(2, 4*(idx-1) + 2) = x0-dx;
      outcurves(1, 4*(idx-1) + 2) = (linepar(idx,1)-((x0-dx)*cos(linepar(idx,2)*deg)))/(sin(linepar(idx,2)*deg));
      outcurves(2, 4*(idx-1) + 3) = x0;
      outcurves(1, 4*(idx-1) + 3) = (linepar(idx,1)-(x0*cos(linepar(idx,2)*deg)))/(sin(linepar(idx,2)*deg));
      outcurves(2, 4*(idx-1) + 4) = x0+dx;
      outcurves(1, 4*(idx-1) + 4) = (linepar(idx,1)-((x0+dx)*cos(linepar(idx,2)*deg)))/(sin(linepar(idx,2)*deg));       
   else
      outcurves(1, 4*(idx-1) + 2) = y0-dy;
      outcurves(2, 4*(idx-1) + 2) = (linepar(idx,1)-((y0-dy)*sin(linepar(idx,2)*deg)))/(cos(linepar(idx,2)*deg));
      outcurves(1, 4*(idx-1) + 3) = y0;
      outcurves(2, 4*(idx-1) + 3) = (linepar(idx,1)-(y0*sin(linepar(idx,2)*deg)))/(cos(linepar(idx,2)*deg));
      outcurves(1, 4*(idx-1) + 4) = y0+dy;
      outcurves(2, 4*(idx-1) + 4) = (linepar(idx,1)-((y0+dy)*sin(linepar(idx,2)*deg)))/(cos(linepar(idx,2)*deg)); 
   end

end

  disp(outcurves);
  
  subplot(2,2,1);
  showgrey(pic);
  title("Original Image");
  
  subplot(2,2,2);
  overlaycurves(pic,curves);
  title("Edges");
  
  subplot(2,2,3);
  showgrey(acc);
  title("Accumulator space");
  
  subplot(2,2,4);
  overlaycurves(pic,outcurves);
  title("EdgeLines");
 
  
endfunction
