function q19(type,param)
addpath("DD2423_Lab_Files/Images-m");
addpath("DD2423_Lab_Files/Functions");

img = phonecalc256;
sampled_img = img;
smoothimg = img;
N=5;

if nargin < 2
  error( 'Wrong # of arguments.')
  return
end

if type == 1
    for i=1:N
    if i>1 % generate subsampled versions
    sampled_img = rawsubsample(img);
    %smoothimg = gaussfft(img,1); %<call_your_filter_here>(smoothimg, <params>);
    smoothimg = ideal(img,param); 
    smoothimg = rawsubsample(smoothimg);
    img = rawsubsample(img);
    end
    subplot(2, N, i)
    showgrey(sampled_img)
    subplot(2, N, i+N)
    showgrey(smoothimg)
    if(i==3)
        title(sprintf("Smoothing with Low-pass filter, cut-off freq = %f", param));
    end
    end
elseif type ==2
    for i=1:N
    if i>1 % generate subsampled versions
    sampled_img = rawsubsample(img);
    %smoothimg = gaussfft(img,1); %<call_your_filter_here>(smoothimg, <params>);
    smoothimg = gaussfft(img,param); 
    smoothimg = rawsubsample(smoothimg);
    img = rawsubsample(img);
    end
    subplot(2, N, i)
    showgrey(sampled_img)
    subplot(2, N, i+N)
    showgrey(smoothimg)
    if(i==3)
        title(sprintf("Smoothing with Gaussian filter, t = %f", param));
    end
    end
end
