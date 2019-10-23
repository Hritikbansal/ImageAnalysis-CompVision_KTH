F = [zeros(48, 128); ones(32, 128); zeros(48, 128)] .* ...
[zeros(128, 60) ones(128, 8) zeros(128, 60)];

figure(1);
showgrey(abs(F));
saveas(1,"q11_3.png");

figure(2);
Fhat=fft2(F);
showfs(Fhat);
saveas(2,"q11_4.png");


