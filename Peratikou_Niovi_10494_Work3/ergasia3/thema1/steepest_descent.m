% Niovi Peratikou

function [k,g,point_x,point_y] = steepest_descent(e,g,x,y,gradf,f)
  %steepest_descent
    %e: is the -final- accuracy of the norm(gradf)
    %g: is the constant step of the method
    %x: x-coordinate of the initial point
    %y: y-coordinate of the initial point
    %gradf: the gradient of the function
    %f: the function that is being optimized
    %
    %return:
    %k: # of iterations, the max of iterations is 8000 steps
    %g: is the constant step of the method
    %(for testing which g is better in steepest_descent_plot_for_different_g)
    %point_x: a vector of the values from the x-coordinate
    %point_y: a vector of the values from the y-coordinate
    %
    %As long as the norm of gradf is greater than epsilon
    %the (x(k),y(k)) it isn't my minumum point, so i move
    %to the direction of d, for a constant step g.
    %To prevent the function to run repeatedly, i  define the maxStep.
    %Also i check if criteria 3 and 4 is fulfilled so i can find the 
    % global minimum
    %
    k = 1;
    STEP_MAX = 1000;
    point_x = [];
    point_y = [];
    point_x(k) = x; 
    point_y(k) = y;
    while (norm(gradf(point_x(k), point_y(k))) >= e )
        d = - gradf(point_x(k), point_y(k));
        if criteria_testing(g,d,k,point_x,point_y,gradf,f)
           point_x(k+1) = point_x(k) + g * d(1,1);
           point_y(k+1) = point_y(k) + g * d(2,1);
        else
           fprintf('Error! At %d iteration, the recuirements of the criteria was not fulfilled',k)
           k = 0; % To see the difference in the plot of different gamma
           break;
       end
       if(k >  STEP_MAX)
          disp('Max steps limit exceeded... aborting')
          break
        end
        k = k + 1;
    end
end