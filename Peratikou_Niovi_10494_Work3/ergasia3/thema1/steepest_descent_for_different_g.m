% Niovi Peratikou
%
%Plot the # of iterations for fixed
%epsilon= 0.001 and different gamma
%
clc;
clear;
close all;

x = 10;
y = -10;
e = 0.001;

syms xx yy
f(xx,yy) = (1/3)*(xx^2) + 3*(yy^2);
gradf = gradient(f, [xx, yy]) ;

size = 50;
n = zeros(size,1);
g = zeros(size,1);
i = 0;
for gamma = linspace(0.001,4,size)

    i = i + 1;
    [n(i),g(i)] = steepest_descent(e,gamma,x,y,gradf,f);
end

plot(g,n,'*r','LineWidth',1.4)
title('$f$','Interpreter', 'latex')
xlabel('\gamma') 
ylabel('numbers of iterations')