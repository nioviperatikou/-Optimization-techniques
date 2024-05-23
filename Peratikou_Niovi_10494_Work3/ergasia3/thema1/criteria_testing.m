% Niovi Peratikou

function [criteria_flag] = criteria_testing(g,d,k,point_x,point_y,gradf,f)

    point_x(k+1) = point_x(k) + g * d(1,1);
    point_y(k+1) = point_y(k) + g * d(2,1);

    criteria_flag = false;

    dT = transpose(d);

    z_1 = dT * gradf(point_x(k+1),point_y(k+1));
    z_2 = dT * gradf(point_x(k),point_y(k));

    %Search beta, so criterion 3, is OK
    for beta = linspace(0.1,1,30)
       % where beta must take value from 0 to 1 from the definition of the criteria
        if  z_1> beta * z_2
          %disp('The 3rd criterion is  OK')
          w_1 = f(point_x(k+1),point_y(k+1));
          w_2 = f(point_x(k),point_y(k));
          w_3 = g * dT * gradf(point_x(k+1),point_y(k+1));

    %If beta was found, search alpha, so criterion 4 is OK
    for alpha = linspace(0.00001,beta,30)
          if w_1 <= w_2 + alpha * w_3
            criteria_flag = true;
             %disp('The 4th criterion is OK');
           break;
          end
   end
          break;
       end
   end
end