omeg.o = [0,0];
omeg.x = 3;
omeg.y = 3;
omeg.h = 0.1;
O1 = genRectMesh2D(omeg);
omeg.x = 2;
omeg.y = 2;
omeg.o = [1.3, 1.5];
O2 = genRectMesh2D(omeg);
OM1 = O1.pointMat
OM2 = O2.pointMat
plot(OM1(:,1), OM1(:,2),'ro'); hold on
plot(OM2(:,1), OM2(:,2),'b*'); hold off

pl = OM1(~logical(isInO2),:)
figure
plot(pl(:,1),pl(:,2),'ro');