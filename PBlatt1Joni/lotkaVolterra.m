function yDot = lotkaVolterra(p, t, y)
yDot = zeros(2,1);
if all(y > 0)
yDot(1) = ( p.alpha -  p.beta * y(2) ) * y(1); %Change of prey
yDot(2) = (-p.gamma + p.delta * y(1) ) * y(2); %Change of hunter
end
end