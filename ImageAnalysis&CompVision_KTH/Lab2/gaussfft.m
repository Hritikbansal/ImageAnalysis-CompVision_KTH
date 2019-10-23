function filtered_image = gaussfft(pic,t)
  
[sizex,sizey] = size(pic);
[X,Y] = meshgrid(-(sizex/2):1:((sizex/2)-1)); %Generate a meshgrid of size 128x128, as the image
%Create the gaussian kernel
Z = (1/(2*pi*t))*exp(-(X.^2 + Y.^2)/(2*t)); 

%variance(Z)

%Fourier tranform of both image and kernel
pic_F = fft2(pic)/sizex;
Z_F = fft2(Z)/sizex;
filtered_image_F = pic_F.*Z_F;
filtered_image = sizex*ifft2(filtered_image_F);
filtered_image = fftshift(filtered_image);

%variance(filtered_image)

%Show results
%subplot(1,3,3);
%mesh(X,Y,Z); %mesh() only visualizes the gaussian kernel already created in Z
%title("Gaussian filter applied");
%subplot(1,3,1);
%showgrey(pic);
%title("Original image");
%subplot(1,3,2);
%showgrey(filtered_image);
%title(sprintf('Image with gaussian filter, with t = %f', t));
