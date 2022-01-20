D1=[0.200 220;0.2 210;0.225 200;0.250 180;0.275 160;0.300 60;0.3 35];

S=size(D1)
z = ones(S(1,1),1);



ft = fittype('(7/8)*(1-x*x*tanh(K1./y)+(1-x-0.4)*(1-x-0.4)*tanh((1-x-0.4)*a.*K1./y)+2*x*(1-x-0.4)*tanh((1-x-0.4)*r.*K1./y))', ...
            'independent', {'x', 'y'},'dependent', 'z' )


mdl = fit(D1,z,ft,'startpoint',[100 0 0])
mdl.K1;
mdl.a;
mdl.r;
syms X Y

fimplicit((7/8)*(1-X*X*tanh(mdl.K1./Y)+(1-X-0.4)*(1-X-0.4)*tanh((1-X-0.4)*mdl.a.*mdl.K1./Y)+2*X*(1-X-0.4)*tanh((1-X-0.4)*mdl.r.*mdl.K1./Y)) - 1,[0.15 0.65 0 400],'--b')
hold on
grid on
plot(D1(:,1),D1(:,2),'ro')