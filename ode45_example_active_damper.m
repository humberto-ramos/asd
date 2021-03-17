%Author: Humberto Ramos, PhD
%This script is a simple example that shows how to integrate differential equations using ode45.
%The differential equations correspond to a mass-spring-damper (m-k-c) system with an external force Fc %applied to it.
%The differential equations are solved from time t=0 to t =10 seconds.
%The initial conditions are set to x1= 0.3 m (for position) and x2= 0 m/s (for the velocity).


clc 
clear all
close all
%Spring constant
k = 1000; %N/m
%Damper constant
c = 40; % N/(m/s)
%Control force
Fc = 100; %N
%Mass
m = 10; %Kg
%ODE definition
x = zeros(2,1);

xdot = @(t,x) [x(2);
              (Fc - c*x(2) -k*x(1))/m]; %Differential equations
          
          
x_initial = [0.3;0];   %Initial conditions       
t_interval = [0 10];   %Simulation time 
[t,y] = ode45(xdot,t_interval,x_initial); %ODE solver. Solution is stored in y. t is the vector %contatining the time history.

%Plotting instructions
plot(t,y)%Plot
legend('x1-position', 'x2-velocity')
grid on
xlabel('t')
ylabel('y')
title('Solutions')
