function q12(alpha)

F = [zeros(60, 128); ones(8, 128); zeros(60, 128)] .* ...
[zeros(128, 48) ones(128, 32) zeros(128, 48)];

Fhat=fft2(F);

subplot(2,2,1);
showfs(Fhat);

G = rot(F, alpha);

subplot(2,2,2);
showgrey(G);
axis on

Ghat = fft2(G);
subplot(2,2,3);
showfs(Ghat);

Hhat = rot(fftshift(Ghat), -alpha );

subplot(2,2,4);
showgrey(log(1 + abs(Hhat)));

endfunction

