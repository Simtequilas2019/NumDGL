function y = esv(phi, f, y_0, T, tau, param)
if mod(T,tau)~= 0
    warning('T should be a multiple of tau');
end
K = floor(T/tau);
d = size(y_0,1);
t = 0:tau:T; %instead tau*(k+1) works as well
y = zeros(d,K+1);
y(:,1) = y_0;
for k = 1:K
    y(:,k + 1) = y(:,k) + tau * phi(t(k),tau, y(:,k), y(:,k+1), f, param);
end

end