syms y1 y2 x

%LA SEPARADA
%Fase Ferro
jf=21.7; 
j1f=-14.44;
jaf=-311;
jrf=-124.52;
%Fase spin glass
 js=6.52;
 j1s=-3.03;
 jas=-20.66;
 jrs=-27.20;
%Fase antiferro
ja=-0.0023;
j1a=15.28;
jaa=-5.18;
jra=-53.51;
%funcion
y1=piecewise(x<0.3,ja+x*j1a,(x>0.3)&(x<0.425),js+x*j1s,x>0.425,jf+x*j1f);
%gráficas
f1=figure;
fplot(y1,[0.15 0.6],'g','LineWidth',3)
hold on
plot([0.425 0.425],[0 18],'--k','LineWidth',2)
hold on
plot([0.3 0.3],[0 18],'--k','LineWidth',2)
grid on
txt1 = 'AF';
text(0.2,10,txt1,'FontSize',14)
txt2 = 'F';
text(0.45,10,txt2,'FontSize',14)
txt3 = 'SG';
text(0.35,10,txt3,'FontSize',14)
xlabel("p(%Fe)")
ylabel("J(meV)")
set(gca, 'FontSize', 12.5)

%LA JUNTA
J=0.042;  
J1=9.08;
J1a=14.13;
J1f=35.36;
Ja=-95.82;
Jaa=-5.02;
Jaf=-70.32;
Js=-0.181;
Jsa=-54.177;
Jsf=-0.49; 
 
%funcion
y2=piecewise(x<0.3,J+x*J1a,(x>0.3)&(x<0.425),J+x*J1,x>0.425,J+x*J1f);
%gráficas
f1=figure;
fplot(y2,[0.15 0.6],'y','LineWidth',2);
hold on
plot([0.425 0.425],[0 22],'--k','LineWidth',2)
hold on
plot([0.3 0.3],[0 22],'--k','LineWidth',2)
grid on
txt1 = 'AF';
text(0.2,10,txt1,'FontSize',14)
txt2 = 'F';
text(0.45,10,txt2,'FontSize',14)
txt3 = 'SG';
text(0.35,10,txt3,'FontSize',14)
xlabel("p(%Fe)")
ylabel("J(meV)")
set(gca, 'FontSize', 13)
