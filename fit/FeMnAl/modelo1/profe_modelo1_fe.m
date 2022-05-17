D1=[0.450 170;0.425 30;0.425 80;0.450 205;0.5 340];

S=size(D1)
z = ones(S(1,1),1);



ft = fittype('(7/8)*(1+x*tanh(K1./y)-(1-x-0.4)*tanh(a.*K1./y))', ...
            'independent', {'x', 'y'},'dependent', 'z' )


mdl = fit(D1,z,ft,'startpoint',[0 0])
mdl.K1;
mdl.a;
syms X Y

fimplicit((7/8)*(1+X*tanh(mdl.K1./Y)-(1-X-0.4)*tanh(mdl.a.*mdl.K1./Y)) - 1,[0.15 0.55 0 400],'-k')
hold on
grid on
plot(D1(:,1),D1(:,2),'ro')
title('Diagrama de fase con transición de vidrio de espín')
xlabel('x(%Fe)')
ylabel('Tc')