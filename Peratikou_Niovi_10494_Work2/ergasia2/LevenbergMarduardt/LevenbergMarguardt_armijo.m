% Niovi Perartikou

function [ x, k ] = LevenbergMarguardt_armijo(  epsilon, startPoint, f, gradf, hessian)

    k = 1;
    x(: ,k) = startPoint;
    grad(:,k) = gradf(x(1,k),x(2,k));
    STEP_MAX = 1000;
    
    while norm(grad(:,k)) >= epsilon
        h=hessian(x(1,k),x(2,k));
        m(k)=max(abs(eig(h)))*1.06;
        par=h+(m(k)*eye(2,2));
        d(:,k)=par\(-grad(:,k));
        gamma = armijo_gamma(x,k,f,gradf);
        x(:,k+1) = x(:,k)+gamma* d(:,k);
        grad(:,k+1) = gradf(x(1,k+1),x(2,k+1));
        k = k + 1;
        if(k > STEP_MAX)
            disp('Max steps limit exceeded... aborting')
            break
        end
      
    end
end
