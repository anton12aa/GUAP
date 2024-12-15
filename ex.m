% Задача 2: Исследование эффекта Гиббса
close all
clear all
clc
% Задайте количество N членов ряда

% Задайте период T в сек, амплитуду U в В
T=2;
U=1;
dU = 0.01;
% Задайте число периодов сигнала
Period=4;
% Задайте количество точек в периоде
N_Period=5000;
%Задание диапазона исследования
N = [1 2 3 5 10 20 30 40 50 100];

for h = 1:length(N)
    dt=T/N_Period;
    t=(0:Period*N_Period-1).*dt;
    
    % Расчет и построение графика
    s = zeros(1,length(1:Period*N_Period));
    for i=1:Period*N_Period
        for j=1:N(h)
            s(i)=s(i)+2*(U/(j*pi))*sin(j*2*pi*t(i)/T)*(1-cos(j*pi));
        end
    end
    M_s(h) = (max(s)-U)/U*100;
    [y] = find(abs(s-U)<(dU*U));
    max_len(h) = t(y(2))-t(y(1));
    figure
    hold on
    plot(t,s)
    plot(t(y),s(y),'Color','Green')
    yline((1+dU)*U,'Color','cyan')
    yline((1-dU)*U,'Color','cyan')
    title('N = ' + string(N(h)) + '; \DeltaU/U = ' + string(M_s(h)))
end
figure
plot(N,M_s)
title("Зависимость относительной величины всплеска от колличества членов ряда")
ylabel('\DeltaU/U, %')
xlabel('Колличество членов ряда')
grid on
grid minor