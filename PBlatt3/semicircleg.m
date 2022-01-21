function [x,y] = semicircleg(bs,s)
% create semicrcle using three segments.
nbs = 3;

if nargin == 0,
    x = nbs;
    return
end
d = [0, pi/2,pi;
     pi/2,pi,pi+2;
     1,1,1;
     0,0,0];

bs1=bs(:)';
if find(bs1<1 | bs1>nbs),
  error('semicircleg:InvalidBs', 'Non existent boundary segment number.')
end

if nargin==1,
  x=d(:,bs1);
  return
end
x = zeros(size(s));
y = zeros(size(s));
if s<=pi & s>=0,
    x = cos(s);
    y = sin(s);
elseif s>= pi & s <=pi+2,
    x = s-pi-1;
    y = y;
end
end

