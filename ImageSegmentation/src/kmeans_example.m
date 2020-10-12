function kmeans_example(image,K,L,seed,g_scale,i_scale)

scale_factor = i_scale;  % image downscale factor
image_sigma = g_scale;   % image preblurring scale

I = imread(image);
I = imresize(I, scale_factor);
Iback = I;
d = 2*ceil(image_sigma*2) + 1;
h = fspecial('gaussian', [d d], image_sigma);
I = imfilter(I, h);

tic
[ segm, centers ] = kmeans_segm(I, K, L, seed);
toc
Inew = mean_segments(Iback, segm);
I = overlay_bounds(Iback, segm);

subplot(1,3,1);
imshow(image);
title("Original Image");

subplot(1,3,2);
imshow(Inew);
title("Mean Segments");

subplot(1,3,3);
imshow(I);
strg=strcat("K=",int2str(K)," L=",int2str(L)," gauss=",num2str(g_scale));
title(strg);

