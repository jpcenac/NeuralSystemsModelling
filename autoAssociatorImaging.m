%Auto Associator Image

%P = [1 0 1 0 1 0 1 0 1 0 ; 1 0 0 1 1 1 1 0 0 1 ];
%P = zeros(3,50), P(1,[1:2:49])=1, P(2, [1:5 11:15 21:25 31:35 41:45])=1, P(3,[2:2:50])=1
%P=zeros(3,50), P(2, [1:511:15 21:25 31:35 41:45])=1;
%P = zeros(3,50), P(1,[1:2:49])=1;
yInitial = P(1,:)';
%yInitial = P(2,:)';
%yInitial = 0.5*P(1,:)';
%yInitial = [1 1 1 1 0 0 0 0 0 1]';
YHP = AsynchUp(yInitial,HP,250);

[r,c]=size(YHP);

YHPim = zeros(r,c,3);

YHPim(:,:,1)=YHP, YHPim(:,:,2)=YHP, YHPim(:,:,3)=YHP;

image(YHPim);