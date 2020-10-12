

% t values are 0.1, 0.3, 1.0, 10.0 and 100.0
pic=deltafcn(128,128);
figure(1)
subplot(3,2,1)
t1=gaussfft(pic,0.1);
showgrey(t1);
title(sprintf('t=0.1'))
var_t1=variance(t1)

subplot(3,2,2)
t2=gaussfft(pic,0.3);
showgrey(t2);
title(sprintf('t=0.3'))
var_t2=variance(t2)

subplot(3,2,3)
t3=gaussfft(pic,1.0);
showgrey(t3);
title(sprintf('t=1.0'))
var_t3=variance(t3)

subplot(3,2,4)
t4=gaussfft(pic,10.0);
showgrey(t4);
title(sprintf('t=10.0'))
var_t4=variance(t4)

subplot(3,2,5)
t5=gaussfft(pic,100.0);
showgrey(t5);
title(sprintf('t=100.0'))
var_t5=variance(t5)

saveas(1,"q14_allts.png")

figure(2)

subplot(3,2,1)
showgrey(discgaussfft(pic,0.1));
title(sprintf('t=0.1'))
var_t6=variance(discgaussfft(pic,0.1))

subplot(3,2,2)
showgrey(discgaussfft(pic,0.3));
title(sprintf('t=0.3'))
var_t7=variance(discgaussfft(pic,0.3))

subplot(3,2,3)
showgrey(discgaussfft(pic,1.0));
title(sprintf('t=1.0'))
var_t8=variance(discgaussfft(pic,1.0))

subplot(3,2,4)
showgrey(discgaussfft(pic,10.0));
title(sprintf('t=10.0'))
var_t9=variance(discgaussfft(pic,10.0))

subplot(3,2,5)
showgrey(discgaussfft(pic,100.0));
title(sprintf('t=100.0'))
var_t10=variance(discgaussfft(pic,100.0))

