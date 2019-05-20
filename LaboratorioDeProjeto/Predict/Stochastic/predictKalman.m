%TODO: verificar tamanho das matrizes
%      Há parâmetros que têm de ser passados num vetor
 
function [x, p] = predictKalman(struct)
    f = struct.f;
    x = struct.x;
    b = struct.b;
    u = struct.u;
    q = struct.q;
    p = struct.p;
    ft = f';
    
    %if (size(f, 2) ~= size(x, 1) || size(f, 2) ~= size(p, 1) || size(b, 2) ~= size(u, 1) || size(p, 2) ~= size(ft, 1)):
    %end
    
    
    %predicted state estimate
    x = f * x + b * u;
    
    %predicted error covariace
    p = f * p * ft + q;
