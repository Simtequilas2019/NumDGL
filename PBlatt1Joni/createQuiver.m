function fig = createQuiver(f, p)
fig = figure;
nElem = 16;
meshX = linspace(0,3,nElem);
meshY = linspace(0,3,nElem);
[X,Y] = meshgrid(meshX,meshY);
U = zeros(nElem,nElem);
V = zeros(nElem,nElem);
for k = 1:nElem
    for l = 1:nElem
        foo = f(p, 0, [meshX(k),meshY(l)]);
        U(k,l) = -foo(2); %Verstehe ich nicht
        V(k,l) = -foo(1);
    end
end
quiver(X,Y,U,V);
end