#include<iostream>
#include<string>
#include<fstream>
#include<cmath>
#include<math.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include<bits/stdc++.h> 
#define PI 3.14159
using namespace std; 



int rando (int n){
int m=0;
m= rand()%20; 
return m;
}



int main (){
srand (time(NULL)); 
int n=20;
int S[n][n][n];
int K[n][n][n];
double m=0;
double x=5;
double Kff=235.6;
double Ka=-11.36*Kff*(1-0.5-0.4);
double Kr=-0.04793*Kff*(1-0.5-0.4);
double Tc=700;

for (int f=0;f<=n-1;f=f+1){
for (int c=0;c<=n-1;c=c+1){
for (int k=0;k<=n-1;k=k+1){
S[f][c][k]=0;
}}}

for (int f=0;f<=n-1;f=f+1){
for (int c=0;c<=n-1;c=c+1){
for (int k=0;k<=n-1;k=k+1){
int q=rando(q);
if(k%2!=0){
if(f%2!=0){
if(c%2!=0){
S[f][c][k]=pow(-1,m);
}}}
if(k%2==0){
if(c%2==0){
if(f%2==0){
S[f][c][k]=pow(-1,m);
}}}
}}}

 x=5;
for (int f=0;f<=n-1;f=f+1){
for (int c=0;c<=n-1;c=c+1){
for (int k=0;k<=n-1;k=k+1){
double p=rand()%10+1;
if(p<=x){
K[f][c][k]=1;
}
if(p>x&&p<=x+4){
K[f][c][k]=0;
}
if(p>4+x){
K[f][c][k]=-1;
}
}}}

ofstream file;
file.open("x.plt");
file<<"set terminal postscript eps  enhanced color  'Times,20'"<<endl;
file<<"set title '"<<x<<"'"<<endl;
file<<"set xrange [0:"<<Tc+3<<"]"<<endl;
file<<"set yrange [0:1600]"<<endl;
file<<"set xlabel 'T'"<<endl;
file<<"set ylabel 'm'"<<endl;
file<<"unset key"<<endl;
file<<"set arrow from "<<Tc<<", graph 0 to "<<Tc<<", graph 1 nohead"<<endl;
file<<"set output 'x.eps"<<endl;
file<<"plot '-' w p lt 2 pt 5 ps 2 t 'm"<<endl;

for(double T=1;T<=Tc+10;T=T+10){
cout<<" T= "<<T;      
for(int cont=0;cont<=250000000;cont=cont+1){
int fi=rand()%n;
int co=rand()%n;
int z=rand()%n;
int fp=fi+1;
int fm=fi-1;
int cp=co+1;
int cm=co-1;
int zp=z+1;
int zm=z-1;
if(fp==n){
fp=0;
}
if(fm==-1){
fm=n-1;
}
if(cp==n){
cp=0;
}
if(cm==-1){
cm=n-1;
}

if(zp==n){
zp=0;
}
if(zm==-1){
zm=n-1;
}
double na = rand() % 100001;
double j=na/100000;
int Kzmfmcm=0;
int Kzmfmcp=0;
int Kzmfpcm=0;
int Kzmfpcp=0;
int Kzpfmcm=0;
int Kzpfmcp=0;
int Kzpfpcm=0;
int Kzpfpcp=0;
//el de atras-arriba-a la izquierda 
if(K[fi][co][z]==K[fm][cm][zm]&&K[fm][cm][zm]==1){
Kzmfmcm=Kff;
}
if(K[fi][co][z]==K[fm][cm][zm]&&K[fm][cm][zm]==-1){
Kzmfmcm=Ka;
}
if(K[fi][co][z]==-1&&K[fm][cm][zm]==1){
Kzmfmcm=Kr;
}
if(K[fi][co][z]==1&&K[fm][cm][zm]==-1){
Kzmfmcm=Kr;
}
//el de atras-arriba-a la derecha
if(K[fi][co][z]==K[fm][cp][zm]&&K[fi][co][z]==1){
Kzmfmcp=Kff;
}
if(K[fi][co][z]==K[fm][cp][zm]&&K[fi][co][z]==-1){
Kzmfmcp=Ka;
}
if(K[fi][co][z]==-1&&K[fm][cp][zm]==1){
Kzmfmcp=Kr;
}
if(K[fi][co][z]==1&&K[fm][cp][zm]==-1){
Kzmfmcp=Kr;
}
//el de atras-abajo-a la izquierda
if(K[fi][co][z]==K[fp][cm][zm]&&K[fi][co][z]==1){
Kzmfpcm=Kff;
}
if(K[fi][co][z]==K[fp][cm][zm]&&K[fi][co][z]==-1){
Kzmfpcm=Ka;
}
if(K[fi][co][z]==-1&&K[fp][cm][zm]==1){
Kzmfpcm=Kr;
}
if(K[fi][co][z]==1&&K[fp][cm][zm]==-1){
Kzmfpcm=Kr;
}
//el de atras-abajo-a la derecha
if(K[fi][co][z]==K[fp][cp][zm]&&K[fi][co][z]==1){
Kzmfpcp=Kff;
}
if(K[fi][co][z]==K[fp][cp][zm]&&K[fi][co][z]==-1){
Kzmfpcp=Ka;
}
if(K[fi][co][z]==-1&&K[fp][cp][zm]==1){
Kzmfpcp=Kr;
}
if(K[fi][co][z]==1&&K[fp][cp][zm]==-1){
Kzmfpcp=Kr;
}

//el de adelante-arriba-a la izquierda 
if(K[fi][co][z]==K[fm][cm][zp]&&K[fm][cm][zp]==1){
Kzpfmcm=Kff;
}
if(K[fi][co][z]==K[fm][cm][zm]&&K[fm][cm][zp]==-1){
Kzpfmcm=Ka;
}
if(K[fi][co][z]==-1&&K[fm][cm][zp]==1){
Kzpfmcm=Kr;
}
if(K[fi][co][z]==1&&K[fm][cm][zp]==-1){
Kzpfmcm=Kr;
}
//el de adelante-arriba-a la derecha
if(K[fi][co][z]==K[fm][cp][zp]&&K[fi][co][z]==1){
Kzpfmcp=Kff;
}
if(K[fi][co][z]==K[fm][cp][zp]&&K[fi][co][z]==-1){
Kzpfmcp=Ka;
}
if(K[fi][co][z]==-1&&K[fm][cp][zp]==1){
Kzpfmcp=Kr;
}
if(K[fi][co][z]==1&&K[fm][cp][zp]==-1){
Kzpfmcp=Kr;
}
//el de adelante-abajo-a la izquierda
if(K[fi][co][z]==K[fp][cm][zp]&&K[fi][co][z]==1){
Kzpfpcm=Kff;
}
if(K[fi][co][z]==K[fp][cm][zp]&&K[fi][co][z]==-1){
Kzpfpcm=Ka;
}
if(K[fi][co][z]==-1&&K[fp][cm][zp]==1){
Kzpfpcm=Kr;
}
if(K[fi][co][z]==1&&K[fp][cm][zp]==-1){
Kzpfpcm=Kr;
}
//el de adelante-abajo-a la derecha
if(K[fi][co][z]==K[fp][cp][zp]&&K[fi][co][z]==1){
Kzpfpcp=Kff;
}
if(K[fi][co][z]==K[fp][cp][zp]&&K[fi][co][z]==-1){
Kzpfpcp=Ka;
}
if(K[fi][co][z]==-1&&K[fp][cp][zp]==1){
Kzpfpcp=Kr;
}
if(K[fi][co][z]==1&&K[fp][cp][zp]==-1){
Kzpfpcp=Kr;
}
double dE=2*S[fi][co][z]*(Kzmfmcm*S[fm][cm][zm]+Kzmfmcp*S[fm][cp][zm]+Kzmfpcm*S[fp][cm][zm]+Kzmfpcp*S[fp][cp][zm]+Kzpfmcm*S[fm][cm][zp]+Kzpfmcp*S[fm][cp][zp]+Kzpfpcm*S[fp][cm][zp]+Kzpfpcp*S[fm][cp][zp]);
double p=exp(-dE/T);
if(p>1){
p=1;
}
if(j<p){
S[fi][co][z]=-1*S[fi][co][z];
}

}

double M=0;
for (int f=0;f<=n-1;f=f+1){
for (int c=0;c<=n-1;c=c+1){
for (int k=0;k<=n-1;k=k+1){
M=M+S[f][c][k];
}}}
m=abs(M);
cout<<" m= "<<m<<endl;
file<<T<<" "<<m<<endl;

}
file<<"unset output "<<endl;


return 0;
}

