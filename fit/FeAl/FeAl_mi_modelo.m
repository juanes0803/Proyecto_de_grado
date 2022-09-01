D1=[0.21715817694369968 6.114803625377643;0.2428954423592493 5.244712990936557;0.268632707774799 4.47129909365559;0.32171581769436997 3.375629405840887;0.3474530831099195 2.972809667673718;0.3715817694369973 2.7472306143001024;0.39731903485254694 2.618328298086608;0.42627345844504017 2.376636455186306];

for i=1:8
D1(i,2)=148.8*D1(i,2);
end

S=size(D1)
z = ones(S(1,1),1);



ft = fittype('(7/8)*(1+(1-x)*(1-x)*tanh((Ko+K1.*(1-x))/y))','independent', {'x', 'y'},'dependent', 'z' )

f1 = figure;

[mdl, goodness]= fit(D1,z,ft,'startpoint',[0 0])
mdl.K1;
syms X Y
fimplicit((7/8)*(1+(1-X)*(1-X)*tanh((mdl.Ko+mdl.K1.*(1-X))/Y)) - 1,[0.15 0.5 0 1000],'g','LineWidth',2)
hold on
grid on
plot(D1(:,1),D1(:,2),'ro','MarkerSize',8)
txt2 = 'F';
text(0.35,200,txt2,'FontSize',14)
txt4 = 'P';
text(0.35,700,txt4,'FontSize',14)
set(gca, 'FontSize', 13)
legend({'Modelo','Dat. Experimentales'})
xlabel('q(%Al)')
ylabel('Tc')


