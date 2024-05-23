% Niovi Peratikou

function [x_end,k] = LevenbergMarguardt_min(epsilon,startPoint,f,gradf,hessianf)
    
    k = 1; 
    
    STEP_MAX = 2000;
    
    point_x = startPoint(1,1); 
    
    point_y = startPoint(2,1);
    
    lamda = 10 * epsilon /4 ; 
    
    alpha = 0; 
    
    beta = 4;
    
    while ( norm(gradf(point_x(k),point_y(k))) > epsilon)
       
        hessianff = hessianf(point_x(k),point_y(k));
        
        eigen = eig(hessianff);    % eigenvalues 
        
        m = abs(max(eigen));     % maximum eigenvalue of eigenvalues
        
        % If p = 0 then the input matrix is symmetric positive definite and the factorization was successful.
        
        [~,p] = chol(hessianff + m * eye(length(hessianff)));
        
        while p>0  
            
            m = m + 0.1;
            
            [~,p] = chol(hessianff + m * eye(length(hessianff)));
            
        end
        
        d = - inv(hessianff + m * eye(length(hessianff))) * gradf(point_x(k),point_y(k));
        
        h = @(g)f(point_x(k) + g*d(1,1),point_y(k) + g*d(2,1));
        
        g = golden_section(h,lamda,alpha,beta);
     
        if criteria_testing(g,d,k,point_x,point_y,gradf,f) 
            
            point_x(k+1) = point_x(k) + g * d(1,1);
            
            point_y(k+1) = point_y(k) + g * d(2,1);
        else
            
            disp('Error...\nThe Criteria 3 and 4 are not met')
            break;
        end
        
        k = k + 1;
    
        if(k > STEP_MAX)
            disp('Max steps limit exceeded... aborting')
            break
        end
        
    end
    
    x_end = [point_x ; point_y];

end
