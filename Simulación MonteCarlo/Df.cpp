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
int b=0;
b= rand()%100+1; //generar numero de 1 a 100
return b;
}



int main (){
srand (time(NULL)); 
int k=1;
int n=15;
int S[n][n][n];
int Si[n][n][n];
double m[100][2];
double Tc=10;
double X[5][2];
double mi=0;
double p;
int K[n][n][n];
for(int l=0;l<100;l=l+1){
m[l][1]=0;
m[l][2]=0;
}

for (int f=0;f<=n-1;f=f+1){
for (int c=0;c<=n-1;c=c+1){
for (int k=0;k<=n-1;k=k+1){
p=rando(p);
S[f][c][k]=pow(-1,p);
}}}

for(int f=0;f<=n-1;f=f+1){
for(int c=0;c<=n-1;c=c+1){
for(int k=0;k<=n-1;k=k+1){
Si[f][c][k]=S[f][c][k];
}}}

for(int x=5;x<=10;x=x+1){
cout<<"x= "<<x<<endl;
int h=0;
Tc=20;
for (int f=0;f<=n-1;f=f+1){
for (int c=0;c<=n-1;c=c+1){
for (int k=0;k<=n-1;k=k+1){
p=rand()%10+1;
if(p<=x){
K[f][c][k]=5;
}
if(p>x){
K[f][c][k]=0;
}
}}}

int i=0;
for(double T=0.5;T<=Tc;T=T+0.2){
for(int cont=0;cont<=70000000;cont=cont+1){
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
double na = rand() % 100000+1;
double j=na/100000;
 int Kfp=3;
 int Kfm=3;
 int Kcp=3;
 int Kcm=3;
 int Kzp=3;
 int Kzm=3;
if(K[fi][co][z]==0||K[fp][co][z]==0){
Kfp=0;
}
if(K[fi][co][z]==0||K[fm][co][z]==0){
Kfm=0;
}
if(K[fi][co][z]==0||K[fi][cp][z]==0){
Kcp=0;
}
if(K[fi][co][z]==0||K[fi][cm][z]==0){
Kcm=0;
}
if(K[fi][co][z]==0||K[fi][co][zp]==0){
Kzp=0;
}
if(K[fi][co][z]==0||K[fi][co][zm]==0){
Kzm=0;
}
double dE=2*S[fi][co][z]*(Kfp*S[fp][co][z]+Kfm*S[fm][co][z]+Kcp*S[fi][cp][z]+Kcm*S[fi][cm][z]+Kzp*S[fi][co][zp]+Kzm*S[fi][co][zm]);
double p=exp(-dE/T);
if(p>1){
p=1;
}
if(j<p)
S[fi][co][z]=-1*S[fi][co][z];
}
double M=0;
for(int f=0;f<=n-1;f=f+1){
for(int c=0;c<=n-1;c=c+1){
for(int k=0;k<=n-1;k=k+1){
M=S[f][c][k]+M;
}}}
m[i][2]=abs(M)/(n*n*n);
m[i][1]=T;
cout<<" T= "<<T<<endl;
if(mi>m[i][2]&&m[i][2]<0.07){
if(h==0&&T>1.5){
if(mi<0.4){
Tc=T;
cout<<"x= "<<x<<" Tc= "<<Tc<<endl;
h=1;
}}}

for(int f=0;f<=n-1;f=f+1){
for(int c=0;c<=n-1;c=c+1){
for(int k=0;k<=n-1;k=k+1){
S[f][c][k]=Si[f][c][k];
}}}

mi=m[i][2];
i=i+1;
}

cout<<" "<<endl;
X[(x-5)][1]=x;
X[(x-5)][2]=Tc;
}


ofstream file;
file.open("dia.plt");
file<<"set terminal postscript eps  enhanced color  'Times,20'"<<endl;
file<<"set title 'Diagrama de fase ferro-para'"<<endl;
file<<"set xrange [0:1]"<<endl;
file<<"set yrange [0:"<<Tc+1<<"]"<<endl;
file<<"set xlabel 'x(%)'"<<endl;
file<<"set ylabel 'Tc'"<<endl;
file<<"unset key"<<endl;
file<<"set output 'dia.eps"<<endl;
file<<"y(x)=3/( atanh(1/(x*x*5)))"<<endl;
file<<"plot '-' w p lt 2 pt 5 ps 2 t 'm', y(x) w l lw 2 lt 2 notitle"<<endl;
for(int e=0;e<=5;e=e+1){
file<<X[e][1]/10<<" "<<X[e][2]<<endl;
}
file<<"unset output "<<endl;

return 0;
}
	
