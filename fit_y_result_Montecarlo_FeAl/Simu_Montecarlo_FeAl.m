n=14;
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
K=zeros(n);
J=1;
x=5.75;%cantidad de hierro*10
fe=0;
para=0;
Kf=1.614 *(x/10)+ 0.07109;

for w=1:n
 S(:,:,w)=zeros(n);
end %creación de la matriz S 3D

for y=1:n
   K(:,:,w)=zeros(n); 
end%genera la matriz de K 3D

for i=1:n
   for j=1:n
       for k=1:n 
           if mod(k,2)==0&mod(j,2)==0&mod(i,2)==0
               a=randi(10);
               S(i,j,k)=(-1)^(a);   
           end
           if mod(k,2)~=0&mod(j,2)~=0&mod(i,2)~=0
               a=randi(10);
               S(i,j,k)=(-1)^(a);   
           end           
       end
   end
end %genera un estado inical BCC 

for ki=1:n
   for kj=1:n
       for kk=1:n 
        if mod(ki,2)==0&&mod(kj,2)==0&&mod(kk,2)==0
           b=(randi(1000)/100);

           if b<=x
               K(ki,kj,kk)=1;
               fe=fe+1;
           end
           if b>x
               K(ki,kj,kk)=0;
               para=para+1;
           end
        end
        if mod(ki,2)~=0&&mod(kj,2)~=0&&mod(kk,2)~=0
           b=(randi(1000)/100);

           if b<=x
               K(ki,kj,kk)=1;
               fe=fe+1;
           end
           if b>x
               K(ki,kj,kk)=0;
               para=para+1;
           end
        end
       end 
   end    
end%genera un estado inical BCC (de K) para los spines dependiendo de la cantidad ferro

for T=6:-0.05:1.05 % pasos de temperatura
 for cont=1:mcs+10000  %pasos MonteCarlo

   ale=randi(n);%generador de # aleatorios BCC así no pierdo pasos MC en casillas vacias
  if(mod(ale,2)==0)   
   f=randi(n/2)*2;
   c=randi(n/2)*2;
   z=randi(n/2)*2;
  end
  if(mod(ale,2)~=0)
   f=randi((n/2))*2-1;
   c=randi((n/2))*2-1;
   z=randi((n/2))*2-1;
  end
   
   cp=c+1;
   cm=c-1;
   fp=f+1;
   fm=f-1;
   zp=z+1;
   zm=z-1;
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
   if z==n
       zp=1;
   end
   if z==1
       zm=n;
   end
   
 Kfpcpzp=0;%fp,cp,zp(1)    
 Kfpcpzm=0;%fp,cp,zm(2)  
 Kfpcmzp=0;%fp,cm,zp(3) 
 Kfpcmzm=0;%fp,cm,zm(4)
 Kfmcpzp=0;%fm,cp,zp(5)    
 Kfmcpzm=0;%fm,cp,zm(6)   
 Kfmcmzp=0;%fm,cm,zp(7)   
 Kfmcmzm=0;%fm,cm,zm(8)  
 
%selecciones para el vecino fp,cp,zp(1)
if K(f,c,z)==K(fp,cp,zp)&&K(f,c,z)==1
 Kfpcpzp=Kf;    
end

%selecciones para el vecino fp,cp,zm(2)
if K(f,c,z)==K(fp,cp,zm)&&K(f,c,z)==1
 Kfpcpzm=Kf;    
end

%selecciones para el vecino fp,cm,zp(3)
if K(f,c,z)==K(fp,cm,zp)&&K(f,c,z)==1
 Kfpcmzp=Kf;    
end


%selecciones para el vecino fp,cm,zm(4)
if K(f,c,z)==K(fp,cm,zm)&&K(f,c,z)==1
 Kfpcmzm=Kf;    
end

%selecciones para el vecino fm,cp,zp(5)
if K(f,c,z)==K(fm,cp,zp)&&K(f,c,z)==1
 Kfmcpzp=Kf;    
end

%selecciones para el vecino fm,cp,zm(6)
if K(f,c,z)==K(fm,cp,zm)&&K(f,c,z)==1
 Kfmcpzm=Kf ;   
end
 
%selecciones para el vecino fm,cm,zp(7)
if K(f,c,z)==K(fm,cm,zp)&&K(f,c,z)==1
 Kfmcmzp=Kf;    
end

%selecciones para el vecino fm,cm,zm(8)
if K(f,c,z)==K(fm,cm,zm)&&K(f,c,z)==1
 Kfmcmzm=Kf;    
end


   dE=2*S(f,c,z)*(Kfpcpzp*S(fp,cp,zp)+Kfpcpzm*S(fp,cp,zm)+Kfpcmzp*S(fp,cm,zp)+Kfpcmzm*S(fp,cm,zm)+Kfmcpzp*S(fm,cp,zp)+Kfmcpzm*S(fm,cp,zm)+ Kfmcmzp*S(fm,cm,zp)+Kfmcmzm*S(fm,cm,zm));
   p=exp(-dE/T);
   if p>1
       p=1;
   end
   E=rand;
   if E<p||dE<0  %comparación monteCarlo
       S(f,c,z)=-S(f,c,z);
   end
   
 if cont>10000  %termalización de 10^4 pasos
  suma=0;
 for jl=1:n  
  for il=1:n
   for kl=1:n   
   suma=suma+S(il,jl,kl);  
   end   
  end
 end%maganetización
  
  M(e,cont-10000)=(suma/(n*n*n/4));
 
 end
 end 
  T
  t(e,1)=T;
  e=1+e;
 
end

Mt=transpose(M);
Mp=mean(Mt);
Mv=var(Mt);
suscep=transpose(Mv)./t;

f1 = figure;
plot(t(:,1),abs(Mp(1,:)),'ro');
legend({'p=0.575'});
set(gca, 'FontSize', 12);
xlabel('T');
ylabel('<|M|>');

f2 = figure;
plot(t(:,1),suscep,'ro');
legend({'p=0.575'});
set(gca, 'FontSize', 12);
xlabel('kT');
ylabel('(<M>^2-<M^2>)/T')


