F = [ zeros(56, 128); ones(16, 128); zeros(56, 128)];
G = F';
H = F + 2 * G;

Fhat = fft2(F);
Ghat = fft2(G);
Hhat = fft2(H);
figure(0)
showgrey(abs(Fhat));
figure(1)
showgrey(log(1 + abs(Fhat)));

figure(2)
showgrey(log(1 + abs(Ghat)));

figure(3)
showgrey(log(1 + abs(Hhat)));

figure(4)
showgrey(log(1 + abs(fftshift(Hhat))));


