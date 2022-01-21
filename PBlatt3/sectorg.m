function [x,y] = sectorg(bs,s)
% create scetor circlee using one segment (depends on alpha)
nbs = 3;

alpha = 5*pi/3;
if nargin == 0,
    x = nbs;
    return
end
d = [0,1, alpha+1;
     1,alpha+1, alpha+2;
     1,1,1;
     0,0,0];

bs1=bs(:)';

if find(bs1<1 | bs1>nbs),
  error('scetorg:InvalidBs', 'Non existent boundary segment number.')
end

if nargin==1,
  x=d(:,bs1);
  return
end
x = zeros(size(s));
y = zeros(size(s));
if s >= 0 & s<= 1,
    x = s;
    y = y;
elseif s>=1 & s <= alpha+1,
    x = cos(s-1);
    y = sin(s-1);
elseif s >= alpha+1 & s <= alpha+2,
    x = cos(alpha)-cos(alpha)*(s-alpha-1);
    y = sin(alpha)-sin(alpha)*(s-alpha-1);
end
end