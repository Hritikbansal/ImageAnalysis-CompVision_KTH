function pic_changed=gaussfft2(pic,t) %t is the variance
    
%// Generate horizontal and vertical co-ordinates, where
%// the origin is in the middle
N=size(pic)(1);
ind = 0:N-1;
[X Y] = meshgrid(ind);

%// Create Gaussian Mask
h = (1/(2*pi*t))*(exp(-(X.^2 + Y.^2) / (2*t)));

fhat_pic=fft2(pic)/N;
fhat_filter=fft2(h)/N;
showgrey(abs(fhat_filter));

mult=fhat_pic.*fhat_filter;

filtered_image=N*ifft2(mult);
disp(size(filtered_image));
showgrey(filtered_image);
%pic_changed=fftshift(); #changed picture
%showgrey(pic_changed)
endfunction
