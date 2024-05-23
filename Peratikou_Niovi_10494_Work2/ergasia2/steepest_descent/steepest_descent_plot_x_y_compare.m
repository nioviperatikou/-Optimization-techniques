% Niovi Peratikou

close all;
clear;
clc;

syms xx yy
f(xx,yy) = (1/3)*xx^2 + 3*yy^2;
grad = gradient(f, [xx, yy]) ;

startingPoints  = [[0 ; 0],[-1 ; -1],[1 ; 1]];
epsilon = 0.001;                     
gamma = 0.5;                        
startingPoint = startingPoints(:,3);

figure;
for j = 1:3
    subplot(3,1,j)
    sgtitle('(x,y) convergence for f');
    if j == 1
        [x,k] = steepest_constant(epsilon,startingPoint,gamma,grad);
        type = 'const \gamma';
    elseif j == 2
        [x,k] = steepest_descent_min(epsilon,startingPoint,f,grad);
        type = 'minimize \gamma';
    else
        [x,k] = steepest_armijo(epsilon,startingPoint,f,grad);
        type = 'Armijo \gamma';
    end
    for i=0:1:k-1
        plot(i,x(1,i+1),'*r')
        hold on
        plot(i,x(2,i+1),'ob')
    end
    xlim([0 15])
    xlabel(['numbers of iterations for ',type]) 
    ylabel('[x_k,y_k]')
    legend('x_k','y_k') 
    hold off;
end

