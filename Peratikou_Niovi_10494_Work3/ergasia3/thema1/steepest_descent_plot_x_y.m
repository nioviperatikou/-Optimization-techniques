%
%Clear workspace and calculate 
%the contours of f
%
clear;
clc;
close all;

syms xx yy
f(xx,yy) = (1/3)*(xx^2) + 3*(yy^2);
gradf = gradient(f, [xx, yy]) ;


size = 100;
xl = linspace(-10, 10, size);
yl = linspace(-10, 10, size);
fvalues =zeros(size,size);
count_x = 0;
for i = linspace(-10,10,size)
    count_x = count_x + 1;
    count_y = 1;
    for j = linspace(-10,10,size)
       fvalues(count_x,count_y) = f(i,j);
       count_y = count_y + 1;
    end
end
%
%Plot the pair (x,y) to show the convergence, 
%at the same plot with the contours of f
%
x = 8;
y = 3;

epsilon = 0.01; %from instructions
gamma = [0.1 , 0.3 , 3 , 5];
% gamma = 0.2886;

for i=1:length(gamma)
    figure;
    [iteration,~,xvalues,yvalues] = steepest_descent(epsilon,gamma(i),x,y,gradf,f);
    plot(xvalues,yvalues,'-or')
    hold on;
    contour(xl, yl, fvalues)
    title(['[x,y] for gamma = const = ' num2str(gamma(i)) ' in ' num2str(iteration) ' iterations']);
    xlabel('x'); 
    ylabel('y'); 
    grid on;
    hold off;
end