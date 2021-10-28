y_0 = 1;
T = 1;
tau = 0.1;


explicit_heun(@f, y_0, T, tau)

[X,Y] = meshgrid(0:6,0:6);
U = 0.25*X;
V = 0.*Y;
quiver(X,Y,U,V)