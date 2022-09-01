D1=[0.4247546833184656 27.390180878552883;0.4252007136485281 79.06976744186039;0.45017841213202503 209.81912144702835;0.5005798394290811 340.5684754521963;0.6 360];

S=size(D1)
z = ones(S(1,1),1);



ft = fittype('(7/8)*(1+x*tanh(K1./y)-(1-x-0.4)*tanh(a.*K1./y))', ...
            'independent', {'x', 'y'},'dependent', 'z' )


[mdl, goodness] = fit(D1,z,ft,'startpoint',[0 0])
mdl.K1;
mdl.a;
syms X Y

fimplicit((7/8)*(1+X*tanh(mdl.K1./Y)-(1-X-0.4)*tanh(mdl.a.*mdl.K1./Y)) - 1,[0.15 0.6 0 400],'-k','LineWidth',2)
hold on
grid on
plot(D1(:,1),D1(:,2),'ro','MarkerSize',8)
xlabel('p(%Fe)')
ylabel('Tc(K)')

ak=mdl.K1.*mdl.a

