%% Loading path and parameters
clc
clear all
close all
load("/home/bhagwat/Documents/Waypoint controller/reference_path.mat")

% parameters
m = 2257;             %mass of vehicle
L = 3.14;             % m (wheelbase)
WF = 0.423;           % percent weight in front
a = L*(1-WF);         % front axle to cg
b = L*WF;             % rear axle to cg
g = 9.81;             %acceleration due to gravity
rho = 1.225;          %density of air
cd = 0.30;            %drag coefficient
A = 2.06;             %cross-sectional area
c2m = 1/3.6;          %conversion to meter
c2r = 1*(pi/180);     %conversion to radian
% f0 = 0.013;		
K = 6.5*10^-6;	
gamma = 0;            %camber
mu = 1;
%garage values
C1_0 = 1312/c2r;  %1312 N/deg
C2_0 = 984/c2r;
Jz = 2500;
n = 12; %steering ratio

%Calculating average distance between waypoints
dist_array = [];
for z = 2:length(X_waypoints)
    dist_1 = sqrt( (X_waypoints(z)-X_waypoints(z-1))^2 + (Y_waypoints(z)-Y_waypoints(z-1))^2 );
    dist_array = [dist_array, dist_1];
end
avg_dist = mean(dist_array);
%% Plot the path
plot(out.X, out.Y)
hold on
plot(X_waypoints, Y_waypoints)
xlabel("X(m)")
ylabel("Y(m)")
title ('Trajectory','fontsize',12);
legend("Actual path","Reference path")

%The 'out' simulation output in the workspace contains all the data you
%need to look at.
