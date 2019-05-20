%TODO: calcular v e I
%      verificar tamadnho das matrizes
%      Há parâmetros que têm de ser passados num vetor
 
function [x, p, y] = updateKalman(values)
    x = values.x;
    p = values.p;
    h = values.h;
    r = values.r;
    u = values.u;
    q = values.q;
    z = values.z
	
    
    w = mvnrnd(0, q);
    v = mvnrnd(0, r);
     
   
    
    %Innovation or measurement pre-fit residual
    y = z - h * x;
    
    %Innovation (or pre-fit residual) covariance
    s = r + h * p * h';
    
    %Optimal Kalman gain
    k = p * h' / s;
    
    %Updated (a posteriori) state estimate
    x = x + k * y;
    
    %Declaring identity matrix
    [m,n] = size(k * h);
    I = eye(m, n);
    
    %Updated (a posteriori) estimate covariance
    p = (I - k * h) * p;
    
    %Measurement post-fit residual
    y = z - h * x;
    
    display(x);
    display(p);
    display(y);
    
