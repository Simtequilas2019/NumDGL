function Y_heun = explicit_heun(f, y_0, T, tau, param)
if mod(T,tau)~= 0
    warning('T should be a multiple of tau');
end
K = floor(T/tau);
d = size(y_0,1);
t = 0:tau:T; %instead tau*(k+1) works as well
Y_heun = zeros(d,K);
Y_heun(:,1) = y_0;
for k = 1:K
    f0 = f(param, t(k),Y_heun(:,k));
    f1 = f(param, t(k + 1), Y_heun(:,k) + tau * f0);
    Y_heun(:,k + 1) = Y_heun(:,k) + tau/2 * (f0 + f1);
end

end