D1=[0.02462612863010083  479.76696115839405 ;1.60378539702414  440.1508977770102 ;2.210738783858903  419.39300883475175 ;2.600617407213517  401.0596844962788 ;3.9274114770819963  365.7975832609246 ;4.6458489619031695  348.8849971126498 ;6.742086771618698  321.7546993647829 ;7.682650533485168  311.08769449136753 ;7.968061049916079  300.9509366348068 ;8.395755865098684  285.02328769341193 ;9.106896719214642  255.5871574982055 ;10.11130599975174  229.50116303544155 ;11.243406317630107  172.57718939398018 ;12.552520090020565  106.96957758336879;12.59868531121317  61.20507741876287];
D1(:,1)=D1(:,1)/100;
S=size(D1)
z = ones(S(1,1),1);


ft = fittype('(7/8)*(1+(0.65*(1-x))*(0.65*(1-x))*tanh((0.65*(1-x))*K11./y)-x*x*tanh(x*K22./y)+(0.35*(1-x))*(0.35*(1-x))*tanh((0.35*(1-x))*K33./y)-2*x*(0.65*(1-x))*tanh(x*K12./y)-2*x*(0.35*(1-x))*tanh(x*K23./y)+2*(0.35*(1-x))*(0.65*(1-x))*tanh((0.65*(1-x))*K13./y))', ...
            'independent', {'x', 'y'},'dependent', 'z' )


mdl = fit(D1,z,ft,'Lower',[1,1,1,1,1,1],'startpoint',[1 0 0 0 0 1])
mdl.K11;
mdl.K22;
mdl.K33;
mdl.K13;
mdl.K23;
mdl.K23;
syms X Y

fimplicit((7/8)*(1+(0.65*(1-X))*(0.65*(1-X))*tanh(mdl.K11.*(0.65*(1-X))/Y)-(X)*(X)*tanh(mdl.K22.*X/Y)+(0.35*(1-X))*(0.35*(1-X))*tanh(mdl.K33.*(0.35*(1-X))/Y)-2*X*(0.65*(1-X))*tanh(X*mdl.K12./Y)-2*X*(0.35*(1-X))*tanh(X*mdl.K23./Y)+2*(0.35*(1-X))*(0.65*(1-X))*tanh((0.65*(1-X))*mdl.K13./Y)) - 1,[0 0.2 0 455],'g')
hold on
grid on
plot(D1(:,1),D1(:,2),'ro')
title('Diagrama de fase del sistemas Fe-Ni-Mn con propuesta  2')
xlabel('x(%Mn)')
ylabel('Tc')
