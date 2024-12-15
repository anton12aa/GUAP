% ПРЕОБРАЗОВАНИЕ ФУРЬЕ ВИДЕОИМПУЛЬСА

clear all

% Задать длительность видеоимпульса Tau в сек, и период дискретизации dt в сек
Tau=1;
dt=0.05;
% Задать шаг по частоте dF и верхнюю частоту Fmax для вычисления ПФ
dF=0.05;
Fmax=50;

% Определение и построение графика исходного сигнала

N0=floor(Tau/dt);    % Количество отсчетов в импульсе
t1=(0:(N0-1)).*dt;   % Первый вектор времени
t2=(0:(2*N0-1)).*dt; % Второй вектор времени
t4=(0:(4*N0-1)).*dt; % Третий вектор времени
t8=(0:(8*N0-1)).*dt; % Четвертый вектор времени
s1(1:N0)=1;      % Первый вектор видеосигнала
s2=s1;
s2(N0+1:2*N0)=0;     % Второй вектор видеосигнала
s4=s1;
s4(N0+1:4*N0)=0;     % Третий вектор видеосигнала
s8=s1;
s8(N0+1:8*N0)=0;     % Четвертый вектор видеосигнала
figure
subplot(4,1,1)
plot(t1,s1)
grid on 
grid minor
subplot(4,1,2)
plot(t2,s2)
grid on 
grid minor
subplot(4,1,3)
plot(t4,s4)
grid on 
grid minor
subplot(4,1,4)
plot(t8,s8)
grid on 
grid minor

% Вычисление и построение графиков ПФ для 4-х исходных массивов
NF=floor(Fmax/dF);  % Количество отсчетов по частоте
f=(0:NF-1).*dF;     % Вектор значений частоты

for i=1:NF
D1(i)=0;
for j=1:N0
D1(i)=D1(i)+s1(j)*exp(-1j*2*pi*(i-1)*dF*t1(j));
end
end

for i=1:NF
D2(i)=0;
for j=1:2*N0
D2(i)=D2(i)+s2(j)*exp(-1j*2*pi*(i-1)*dF*t2(j));
end
end

for i=1:NF
D4(i)=0;
for j=1:4*N0
D4(i)=D4(i)+s4(j)*exp(-1j*2*pi*(i-1)*dF*t4(j));
end
end

for i=1:NF
D8(i)=0;
for j=1:8*N0
D8(i)=D8(i)+s8(j)*exp(-1j*2*pi*(i-1)*dF*t8(j));
end
end

figure
subplot(4,1,1)
plot(f,abs(D1))
grid on 
grid minor
subplot(4,1,2)
plot(f,abs(D2))
grid on 
grid minor
subplot(4,1,3)
plot(f,abs(D4))
grid on 
grid minor
subplot(4,1,4)
plot(f,abs(D8))
grid on 
grid minor

figure
subplot(2,1,1)
plot(f,abs(D1))
grid on 
grid minor
subplot(2,1,2)
plot(f,angle(D1))
grid on 
grid minor


% ПРЕОБРАЗОВАНИЕ ФУРЬЕ РАДИОИМПУЛЬСА

clear all

% Задать длительность радиоимпульса Tau в сек, частоту несущей f0 в Гц и период дискретизации dt в сек
Tau=1;
f0=14;
dt=0.05;
% Задать шаг по частоте dF и верхнюю частоту Fmax для вычисления ПФ
dF=0.05;
Fmax=50;

% Определение и построение графика исходного сигнала

N0=floor(Tau/dt);    % Количество отсчетов в импульсе
t1=(0:(N0-1)).*dt;   % Первый вектор времени
t2=(0:(2*N0-1)).*dt; % Второй вектор времени
t4=(0:(4*N0-1)).*dt; % Третий вектор времени
t8=(0:(8*N0-1)).*dt; % Четвертый вектор времени
s1=sin(2*pi*f0.*t1); % Первый вектор радиосигнала
s2=s1;
s2(N0+1:2*N0)=0;     % Второй вектор радиосигнала
s4=s1;
s4(N0+1:4*N0)=0;     % Третий вектор радиосигнала
s8=s1;
s8(N0+1:8*N0)=0;     % Четвертый вектор радиосигнала
figure
subplot(4,1,1)
plot(t1,s1)
grid on 
grid minor
subplot(4,1,2)
plot(t2,s2)
grid on 
grid minor
subplot(4,1,3)
plot(t4,s4)
grid on 
grid minor
subplot(4,1,4)
plot(t8,s8)
grid on 
grid minor

% Вычисление и построение графиков ПФ для 4-х исходных массивов
NF=floor(Fmax/dF);  % Количество отсчетов по частоте
f=(0:NF-1).*dF;     % Вектор значений частоты

for i=1:NF
D1(i)=0;
for j=1:N0
D1(i)=D1(i)+s1(j)*exp(-1j*2*pi*(i-1)*dF*t1(j));
end
end

for i=1:NF
D2(i)=0;
for j=1:2*N0
D2(i)=D2(i)+s2(j)*exp(-1j*2*pi*(i-1)*dF*t2(j));
end
end

for i=1:NF
D4(i)=0;
for j=1:4*N0
D4(i)=D4(i)+s4(j)*exp(-1j*2*pi*(i-1)*dF*t4(j));
end
end

for i=1:NF
D8(i)=0;
for j=1:8*N0
D8(i)=D8(i)+s8(j)*exp(-1j*2*pi*(i-1)*dF*t8(j));
end
end

figure
subplot(4,1,1)
plot(f,abs(D1))
grid on 
grid minor
subplot(4,1,2)
plot(f,abs(D2))
grid on 
grid minor
subplot(4,1,3)
plot(f,abs(D4))
grid on 
grid minor
subplot(4,1,4)
plot(f,abs(D8))
grid on 
grid minor

figure
subplot(2,1,1)
plot(f,abs(D1))
grid on 
grid minor
subplot(2,1,2)
plot(f,angle(D1))
grid on 
grid minor
