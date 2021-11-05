function Y_euler = explicit_euler(f, y_0, T, tau, param)
if mod(T,tau)~= 0
    warning('T should be a multiple of tau');
end
K = floor(T/tau);
t = 0:tau:T; %instead tau*(k+1) works as well
d = size(y_0,1);
Y_euler = zeros(d,K);
Y_euler(:,1) = y_0;
for k = 1:K
    Y_euler(:,k + 1) = Y_euler(:,k) + tau * f(param, t(k),Y_euler(:,k));
end

end