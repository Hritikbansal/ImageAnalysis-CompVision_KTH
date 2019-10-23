F=[zeros(56,128);ones(16,128);zeros(56,128)];
G=F';
K=F.*G;
figure(1);
showgrey(K);
saveas(1,"q10_1.png");

figure(2);
showgrey(log( 1 + abs(fft2(K))));
saveas(2,"q10_2.png");

figure(3);
showfs(fft2(F.*G));
saveas(3,"q10_3.png");
%otherway round

% Now treating F and G 
% in Fourier Domain

K=K*(128^2);
figure(4);
showgrey(log( 1 + abs(ifft2(K))));

figure(5);
showfs(ifft2(K));

%Second Way

F1=fftshift(fft2(F));
F2=fftshift(fft2(G));

C=conv2(F1,F2)*(1/(128)^2);

figure(6);
showgrey(log(1+abs(C)));



