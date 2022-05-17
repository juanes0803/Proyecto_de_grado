
D1=[0.325 25;0.350 27;0.350 32;0.375 31;0.375 37;0.400 50];

S=size(D1)
z = ones(S(1,1),1);

ft = fittype('(7/8)*(1+x*(tanh(K1./y)*tanh(K1./y))+(1-x-0.4)*(tanh(a.*K1./y)*tanh(a.*K1./y))+x*(1-x-0.4)*(tanh(r.*K1./y)*tanh(r.*K1./y)))*(x>0.3)*(x<=0.4)', ...
            'independent', {'x', 'y'},'dependent', 'z' )

mdl = fit(D1,z,ft,'Lower',[1,0,0],'startpoint',[1 1 1])
syms X Y
fimplicit((7/8)*(1+X*((tanh(mdl.K1/Y)*tanh(mdl.K1/Y)))+(1-X-0.4)*((tanh(mdl.a.*mdl.K1/Y)*tanh(mdl.a.*mdl.K1./Y)))+(1-X-0.4)*X*((tanh(mdl.r.*mdl.K1/Y)*tanh(mdl.r.*mdl.K1./Y))))-1,[0.3 0.42 0 370],'-k')
hold on
grid on
txt1 = 'AF';
text(0.2,100,txt1,'FontSize',14)
txt2 = 'F';
text(0.45,100,txt2,'FontSize',14)
txt3 = 'SG';
text(0.35,10,txt3,'FontSize',12)
txt4 = 'P';
text(0.35,200,txt4,'FontSize',14)
title('Diagrama de fase modelo 2')
plot(D1(:,1),D1(:,2),'ro')


D=[0.200 220;0.2 210;0.225 200;0.250 180;0.275 160;0.300 60;0.3 35;0.450 170;0.425 30;0.425 80;0.450 205;0.5 340;0.325 25;0.350 27;0.350 32;0.375 31;0.375 37;0.400 50];
Teo=[0.200 223.027;0.2 223.027;0.225 171.912;0.250 171.912;0.275 143.204;0.300 37.3535;0.3 37.3535;0.450 182.12;0.425 112.785;0.425 112.785;0.450 182.12;0.5 330.833;0.325 34.8559;0.350 32.1392;0.350 32.1392;0.375 29.1255;0.375 29.1255;0.400 25.6723];
chi=0;
for cont=1:18
    chi=chi+((D(cont,2)-Teo(cont,2))^2)/Teo(cont,2);    
end
chi