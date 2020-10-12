tools=few256;

subplot(2,3,1);
showgrey(tools);
title("Original Image");

subplot(2,3,2);
showgrey(Lvvvtilde(discgaussfft(tools, 0.0001), 'same')<0);
title("Scale:0.0001");

subplot(2,3,3);
showgrey(Lvvvtilde(discgaussfft(tools, 1.0), 'same')<0);
title("Scale:1.0");


subplot(2,3,4);
showgrey(Lvvvtilde(discgaussfft(tools, 16.0), 'same')<0);
title("Scale:16.0");


subplot(2,3,5);
showgrey(Lvvvtilde(discgaussfft(tools, 64.0), 'same')<0);
title("Scale:64.0");


