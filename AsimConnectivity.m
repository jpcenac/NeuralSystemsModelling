%AsimConnectivity.m
%this script makes an asymmetric Hopfield matrix(HP)
%pattern matrix P must already be available in the workspace

a = 2; %set size of asymmetric modulation
[nPat, nUnits] = size(P); %find the number of pattern and units

HP = zeros(nUnits);
HP = (2*P'-1) * (2*P-1); %compute the Hopfield auto-covaration matrix 
for l=1:nPat-1, %for each pair of successive patterns
    HPDW=(2*P(l+1,:)'-1) * (2*P(l,:)-1); %compute the asymmetric update
    HP = HP + a * HPDW; %update entire Hopfield connectivitiy matrix
end %end pattern loop

MSK = (ones(nUnits) - eye(nUnits)); %construct the masking matrix
HP = HP .* MSK; %zero self-connections in Hopfield matrix
    