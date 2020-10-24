%%b1: khoi tao gia tri
N=100; % so mau cua tin hieu vao
n=0:N-1; % cac thoi diem lay mau cua tin hieu goc

amp=10; % bien do cua tin hieu goc
omega=2*pi/10; % omega cua tin hieu goc

s=amp*sin(omega*n); % lay mau tin hieu goc
noise=randn(1,N);   % noise la vector N chieu co gia tri moi phan tu ngau nhieu
x=s+noise;  % tao tin hieu vao cua he 

%% b2: tinh cac phan hoi cua bo loc
%M=[3 5 7 9];
M1=3; 
h1=ones(1,M1)/M1; % 
M2=5; 
h2=ones(1,M2)/M2; 
M3=7; 
h3=ones(1,M3)/M3; 
M4=9; 
h4=ones(1,M4)/M4; 

%% b3: tinh cac tin hieu qua bo loc
y1=filter(h1,1,x);    % su dung FIR filter
y2=filter(h2,1,x);
y3=filter(h3,1,x);
y4=filter(h4,1,x);

%% b4: tinh cac gia tri rmse cho moi tin hieu ra
r1=rmse(y1,s);
r2=rmse(y2,s);
r3=rmse(y3,s);
r4=rmse(y4,s);


%% b5: bieu dien ket qua

%ve 1 do thi moi
subplot(4,1,1)
%hold        %ve chong len nhau
plot(n,s)   %ve tin hieu goc
hold on    %khong ve chong do thi len nhau
plot(n,x)   %ve tin hieu vao
hold on    %khong ve chong do thi len nhau
plot(n,y1)   %ve tin hieu da loc
legend('s[n]','x[n]','y1[n]')   %chu thich do thi
title('RMSE(y1,s)='+string(r1)) %bieu dien gia tri rmse len tren do thi

%ve 1 do thi moi
subplot(4,1,2)
%hold        %ve chong len nhau
plot(n,s)   %ve tin hieu goc
hold on    %khong ve chong do thi len nhau
plot(n,x)   %ve tin hieu vao
hold on    %khong ve chong do thi len nhau
plot(n,y2)   %ve tin hieu da loc
legend('s[n]','x[n]','y2[n]')   %chu thich do thi
title('RMSE(y2,s)='+string(r2)) %bieu dien gia tri rmse len tren do thi

%ve 1 do thi moi
subplot(4,1,3)
%hold        %ve chong len nhau
plot(n,s)   %ve tin hieu goc
hold on    %khong ve chong do thi len nhau
plot(n,x)   %ve tin hieu vao
hold on    %khong ve chong do thi len nhau
plot(n,y3)   %ve tin hieu da loc
legend('s[n]','x[n]','y3[n]')   %chu thich do thi
title('RMSE(y3,s)='+string(r3)) %bieu dien gia tri rmse len tren do thi

%ve 1 do thi moi
subplot(4,1,4)
%hold        %ve chong len nhau
plot(n,s)   %ve tin hieu goc
hold on    %khong ve chong do thi len nhau
plot(n,x)   %ve tin hieu vao
hold on    %khong ve chong do thi len nhau
plot(n,y4)   %ve tin hieu da loc
legend('s[n]','x[n]','y4[n]')   %chu thich do thi
title('RMSE(y4,s)='+string(r4)) %bieu dien gia tri rmse len tren do thi







% tip: use hold off between graphs (if needed) but on between each plot in a graph