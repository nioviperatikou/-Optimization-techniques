% Niovi Peratikou
%
%The plot of f and the contours of f
%

syms xx yy
f(xx,yy) = (1/3)*(xx^2) + 3*(yy^2);
gradf = gradient(f, [xx, yy]) ;

size = 100;

x = linspace(-10, 5, size); 
y = linspace(-8, 12, size);   
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

xlow = -10; xhigh = 5;  % restriction of x , xlow <= x <= xhigh
ylow = -8;  yhigh = 12; % restriction of y , ylow <= y <= yhigh

figure;
%Contours of f, with the restrictions
contour(x, y, fvalues', 15)
hold on;

%Ploting the rectangle which is definite by the restictions
X = [xlow xlow xhigh xhigh xlow];
Y = [ylow yhigh yhigh ylow ylow];
Z = [f(xlow,ylow) f(xlow,yhigh) f(xhigh,yhigh) f(xhigh,ylow) f(xlow,ylow)];
plot3(X, Y, Z);
    
xlim([-15, 10])
ylim([-13, 17])
xlabel('x') 
ylabel('y') 
legend('f contours','the restrictions rectangle')
grid on