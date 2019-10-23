addpath("DD2423_Lab_Files/Images-m");
addpath("DD2423_Lab_Files/Functions");

figure(1);
img1=phonecalc128
showgrey(pow2image(img1,10^-10));

figure(2);
showgrey(randphaseimage(img1));

figure(3);
img2=few128
showgrey(pow2image(img2,10^-10));

figure(4);
showgrey(randphaseimage(img2));

figure(5);
img3=nallo128
showgrey(pow2image(img3,10^-10));

figure(6);
showgrey(randphaseimage(img3));