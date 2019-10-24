%autoConnectivity.m
%this script makes the Hebb(HB), post-synaptic(PO), Pre-Synaptic(PR), and
%Hopefield(HP) auto-associator connectivity matrices using pattern Matrix
%P. Pattern Matrix P must already be available in the workspace

[nPat, nUnits] = size(P); %find numbers of patterns and units
HB = zeros(nUnits); PO=zeros(nUnits); %define and zero HB and PO
PR = zeros(nUnits); HP=zeros(nUnits); %define and zero PR and HP

%this method impmenents the summation for connection in turn
for i=1:nUnits %for each unit as the post-synaptic unit
    for j=1:nUnits % for each unit as the pre-synaptic unit
        for l=1:nPat % for each pattern (loop variable is letter l)
            HBDW=P(l,i) * P(l,j); %compute the Hebbian update
            PODW=P(l,i) * (2*P(l,j)-1); %compute the post-synaptic update
            PRDW=(2*P(l,i)-1) * P(l,j); %compute the pre-synaptic update
            HPDW=(2*P(l,i)-1) * (2*P(l,j)-1); %compute the Hopfield update
            HB(i,j)=HB(i,j) + HBDW; %update Hebbian connection
            PO(i,j)=PO(i,j) + PODW; %update post-synaptic connection
            PR(i,j)=PR(i,j) + PRDW; %update pre-synaptic connection
            HP(i,j)=HP(i,j) + HPDW; %update Hopfield connection
        end%end pattern loop
    end%end pre-synaptic unit loop
end%end post-synaptic unit loop

%this method implements outer product summation pattern-by-pattern
% for l=1:nPat, %for each pattern(loop variable is letter l)
%     HBDW=P(l,:)' * P(l,:); %compute the entire Hebb matrix update
%     PODW=P(l,:)' * (2*P(l,:)-1); %compute the entire post-synaptic matrix update
%     PRDW=(2*P(l,:)'-1) * P(l,:); %compute the entire pre-synaptic update
%     HPDW=(2*P(l,:)'-1) * (2*P(l,:)-1); %compute the entire Hopfield matrix update
%     HB = HB + HBDW; % update the entire Hebbian Matrix
%     PO = PO + PODW; % update the entire post-synaptic Matrix
%     PR = PR + PRDW; % update the entire pre-synaptic Matrix
%     HP = HP + HPDW; % update the entire Hopfield Matrix
% end


MSK = (ones(nUnits) - eye(nUnits)); %construct the masking matrix
HB = HB .* MSK; %zero self-connections in Hebbian matrix
PO = PO .* MSK; %zero self-connections in post-synaptic matrix
PR = PR .* MSK; %zero self-connections in pre-synaptic matrix
HP = HP .* MSK; %zero self-connections in Hopfield matrix
