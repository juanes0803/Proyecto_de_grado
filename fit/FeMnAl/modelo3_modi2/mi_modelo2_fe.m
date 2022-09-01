D1=[0.4247546833184656 27.390180878552883;0.4252007136485281 79.06976744186039;0.450178412132025 199.99999999999994;0.45017841213202503 209.81912144702835;0.5005798394290811 340.5684754521963;0.6 360];
D6=[0.450 170;0.425 30;0.425 80;0.450 205;0.5 340];

S=size(D1)
z = ones(S(1,1),1);



ft = fittype('(7/8)*(1+x*x*tanh((K+K1.*x)/y)+(1-x-0.4)*(1-x-0.4)*tanh((K+a.*(1-x-0.4))/y)+2*x*(1-x-0.4)*tanh((K+r.*(1-x-0.4))/y))', ...
            'independent', {'x', 'y'},'dependent', 'z' )



[mdl, goodness]= fit(D1,z,ft,'startpoint',[1 1 1 1])
mdl.K1;
mdl.a;
mdl.r;
syms X Y

fimplicit((7/8)*(1+X*X*tanh((mdl.K+mdl.K1.*X)/Y)+(1-X-0.4)*(1-X-0.4)*tanh((mdl.K+mdl.a.*(1-X-0.4))/Y)+2*X*(1-X-0.4)*tanh((mdl.K+mdl.r.*(1-X-0.4))/Y)) - 1,[0.15 0.6 0 400],'g','LineWidth',2)
hold on
grid on


plot(D1(:,1),D1(:,2),'ro','MarkerSize',8)
xlabel('p(%Fe)')
ylabel('Tc(K)')
