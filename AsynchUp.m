%AsynchUp.m
%yInitial is the initial state (column) vector, W is the connectivity
%matrix, nTs is number of time steps (a multiple of ten) and array Y holds
%state vector y through time

function Y = AsynchUp(yInitial,W,nTs) % declare this function

[dum,nUnits]=size(W); % find the number of units in the network
Y = zeros(nTs/10, nUnits); %zero the output Y array
y = yInitial; % initialize the state of y to yInitial
for t = 1:nTs % for each time step
    rIndx=ceil(rand*nUnits); % randomly choose a state in y to update
    q=W(rIndx,:)*y; %update the selected state in y
    y(rIndx)=q>0; %impose the threshold nonlinearity
    if rem(t,10)==0, Y(t/10,:) = y'; 
    end, % at intervals save to Y array
end %end the asynchronous loop

Y = [yInitial';Y]; %place yInitial as the first row of Y