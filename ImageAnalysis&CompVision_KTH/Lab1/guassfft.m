
function gaussfft(pic,t) %t is the variance
    
figure(1);
showgrey(pic);
%// Generate horizontal and vertical co-ordinates, where
%// the origin is in the middle
N=size(pic)(1)
ind = -floor(N/2) : floor(N/2);
[X Y] = meshgrid(ind, ind);

%// Create Gaussian Mask
h = exp(-(X.^2 + Y.^2) / (2*t));

fhat_pic=fft2(pic);
fhat_filter=fft2(h);

mult=fhat_pic*fhat_filter;

pic_changed=ifft2(mult); #changed picture
figure(2)
showgrey(pic_changed);
endfunction


  
