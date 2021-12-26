%Great fundamental idear, but not performant enough



function OmegaHBar = meshSubtract(Omega, subOmega, edgeDetails)
%Subtracts a rectangular mesh from an arbitrary cubic Mesh while keeping the
%edges
if subOmega.h ~= Omega.h
    error("Meshsizes h are different");
end
h = subOmega.h;

if mod(subOmega.o(1)-Omega.o(1), h) ~= 0 || mod(subOmega.o(2)-Omega.o(2), h) ~= 0
    error("Origins are not a multiple of h appart from each other")
end


%Subtracting inner rectangle without the border
innerPoints.x = subOmega.x - 2*h;
innerPoints.y = subOmega.y - 2*h;
innerPoints.o = subOmega.o + [h, h];
innerPoints.h = h;


innerPoints = genRectMesh2D(innerPoints);
Omega.pointMat = meshSubtractWithEdge(Omega.pointMat,innerPoints.pointMat);
border = meshSubtractWithEdge(subOmega.pointMat, innerPoints.pointMat);
pM = Omega.pointMat;


%For every Element on the border check, if it is isolated or not - if remove
for k = 1:2
idx = zeros(size(border,1));
keep = true(size(pM,1),1);
for k1 = 1:size(border,1)
    bP = border(k1,:);
    %Search index of borderPoint bP in pM 
    %and if there is a 
    neighX = false; %neighbour
    neighY = false;
    for k2 = 1:size(pM)
        if equalEps(bP, pM(k2,:))
            idx(k1) = k2;
        elseif equalEps(bP + [0 h],pM(k2,:))
            neighY = true;
        elseif equalEps(bP + [0 -h], pM(k2,:))
            neighY = true;
        end
    end
    if (idx(k1) > 1) && (idx(k1) < size(pM,1)) 
    
        if equalEps((bP + [-h 0]), pM(idx(k1)-1,:)) || equalEps((bP + [h 0]), pM(idx(k1)+1,:)) %lexikografisch
            neighX = true;
        end
        
        if neighX && neighY
        keep(idx(k1)) = false;
        end
    elseif idx(k1) == 1
        if neighY && equalEps((bP + [h 0]), pM(idx(k1)+1,:))
            keep(idx(k1)) = false;
        end
    elseif idx(k1) == size(pM,1)
        if neighY && equalEps((bP + [-h 0]), pM(idx(k1)-1,:))
            keep(idx(k1)) = false;
        end
    end
    
end
pM = pM(keep,:);
end
Omega.pointMat = pM;
OmegaHBar = Omega;


end