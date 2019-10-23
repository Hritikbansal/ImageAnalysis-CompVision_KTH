house=godthem256;

subplot(2,3,1);
title("Original Image");
showgrey(house);

subplot(2,3,2);
contour(Lvvtilde(discgaussfft(house, 0.0001), 'same'), [0 0]);
title("Scale:0.0001");
axis('image');
axis('ij');

subplot(2,3,3);
contour(Lvvtilde(discgaussfft(house, 1.0), 'same'), [0 0]);
title("Scale:1.0");
axis('image');
axis('ij');

subplot(2,3,4);
contour(Lvvtilde(discgaussfft(house, 16.0), 'same'), [0 0]);
title("Scale:16.0");
axis('image');
axis('ij');

subplot(2,3,5);
contour(Lvvtilde(discgaussfft(house, 64.0), 'same'), [0 0]);
title("Scale:64.0");
axis('image');
axis('ij');


#0.0001, 1.0, 4.0, 16.0 and 64.0