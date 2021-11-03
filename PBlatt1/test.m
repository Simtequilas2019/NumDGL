%{
initialisiere Parameter
Intervall I = [0,T]
Anfangswert y0 in IR^d 
Zeitschritte tau in IR^+
%}

y_0 = [0.5; 0.5];
T = 20;
tau = 0.04;

%{
rufe Funktionen auf
solExplEuler: Lösungsmatrix vom Euler
solExplHeun: Lösungsmatrix vom Heun
%}


solExplEuler = explicit_euler(@rabeu, y_0, T, tau);
solExplHeun = explicit_heun(@rabeu, y_0, T, tau);

% visualisiere Lösungskurven
[x,y] = meshgrid(0:0.1:3,0:0.1:3);
dx = (1-y).*x;
dy = (x-1).*y;

quiver(x,y,dx,dy)
hold on
plot(solExplHeun(1,:), solExplHeun(2,:))
hold on
plot(solExplEuler(1,:), solExplEuler(2,:))
legend("Richtungsfeld", "expliziter Heun", "expliziter Euler")

x = (0:tau:T)
plot(x,solExplEuler(1,:),'DisplayName', 'Beutespezies')
hold on
plot(x,solExplEuler(2,:),'DisplayName', 'Räuberspezies')
