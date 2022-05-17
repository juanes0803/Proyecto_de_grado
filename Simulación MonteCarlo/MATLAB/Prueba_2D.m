n=16;
mcs=500000;
S=zeros(n);
M=zeros(99,mcs);
t=zeros(99,1);
suma=0;
e=1;
Mp=zeros(99,1);
En=zeros(99,mcs);
Ep=zeros(99,1);
sumae=0;
J=1;


for i=1:n
  for j=1:n
  a=floor(rand*10);
  S(i,j)=(-1)^(a);
  end
end %generar el estado inicial (aleatorio/ para magnerico)

for T=5:-0.05:0.1 % pasos de temperatura
 for cont=1:(mcs+10000)  %pasos MonteCarlo
   f=randi(n);
   c=randi(n);
   cp=c+1;
   cm=c-1;
   fp=f+1;
   fm=f-1;
   if c==n
       cp=1;
   end
   if c==1
       cm=n;
   end
   if f==n
       fp=1;
   end
   if f==1
       fm=n;
   end
   dE=2*J*S(f,c)*(S(f,cp)+S(f,cm)+S(fp,c)+S(fm,c));
   p=exp(-dE/T);
   if dE<0
       p=1;
   end
   E=rand;
   if E<p||dE<0  %comparación monteCarlo
       S(f,c)=-S(f,c);
   end
   
 if cont>10000  %termalización de 10^4 pasos
  suma=0;
 for jl=1:n  
 for il=1:n
   suma=suma+S(jl,il);  
 end
 end%maganetización
  M(e,cont-10000)=(suma/(n*n));
  
 end
 
 end

 T
  t(e,1)=T;
 e=1+e;
end

Mt=transpose(M);
Mp=mean(Mt);
Mv=var(Mt);
Mt2=transpose(M.*M);
Mp2=mean(Mt2);
suscep=transpose(Mv)./t;

f1 = figure
plot(t(:,1),abs(Mp(1,:)),'ro')
xlabel('T')
ylabel('|<M>|')

f2 = figure;
plot(t(:,1),suscep,'ro')
xlabel('T')
ylabel('(<M>^2-<M^2>)/T')

