% Niovi Peratikou

clear
close all;
clc;

syms xx yy
f(xx,yy) = (1/3)*(xx^2) + 3*(yy^2);
gradf = gradient(f, [xx, yy]) ;

size = 100;
xl = linspace(-20, 10, size); 
yl = linspace(-12, 15, size);   
fvalues = zeros(size,size);
count_x = 0;
for i = linspace(-20,10,size)
    count_x = count_x + 1;
    count_y = 1;
    for j = linspace(-12,15,size)
       fvalues(count_x,count_y) = f(i,j);
       count_y = count_y + 1;
    end
end
%
%Plot the pair (x,y) to show the convergence, 
%at the same plot with the contours of f
%
epsilon = 0.01;
gk = [0.5 , 0.1 , 0.2];
sk = [5 15 0.1];
point_x  = [5 -5 8];
point_y =  [-5 10 -10];

% Check only one solution
% gk = 0.1; 
% sk = 3;
% point_x = -5; point_y = 10;

xlow = -10; xhigh = 5;  % restriction of x , xlow <= x <= xhigh
ylow = -8;  yhigh = 12; % restriction of y , ylow <= y <= yhigh

for i = 1:length(gk)
    figure;
    %Convergence of the pair (x,y)
    [iteration,x,y] = steepest_descent_with_projection(epsilon,gk(i),sk(i),point_x(i),point_y(i),gradf);
    plot(x,y,'-or')
    hold on

    %Contours of f, with the restrictions
    contour(xl, yl, fvalues', 15)
    
    %Ploting the rectangle which is definite by the restictions
    X = [xlow xlow xhigh xhigh xlow];
    Y = [ylow yhigh yhigh ylow ylow];
    Z = [f(xlow,ylow) f(xlow,yhigh) f(xhigh,yhigh) f(xhigh,ylow) f(xlow,ylow)];
    plot3(X, Y, Z);
    
    title(['[x,y] for gk = ' num2str(gk(i)) ' and sk = ' num2str(sk(i)) ' in ' num2str(iteration) ' iterations']);
    xlim([-15, 10])
    ylim([-13, 17])
    xlabel('x') 
    ylabel('y') 
    legend('[x_k,y_k] convegrence','f contours','the restrictions rectangle')
    grid on
end