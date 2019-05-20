%TODO: verificar tamanho das matrizes
%      Há parâmetros que têm de ser passados num vetor
 
function [x, p] = predictKalman(values)
    f = values.f;
    x = values.x;
    b = values.b;
    u = values.u;
    q = values.q;
    p = values.p;
    ft = f';
    
    %if (size(f, 2) ~= size(x, 1) || size(f, 2) ~= size(p, 1) || size(b, 2) ~= size(u, 1) || size(p, 2) ~= size(ft, 1)):
    %end
    
    
    %predicted state estimate
    x = f * x + b * u;
    
    %predicted error covariace
    p = f * p * ft + q;
