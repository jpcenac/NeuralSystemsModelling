v1=0; v2=1; v3=0; v4=0;

w11=.9;w12=.2;w13=0;w14=0;
w21=95;w22=.4;w23=-.5;w24=0;
w31=0;w32=.5;w33=.4;w34=-.95;
w41=0;w42=0;w43=.2;w44=.9;

V=[v1;v2;v3;v4];
W=[w11 w12 w13 w14 ; w21 w22 w23 w24; w31 w32 w33 w34; w41 w42 w43 w44];

tEnd=100;
tVec=0:tEnd;
nTs=tEnd+1;
x=zeros(1,nTs);
fly=11;
x(fly)=1;

y=zeros(4,nTs);
for t=2:nTs
        y(:,t) = W * y(:,t-1) + V * x(t-1);
end

[eVec, eVal] = eig(W);
eVal=diag(eVal);
magEVal=abs(eVal);
angEVal=(angle(eVal) ./(2*pi));
[eVec eVal magEVal angEVal];

plot(eVal, y)