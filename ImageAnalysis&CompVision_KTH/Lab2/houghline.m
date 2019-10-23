function [linepara, accu] = houghline(curves, magnitude, nrho, ntheta, threshold, nlines, verbose)

deg=pi/180;

linepara=[];
accu=zeros(nrho,ntheta);
 
theta=linspace(-90,90,ntheta);
rho=linspace(-256,256,nrho);

max_gradmagn=max(magnitude(:));
% PRINTCURVES(CURVES, VERBOSE) -- Prints information about polygons
%
% Depending on the value of VERBOSE different amounts of 
% information about the input polygons is printed
%
% VERBOSE = 0 : Only the number of polygons
%           1 : The length of each polygon
%           2 : The coordinates
%
% The format of these curves is the same as for CONTOURC

insize = size(curves, 2);
trypointer = 1;

numcurves = 0;

while trypointer <= insize,
  polylength = curves(2, trypointer);

  numcurves = numcurves + 1;

  if (verbose >= 1)
    fprintf('polygon %d: length %d\n',  numcurves, polylength)
  end

  trypointer = trypointer + 1;
  
  for polyidx = 1:polylength
    
    x = curves(2, trypointer);
    y = curves(1, trypointer);
    
    for k=1:length(theta)
      thetatmp=theta(k);  # k will have the column number for the accumulator matrix
      rhotmp=(x*cos(theta(k)*deg))+(y*sin(theta(k)*deg));  # Parametric Calculation 
      row_num=approx_rho(rho,rhotmp);  
      
      if(row_num!=0)
        accu(row_num,k)+=(magnitude(round(x),round(y))/max_gradmagn);
        #accu(row_num,k)+=1; 
      end
      
    end
    
    if (verbose >= 2)
      fprintf('(x %g, y %g)\n', x, y)
    end

    trypointer = trypointer + 1;
  end
end

fprintf('total number of polygons %d\n', numcurves)

accu=discgaussfft(accu,1.0);  #Smoothing the accu matrix for better results 

[pos value] = locmax8(accu);
[dummy indexvector] = sort(value);
nmaxima = size(value, 1);

for idx = 1:nlines
  rhoidxacc = pos(indexvector(nmaxima - idx + 1), 1);
  thetaidxacc = pos(indexvector(nmaxima - idx + 1), 2);
  
  linepara=[linepara;rho(rhoidxacc) theta(thetaidxacc)];
end

endfunction
