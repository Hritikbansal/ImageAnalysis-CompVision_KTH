function pixels = Lv(pic, shape)
  
if (nargin < 2)
shape = 'same';
end

inpic=abs(gaussfft(pic,1.0));

figure(1);
subplot(1,2,1);
showgrey(pic);
title("Original Image");

subplot(1,2,2);
showgrey(inpic);
title("Smoothed Image");

dxmask=[0 0 0;-0.5 0 0.5; 0 0 0];
dymask=[0 -0.5 0;0 0 0;0 0.5 0];

Lx = filter2(dxmask, inpic, shape);
Ly = filter2(dymask, inpic, shape);
pixels = sqrt(Lx.^2 + Ly.^2);
figure(2);
hist(pixels(:));

figure(3);  #with smoothing
subplot(2,3,1);
showgrey((pixels - 0.05) > 0);
title("Threshold:0.05");

subplot(2,3,2);
showgrey((pixels - 0.1) > 0);
title("Threshold:0.1");

subplot(2,3,3);
showgrey((pixels - 0.13) > 0);
title("Threshold:0.13");
  
subplot(2,3,4);
showgrey((pixels - 0.15) > 0);
title("Threshold:0.15");
  
subplot(2,3,5);
showgrey((pixels - 0.20) > 0);
title("Threshold:0.20");