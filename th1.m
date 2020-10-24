%%b1: sinh tin hieu dau vao
F=1000;     % tan so tin hieu lien tuc
Fs=16000;   % tan so lay mau
tspan = 2;   % do dai tin hieu (s)
N=tspan*Fs; % so mau cua tin hieu vao
n=0:N-1; % cac thoi diem lay mau cua tin hieu goc

s=5*sin(2*pi*F/Fs*n);   % lay mau tin hieu goc
noise=randn(1,N);   % noise la vector N chieu co gia tri moi phan tu ngau nhieu
x=s+noise;  % tao tin hieu vao cua he 

%% b2: tinh cac tin hieu dau ra
M1=3; 
h1=ones(1,M1)/M1;   % vecto cac he so cua x trong ham sai phan
M2=5; 
h2=ones(1,M2)/M2;   
M3=7; 
h3=ones(1,M3)/M3; 
M4=9; 
h4=ones(1,M4)/M4; 

y1=filter(h1,1,x);  % tinh tin hieu dau ra ung voi he y thu i 
y2=filter(h2,1,x);
y3=filter(h3,1,x);
y4=filter(h4,1,x);
% dich trai tin hieu dau ra
D1=(M1-1)/2;         % so mau can dich trai doi voi M thu i
D2=(M2-1)/2;
D3=(M3-1)/2;
D4=(M4-1)/2;

y1=[y1(D1+1:length(y1)), zeros(1,D1)];
y2=[y2(D2+1:length(y2)), zeros(1,D2)];
y3=[y3(D3+1:length(y3)), zeros(1,D3)];
y4=[y4(D4+1:length(y4)), zeros(1,D4)];

%% b3: tinh cac gia tri rmse cho moi tin hieu ra
r1=rmse(y1,s);
r2=rmse(y2,s);
r3=rmse(y3,s);
r4=rmse(y4,s);


%% b4: bieu dien ket qua

% bieu dien tin hieu vao
subplot(5,1,1)
hold on
plot(n,s)   %ve tin hieu goc
plot(n,x)   %ve tin hieu vao
plot(n,noise)   %ve tin hieu da loc
legend("s[n]","x[n]","noise[n]")   %chu thich do thi
title("Cau truc cua tin hieu dau vao:") % bieu dien tin hieu dau vao

% bieu dien tin hieu dau ra cua he y1 va tin hieu goc
subplot(5,1,2)
hold on
plot(n,s)   %ve tin hieu goc
plot(n,y1)   %ve tin hieu da loc
legend('s[n]','y1[n]')   %chu thich do thi
title('RMSE(y1,s)='+string(r1)) %bieu dien gia tri rmse len tren do thi

% bieu dien tin hieu dau ra cua he y2 va tin hieu goc
subplot(5,1,3)
hold on        %ve chong len nhau
plot(n,s)   %ve tin hieu goc
plot(n,y2)   %ve tin hieu da loc
legend('s[n]','y2[n]')   %chu thich do thi
title('RMSE(y2,s)='+string(r2)) %bieu dien gia tri rmse len tren do thi

% bieu dien tin hieu dau ra cua he y3 va tin hieu goc
subplot(5,1,4)
hold on
plot(n,s)   %ve tin hieu goc
plot(n,y3)   %ve tin hieu da loc
legend('s[n]','y3[n]')   %chu thich do thi
title('RMSE(y3,s)='+string(r3)) %bieu dien gia tri rmse len tren do thi

% bieu dien tin hieu dau ra cua he y4 va tin hieu goc
subplot(5,1,5)
hold on
plot(n,s)   %ve tin hieu goc
plot(n,y4)   %ve tin hieu da loc
legend('s[n]','y4[n]')   %chu thich do thi
title('RMSE(y4,s)='+string(r4)) %bieu dien gia tri rmse len tren do thi

%% Ket luan
% voi M = M1 = 3 thi rmse la nho nhat