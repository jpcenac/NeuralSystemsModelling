v1 = 1; v2 = 0;
w11 = 0; w12 = .2;
w21 = 0; w22 = .95;

V = [v1; v2];
W = [w11 w12; w21 w22];

tEnd = 100;
tVec = 0:tEnd;
nTs = tEnd + 1;
dkc = 0.9; %input geometric decay constant
x = (dkc) .^ (tVec);

y = zeros(2, nTs);
for t = 2:nTs,
    y(:,t) = W*y(:,t-1) + V*x(t-1);
end

plot(tVec, y)