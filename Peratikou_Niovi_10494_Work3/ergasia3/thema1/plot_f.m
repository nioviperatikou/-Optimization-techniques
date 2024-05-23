% Niovi Peratikou
%
%The plot of f and the contours of f
%
clear;
close all;
clc;

syms xx yy;
f(xx,yy) = (1/3)*(xx^2) + 3*(yy^2);

size = 100;

x = linspace(-20, 20, size); 
y = linspace(-20, 20, size); 

fvalues = zeros(size,size);
count_x = 0;
for i = linspace(-20,20,size)
    count_x = count_x + 1;
    count_y = 1;
    for j = linspace(-20,20,size)
       fvalues(count_x,count_y) = f(i,j);
       count_y = count_y + 1;
    end
end
figure('Name','f plot','NumberTitle','off')
surf(fvalues)

figure('Name','Contours of f','NumberTitle','off')
contour(x, y, fvalues, 15)
grid on;

maxf = max(max(fvalues));
minf = min(min(fvalues));
fprintf('The MAX value of f is = %0.6f\nThe MIN value of f is = %0.6f\n',maxf,minf)