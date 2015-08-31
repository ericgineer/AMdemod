w = -pi:1e-4:pi;

z = exp(1j .* w);

D = 10;

H = (1-z.^-4)./(1-z.^-1);

Hdb = 20*log10(abs(H));

figure; plot(w,Hdb);
