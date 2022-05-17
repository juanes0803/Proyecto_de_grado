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
ofstream file;
file.open("bcc.plt");
int n=20;
int S[n][n][n];
int Si[n][n][n];
int K[n][n][n];
int m;


for (int f=0;f<=n-1;f=f+1){
for (int c=0;c<=n-1;c=c+1){
for (int k=0;k<=n-1;k=k+1){
S[f][c][k]=0;
}}}

for (int f=0;f<=n-1;f=f+1){
for (int c=0;c<=n-1;c=c+1){
for (int k=0;k<=n-1;k=k+1){
m=rando(m);
if(k%2!=0){
if(f%2!=0){
if(c%2!=0){
S[f][c][k]=pow(-1,m);
}
}
}
if(k%2==0){
if(c%2==0){
if(f%2==0){
S[f][c][k]=pow(-1,m);
}
}
}
}}}
for(int f=0;f<=n-1;f=f+1){
for(int c=0;c<=n-1;c=c+1){
for(int k=0;k<=n-1;k=k+1){
Si[f][c][k]=S[f][c][k];
}}}

for(double x=6;<=4.2;x=x-0.2){
cout<<"x= "<<x<<endl;
int h=0;
Tc=20;
for(int f=0;f<=n-1;f=f+1){
for(int c=0;c<=n-1;c=c+1){
for(int k=0;k<=n-1;k=k+1){
p=rand()%10+1;
if(p<=4){
K[f][c][k]=0;}
if(p>4&&p<=4+x){
K[f][c][k]=1;}
if(p>4+x){
K[f][c][k]=-1;}
}}}}



}



}




return 0;
}

