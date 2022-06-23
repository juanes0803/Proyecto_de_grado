n=14;  %tamaño del arreglo nxnxn de la celda BCC de espines
mcs=300000; %numero de pasos mot¿nte carlo
S=zeros(n); %matriz en cero nxn que se usará para construir la celda de espines
M=zeros(39,mcs); %matrizque guarda lso valores de magnetización para cada ´paso montecarlo y cada temperatura
t=zeros(39,1); %arreglo que guarda las temperaturas
suma=0;
e=1;
Mp=zeros(39,1); % arreglo que guarda la magnetización promedio
K=zeros(n);%matriz en cero nxn que se usará para construir la celda de interacciónd e cada espín
x=6.75;%concebtración del hierro*10
fe=0;%variable que guarda el numero de espines ferro que 
para=0;%variable que guarda el numero de espines ferro para
Kf=1.719*(x/10); %energia de interacción reescalada del enlace Fe-Fe dependiente de la concentración

for w=1:n %creación de la matriz de ceros S 3D
 S(:,:,w)=zeros(n);
end 

for y=1:n %genera la matriz de ceros K 3D
   K(:,:,w)=zeros(n);  
end

for i=1:n %genera un estado inical BCC 
   for j=1:n
       for k=1:n 
           if mod(k,2)==0&mod(j,2)==0&mod(i,2)==0 %solo pone un espín en celdas donde todos sus numero son pares
               a=randi(10);
               S(i,j,k)=(-1)^(a);   %le da orientaciín aleatoria al espín
           end
           if mod(k,2)~=0&mod(j,2)~=0&mod(i,2)~=0 %solo pone un espín en celdas donde todos sus numero son impares
               a=randi(10);
               S(i,j,k)=(-1)^(a);    %le da orientaciín aleatoria al espín
           end           
       end
   end
end 

for ki=1:n %genera un estado inical BCC (de K) para los spines dependiendo de la cantidad ferro
   for kj=1:n
       for kk=1:n 
        if mod(ki,2)==0&&mod(kj,2)==0&&mod(kk,2)==0
           b=(randi(1000)/100);

           if b<=x %dependiendo de la concentración y un numero aleatorio le asigna el tipo de interacción ferro
               K(ki,kj,kk)=1;
               fe=fe+1;
           end
           if b>x %dependiendo de la concentración y un numero aleatorio le asigna el tipo de interacción para
               K(ki,kj,kk)=0;
               para=para+1;
           end
        end
        if mod(ki,2)~=0&&mod(kj,2)~=0&&mod(kk,2)~=0
           b=(randi(1000)/100);

           if b<=x %dependiendo de la concentración y un numero aleatorio le asigna el tipo de interacción ferro
               K(ki,kj,kk)=1;
               fe=fe+1;
           end
           if b>x %dependiendo de la concentración y un numero aleatorio le asigna el tipo de interacción para
               K(ki,kj,kk)=0; 
               para=para+1;
           end
        end
       end 
   end    
end

for T=7:-0.1:3.1 % pasos de temperatura
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
   
   %asigno condiciones de forntera periodicas
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
 
%selección del tipo de interacción y asignación de energia de interacción para el vecino fp,cp,zp(1)
if K(f,c,z)==K(fp,cp,zp)&&K(f,c,z)==1
 Kfpcpzp=Kf;    
end

%selección del tipo de interacción y asignación de energia de interacción para el vecino fp,cp,zm(2)
if K(f,c,z)==K(fp,cp,zm)&&K(f,c,z)==1
 Kfpcpzm=Kf;    
end

%selección del tipo de interacción y asignación de energia de interacción para el vecino fp,cm,zp(3)
if K(f,c,z)==K(fp,cm,zp)&&K(f,c,z)==1
 Kfpcmzp=Kf;    
end


%selección del tipo de interacción y asignación de energia de interacción para el vecino fp,cm,zm(4)
if K(f,c,z)==K(fp,cm,zm)&&K(f,c,z)==1
 Kfpcmzm=Kf;    
end

%selección del tipo de interacción y asignación de energia de interacción para el vecino fm,cp,zp(5)
if K(f,c,z)==K(fm,cp,zp)&&K(f,c,z)==1
 Kfmcpzp=Kf;    
end

%selección del tipo de interacción y asignación de energia de interacción para el vecino fm,cp,zm(6)
if K(f,c,z)==K(fm,cp,zm)&&K(f,c,z)==1
 Kfmcpzm=Kf ;   
end
 
%selección del tipo de interacción y asignación de energia de interacción para el vecino fm,cm,zp(7)
if K(f,c,z)==K(fm,cm,zp)&&K(f,c,z)==1
 Kfmcmzp=Kf;    
end

%selección del tipo de interacción y asignación de energia de interacción para el vecino fm,cm,zm(8)
if K(f,c,z)==K(fm,cm,zm)&&K(f,c,z)==1
 Kfmcmzm=Kf;    
end

%sacó el delta de energía para el cambio
   dE=2*S(f,c,z)*(Kfpcpzp*S(fp,cp,zp)+Kfpcpzm*S(fp,cp,zm)+Kfpcmzp*S(fp,cm,zp)+Kfpcmzm*S(fp,cm,zm)+Kfmcpzp*S(fm,cp,zp)+Kfmcpzm*S(fm,cp,zm)+ Kfmcmzp*S(fm,cm,zp)+Kfmcmzm*S(fm,cm,zm));
%defino el criterio de aceptación para el cambio   
   p=exp(-dE/T);
   if p>1
       p=1;
   end
   
   E=rand; %numero aleatorio montecarlo
   if E<p||dE<0  %comparación monteCarlo
       S(f,c,z)=-S(f,c,z);
   end
   
 if cont>10000  %termalización de 10^4 pasos
  suma=0;
 for jl=1:n  
  for il=1:n
   for kl=1:n   
   suma=suma+S(il,jl,kl);  %se calcula la magnetización
   end   
  end
 end%maganetización
  M(e,cont-10000)=(suma/(n*n*n/4)); %se guarda el dato de magnetización
 
 end
end 
 T
  t(e,1)=T; %guarda los valores de temperatura
 e=1+e;

end
Mt=transpose(M);
Mp=mean(Mt); %calcula el promedio de la magnetización
Mv=var(Mt); %calcula la varianza de la magnetización
suscep=transpose(Mv)./t;%calcula la susceptibilidad

%graficas de magnetización y susceptibilidad
f1 = figure
plot(t(:,1),abs(Mp(1,:)),'ro')
xlabel('T')
ylabel('<|M|>')

f2 = figure;
plot(t(:,1),suscep,'ro')
xlabel('T')
ylabel('(<M>^2-<M^2>)/T')


