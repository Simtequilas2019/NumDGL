x = linspace(1,100,1000);
y = x.^2 - 1/1000 * x.^3;

plot(x,y)
xlim([0,10])
ylim([0,10])