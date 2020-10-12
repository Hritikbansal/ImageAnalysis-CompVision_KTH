function q17()
addpath("DD2423_Lab_Files/Images-m");
addpath("DD2423_Lab_Files/Functions");

office = office256;
add = gaussnoise(office, 16); %With gauss noise
%Gaussian noise: each pixel randomized around its value with a standard
%deviation
sap = sapnoise(office, 0.1, 255); %With sap noise
%Salt and pepper noise: Random 0 and 1 pixels in image

%subplot(1,3,1);
%showgrey(office);
%title("Original image");
figure(1);
subplot(2,4,1);
showgrey(add);
title("Gaussian Noise");
subplot(2,4,5);
showgrey(sap);
title("Sap Noise");

add_gaussian = gaussfft(add, 0.5);
subplot(2,4,2);
showgrey(abs(add_gaussian));
title("Gaussian,t = 0.5");
add_median = medfilt(add,3);
subplot(2,4,3);
showgrey(add_median);
title("Median,size = 3");
add_lowpass = ideal(add,0.3); 
subplot(2,4,4);
showgrey(add_lowpass);
title("Low-pass,cut-off = 0.3");

sap_gaussian = gaussfft(sap, 0.5);
subplot(2,4,6);
showgrey(abs(sap_gaussian));
title("Gaussian,t = 0.5");
sap_median = medfilt(sap,3);
subplot(2,4,7);
showgrey(sap_median);
title("Median,size = 3");
sap_lowpass = ideal(sap,0.3); 
subplot(2,4,8);
showgrey(sap_lowpass);
title("Low-pass,cut-off = 0.3");

figure(2)
subplot(1,3,1);
showgrey(sap);
subplot(1,3,2);
showgrey(abs(sap_gaussian));
subplot(1,3,3);
showgrey(abs(gaussfft(sap,3)));
saveas(1,"q17.png")

figure(3)
subplot(1,3,1);
showgrey(add);
subplot(1,3,2);
showgrey(add_median);
subplot(1,3,3);
showgrey(medfilt(add,6));

figure(4)
subplot(1,3,1);
showgrey(sap);
subplot(1,3,2);
showgrey(sap_lowpass);
subplot(1,3,3);
showgrey(ideal(sap,0.1));