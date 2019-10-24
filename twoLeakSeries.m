v1 = 1; v2 = 0; %set the weights from the input
w11 = .95; w12 =0;
w21=.5; w22 = .6; %feedback weights

V = [v1;v2];
W = [w11 w12; w21 w22];

tEnd=100;
tVec = 0 : tEnd;
nTs = tEnd + 1;
x=zeros(1,nTs);
start=11;
x(start) = 1;

y = zeros (2, nTs);
for t = 2:nTs,
    y(:,t)=W*y(:,t-1) + V * x(t-1);
end

[eVec, eVal] = eig(W);
eVal = diag(eVal);
magEVal = abs(eVal);
[eVec eVal magEVal]
plot(tVec,y)