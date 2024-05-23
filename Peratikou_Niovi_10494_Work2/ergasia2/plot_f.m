% Niovi Peratikou

clc;
clear;
close all;

[x,y] = meshgrid(-7:0.2:7);
Z = x.^3 .* exp(-x.^2-y.^4);

figure;
surf(x,y,Z)
title('f plot')
% xlim([-5, 5]); ylim([-5, 5]) %for Test function
xlabel('x') 
ylabel('y') 
colorbar

figure;
contour(x, y, Z)
xlim([-3, 3]); 
ylim([-3, 3])
% xlim([-1.5, 1.5]); ylim([-1.5, 1.5]) %for Test function
xlabel('x') 
ylabel('y') 
colorbar;

maxf = max(max(Z));
minf = min(min(Z));
fprintf('The MAX value of f is = %0.6f\nThe MIN value of f is = %0.6f\n',maxf,minf)