function retval = approx_rho (rho,rtmp)
  
  for j=1:length(rho)
    
    if rho(j)==rtmp
      retval=j;
      break
    elseif j==length(rho)  #out of range..won't consider it :)
      retval=0;
    elseif (rho(j)<rtmp)&(rtmp<rho(j+1))
      retval=j+1;
      break
    end
    
  end
  
endfunction
