D1=[0.6 360; 0.4247546833184656 27.390180878552883;0.4252007136485281 79.06976744186039;0.450178412132025 199.99999999999994;0.45017841213202503 209.81912144702835;0.5005798394290811 340.5684754521963;0.20040142729705618 215.50387596899236;0.19995539696699371 209.81912144702835;0.19995539696699377 224.80620155038756;0.22537912578055308 208.78552971576227;0.25035682426405 178.29457364341084;0.27533452274754683 165.89147286821702 ;0.29986619090098127 64.08268733850122;0.2998661909009812 32.55813953488365; 0.325 25;0.350 27;0.375 31;0.400 50;0.350 32;0.375 37];
S=size(D1)
z = ones(S(1,1),1);
D2=[0.275 36;0.450 60;0.475 67;0.525 75;0.575 73;];


ft = fittype('(7/8)*(1-x*x*tanh((K+K1a.*x)/y)-(1-x-0.4)*(1-x-0.4)*tanh((K+aa.*(1-x-0.4))/y)-2*x*(1-x-0.4)*tanh((K+ra.*(1-x-0.4))/y))*heaviside(0.31-x)*heaviside(y-50)+(7/8)*(1+x*x*(tanh((K+K1.*x)/y)*tanh((K+K1.*x)/y))+(1-x-0.4)*(1-x-0.4)*(tanh((K+a.*(1-x-0.4))/y)*tanh((K+a.*(1-x-0.4))/y))+2*x*(1-x-0.4)*(tanh((K+r.*(1-x-0.4))/y)*tanh((K+r.*(1-x-0.4))/y)))*heaviside(0.41-x)*heaviside(x-0.31)*heaviside(60-y)+(7/8)*(1+x*x*tanh((K+K1f.*x)/y)+(1-x-0.4)*(1-x-0.4)*tanh((K+af.*(1-x-0.4))/y)+2*x*(1-x-0.4)*tanh((K+rf.*(1-x-0.4))/y))*heaviside(x-0.42)*heaviside(0.51-x)','independent', {'x', 'y'},'dependent', 'z' )

[mdl, goodness]= fit(D1,z,ft,'startpoint',[1 116 170 400  -700 -60 -800 1 -624.5 10])

syms X Y

fimplicit((7/8)*(1-X*X*tanh((mdl.K+mdl.K1a.*X)/Y)-(1-X-0.4)*(1-X-0.4)*tanh((mdl.K+mdl.aa.*(1-X-0.4))/Y)-2*X*(1-X-0.4)*tanh((mdl.K+mdl.ra.*(1-X-0.4))/Y)) - 1,[0.15 0.55 0 400],'y','LineWidth',2)
hold on 
fimplicit((7/8)*(1+X*X*tanh((mdl.K+mdl.K1f.*X)/Y)+(1-X-0.4)*(1-X-0.4)*tanh((mdl.K+mdl.af.*(1-X-0.4))/Y)+2*X*(1-X-0.4)*tanh((mdl.K+mdl.rf.*(1-X-0.4))/Y)) - 1,[0.15 0.55 0 400],'y','LineWidth',2)
hold on
fimplicit((7/8)*(1+X*X*((tanh((mdl.K+mdl.K1.*X)/Y)*tanh((mdl.K+mdl.K1.*X)/Y)))+(1-X-0.4)*(1-X-0.4)*((tanh((mdl.K+mdl.a.*(1-X-0.4))/Y)*tanh((mdl.K+mdl.a.*(1-X-0.4))/Y)))+2*(1-X-0.4)*X*((tanh((mdl.K+mdl.r.*(1-X-0.4))/Y)*tanh((mdl.K+mdl.r.*(1-X-0.4))/Y))))-1,[0.25 0.6 0 400],'y','LineWidth',2)
hold on

grid on
txt1 = 'AF';
text(0.2,100,txt1,'FontSize',14)
txt2 = 'F';
text(0.5,120,txt2,'FontSize',14)
txt3 = 'SG';
text(0.35,12,txt3,'FontSize',12)
txt4 = 'P';
text(0.35,200,txt4,'FontSize',14)
txt5 = 'RSG-F';
text(0.475,25,txt5,'FontSize',14)
txt6 = 'RSG-AF';
text(0.247,12,txt6,'FontSize',12)
set(gca, 'FontSize', 12)
xlabel('x(%Fe)')
ylabel('Tc(K)')
