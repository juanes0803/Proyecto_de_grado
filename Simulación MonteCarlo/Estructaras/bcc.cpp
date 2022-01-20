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

file<<"set terminal postscript eps  enhanced color  'Times,20'"<<endl;
file<<"set title ' BCC' "<<endl;
file<<"set xrange [-1:"<<n<<"]"<<endl;
file<<"set yrange [-1:"<<n<<"]"<<endl;
file<<"set zrange [-1:"<<n<<"]"<<endl;
file<<"unset key"<<endl;
file<<"set pointsize 2.5"<<endl;
file<<"set output 'bcc.eps"<<endl;
int cont=0;
file<<"splot"; 

for(int f=0;f<=n-1;f=f+1){
for(int c=0;c<=n-1;c=c+1){
for(int k=0;k<=n-1;k=k+1){
if(S[f][c][k]==1){
file<<"'-' w p pt 9 lt 6,";
}
if(S[f][c][k]==-1){
file<<"'-' w p pt 11 lt 7, ";
}
}}}
file<<endl;

for(int f=0;f<=n-1;f=f+1){
for(int c=0;c<=n-1;c=c+1){
for(int k=0;k<=n-1;k=k+1){
if(S[f][c][k]!=0){
file<<f<<" "<<c<<" "<<k<<endl;
file<<"e"<<endl;
}
}}}

file<<"unset output "<<endl;
file<<endl<<endl;

return 0;
}

