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

double prome (double m[][2],int n){ //vector/matriz, Número de datos 
double prom=0;
double suma=0;
for(int w=0;w<=n;w=w+1){
suma=suma+m[w][2];
}
prom=suma/(n+1);
return prom;
}

double desv2 (double m[][2],int n,double p){ //vector/matriz, Número de datos,promedio 
double desvi2=0;
double suma=0;
for(int w=0;w<=n;w=w+1){
suma=suma+pow(m[w][2]-p,2);
}
desvi2=suma/(n+1);
return desvi2;
}




int main (){
srand (time(NULL)); 
int k=1;
int n=30;
int S[n][n][n];
int Si[n][n][n];
double m[100][2];
double Ma[100][2];
double Tc=10;
double mi=0;
double p;
int h=0;
for(int l=0;l<100;l=l+1){
m[l][1]=0;
m[l][2]=0;
}
for(int l=0;l<100;l=l+1){
Ma[l][1]=0;
Ma[l][2]=0;
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

int i=0;
for(double T=1;T<=Tc+1;T=T+0.1){
for(int cont=0;cont<=50000000;cont=cont+1){
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
double dE=k*2*S[fi][co][z]*(S[fp][co][z]+S[fm][co][z]+S[fi][cp][z]+S[fi][cm][z]+S[fi][co][zp]+S[fi][co][zm]);
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
Ma[i][2]=abs(M)/(n*n*n);
Ma[i][1]=T;

if(mi>m[i][2]&&m[i][2]<0.1){
if(h==0&&T>1){
if(mi<0.4){
Tc=T;
cout<<"Tc="<<Tc<<endl;
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

ofstream file;
file.open("dia.plt");
file<<"set terminal postscript eps  enhanced color  'Times,20'"<<endl;
file<<"set title 'm'"<<endl;
file<<"set xrange [0:"<<Tc+1<<"]"<<endl;
file<<"set yrange [0:1]"<<endl;
file<<"unset key"<<endl;
file<<"set arrow from "<<Tc<<", graph 0 to "<<Tc<<", graph 1 nohead"<<endl;
file<<"set output 'dia.eps"<<endl;
file<<"plot '-' w p lt 2 pt 5 ps 2 t 'm"<<endl;
for(int e=0;e<i-1;e=e+1){
file<<m[e][1]<<" "<<m[e][2]<<endl;
}
file<<"unset output "<<endl;
file<<"e"<<endl;

file<<"set terminal postscript eps  enhanced color  'Times,20'"<<endl;
file<<"set title 'x'"<<endl;
file<<"unset key"<<endl;
file<<"set arrow from "<<Tc<<", graph 0 to "<<Tc<<", graph 1 nohead"<<endl;
file<<"set output 'sucep.eps"<<endl;
file<<"plot '-' w p lt 2 pt 5 ps 2 t 'm"<<endl;
double pro=0;
double desvi2=0;
double susep=0;
for(int j=0; j<=i;j=j+1){
pro=prome(Ma,j);
desvi2=desv2(Ma,j,pro);
susep=desvi2/Ma[j][1];
file<<Ma[j][1]<<" "<<susep<<endl;
}


file<<"unset output "<<endl;
file<<"e"<<endl;


return 0;
}

