%TODO: calcular v e I
%      verificar tamadnho das matrizes
%      H� par�metros que t�m de ser passados num vetor
 
function [x, p, y] = updateKalman(struct)
    x = struct.x;
    p = struct.p;
    h = struct.h;
    r = struct.r;
    u = struct.u;
    q = struct.q;
    
    xkmin1 = struct.kmin1;
    
    w = mvnrnd(0, q);
    v = mvnrnd(0, r);
        
    xk = f * xkmin1 + B * u + w;
    
    z = h * xk + v;
    
    
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
    
