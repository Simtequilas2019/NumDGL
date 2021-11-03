function x = rabeu(t,y)
% Räuber Beute Modell mit Parametern alpha, beta, gamma und delta wie in VL

alpha = 1;
beta = 1;
gamma = 1;
delta = 1;

x = [((alpha - beta*y(2,1))* y(1,1)); (-gamma + delta*y(1,1)) * y(2,1)];

end

