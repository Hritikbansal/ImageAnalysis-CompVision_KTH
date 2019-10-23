function fftwave(u,v,sz)
  if(nargin<2)
    error('Requires at least two input arguments')
  end
  if (nargin==2)
    sz=128;
  endif
  
  Fhat=zeros(128,128);
  Fhat(u,v)=1;
  
  F=ifft2(Fhat);
  Fabsmax=max(abs(F(:)));
  
  subplot(3,2,1);
  showgrey(Fhat);
  title(sprintf('Fhat:(u,v)=(%d,%d)',u,v))
  
  if(u<=sz/2)  %this causes phase shift but no change in the magnitude
    uc=u-1;
  else
    uc=u-1-sz;
  end
  
  if(v<=sz/2)
    vc=v-1;
  else
    vc=v-1-sz;
  end
  
  wavelength=1/(sqrt(uc^2+vc^2));   %u,v are frequencies 
  amplitude=1/sz;   
  
  subplot(3,2,2);
  showgrey(fftshift(Fhat));  %fftshift brings the zero frequency component at the center of frequency spectrum
  title(sprintf('centered Fhat: (uc,vc)=(%d,%d)',uc,vc))
  
  subplot(3,2,3);
  showgrey(real(F),64,-Fabsmax,Fabsmax);
  title('real(F)')
  
  subplot(3,2,4);
  showgrey(imag(F),64,-Fabsmax,Fabsmax);
  title('imag(F)')
 
  subplot(3,2,5);
  showgrey(abs(F),64,-Fabsmax,Fabsmax);
  title(sprintf('abs(s) (amplitude %f)',amplitude))
  
  subplot(3,2,6);
  showgrey(angle(F),64,-pi,pi);
  title(sprintf('angle(F) (wavelength %f)',wavelength))
   
endfunction
