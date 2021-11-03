function y_heun = explicit_heun(f,y_0, T, tau)

K = round(T/tau, 0);
d = size(y_0);
d = d(1,1);
y = zeros(d,K+1);
ytilde = zeros(d,K+1);
y(:,1) = y_0;

for i=1:K
    ytilde(:,i+1) = y(:,i) + f(tau*i, y(:,i));
    y(:,i+1) = y(:,i) + tau/2 *(f(tau*i, y(:,i)) + f(tau*(i+1), ytilde(:,i+1)));
end
y_heun = y;
end
