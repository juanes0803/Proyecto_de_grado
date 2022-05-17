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
double m [10][2];
for(int i=0;i<=9;i=i+1){
m[i][2]=i;
m[i][1]=i;
}

double p=0;
double desvi2=0;
for(int j=0; j<=9;j=j+1){
p=prome(m,j);
desvi2=desv2(m,j,p);
cout<<"el promedio para T= "<<m[j][1]<<" es p= "<<p<<" su desviación estandar es de: "<< desvi2<<endl<<endl;
}

return 0;
}

