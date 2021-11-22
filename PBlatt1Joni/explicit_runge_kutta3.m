function yRK = explicit_runge_kutta3(f, y_0, T, tau, param)
if mod(T,tau)~= 0
    warning('T should be a multiple of tau');
end
K = floor(T/tau);
d = size(y_0,1);
t = 0:tau:T; %instead tau*(k+1) works as well
yRK = zeros(d,K+1);
yRK(:,1) = y_0;

%Was genau hier in jeder iteration passiert ist am besten mit dem
%Butcher-Tableau zu erklären
%     a = [0 0 0;  1/2 0 0;  -1 2 0];
%     b = [1/6 2/3 1/6];
%     c = [0 1/2 1];
% for k = 1:K
%     v1 = yRK(:,k);
%     v2 = yRK(:,k) + tau * 1/2 * f(param, t(k), v1);
%     v3 = yRK(:,k) + tau * (-1 * f(param,t(k),v1) + 2 * f(param,t(k)+ 1/2 * tau, v2));
%     sumV = 1/6 * f(param,t(k), v1) + 2/3 * f(param, t(k) + tau/2, v2);
%     sumV = sumV + 1/6 * f(param, t(k) + tau, v3);
%     yRK(:,k + 1) = yRK(:,k) + tau * sumV;
% end
% 
% end
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Oder alternativ mit effizienterem Speichern der Einträge %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% Dies spart drei Funktionsaufrufe und damit halbiert es die Anzahl der
% Funktionsaufrufe, was je nach Funktion, sehr vorteilhaft sein kann
for k = 1:K
    v1 = yRK(:,k);
    dummy1 = f(param, t(k), v1);
    v2 = yRK(:,k) + tau * 1/2 * dummy1;
    dummy2 = f(param,t(k)+ 1/2 * tau, v2);
    v3 = yRK(:,k) + tau * (-1 * dummy1 + 2 * dummy2);
    sumV = 1/6 * dummy1 + 2/3 * dummy2;
    sumV = sumV + 1/6 * f(param, t(k) + tau, v3);
    yRK(:,k + 1) = yRK(:,k) + tau * sumV;
end
