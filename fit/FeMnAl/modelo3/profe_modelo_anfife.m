D4=[0.200 220;0.2 210;0.225 200;0.250 180;0.275 160;0.300 60;0.3 35];
D1=[0.20040142729705618 215.50387596899236;0.19995539696699371 209.81912144702835;0.19995539696699377 224.80620155038756;0.22537912578055308 208.78552971576227;0.25035682426405 178.29457364341084;0.27533452274754683 165.89147286821702 ;0.29986619090098127 64.08268733850122;0.2998661909009812 32.55813953488365];

S=size(D1)
z = ones(S(1,1),1);



ft = fittype('(7/8)*(1-x*x*tanh(K1./y)+(1-x-0.4)*(1-x-0.4)*tanh(x*a.*K1./y)+2*x*(1-x-0.4)*tanh(x*r.*K1./y))', ...
            'independent', {'x', 'y'},'dependent', 'z' )


mdl = fit(D1,z,ft,'Lower',[1,0,0],'startpoint',[0 0 0])
mdl.K1;
mdl.a;
mdl.r;
syms X Y

fimplicit((7/8)*(1-X*X*tanh(mdl.K1./Y)+(1-X-0.4)*(1-X-0.4)*tanh(X*mdl.a.*mdl.K1./Y)+2*X*(1-X-0.4)*tanh(X*mdl.r.*mdl.K1./Y)) - 1,[0.15 0.55 0 400],'-k')
hold on
grid on
plot(D1(:,1),D1(:,2),'ro')