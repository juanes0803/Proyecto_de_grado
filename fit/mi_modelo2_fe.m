D1=[0.450 170;0.425 30;0.425 80;0.450 205;0.5 340];

S=size(D1)
z = ones(S(1,1),1);



ft = fittype('(7/8)*(1+x*x*tanh(x*K1./y)-(1-x-0.4)*(1-x-0.4)*tanh((1-x-0.4)*a./y)-2*x*(1-x-0.4)*tanh((1-x-0.4)*r./y))', ...
            'independent', {'x', 'y'},'dependent', 'z' )


mdl = fit(D1,z,ft,'Lower',[1,60,0],'startpoint',[55 1 1])
mdl.K1;
mdl.a;
mdl.r;
syms X Y

fimplicit((7/8)*(1+X*X*tanh(mdl.K1.*X/Y)-(1-X-0.4)*(1-X-0.4)*tanh((1-X-0.4)*mdl.a./Y)-2*X*(1-X-0.4)*tanh((1-X-0.4)*mdl.r./Y)) - 1,[0.15 0.65 0 400],'-.g')
hold on
grid on
plot(D1(:,1),D1(:,2),'ro')
title('Diagrama de fase con transición de vidrio de espín')
xlabel('x(%Fe)')
ylabel('Tc')
