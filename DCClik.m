function [mloglik, Qbar, a, b] = DCClik(my_star, vPsi)
% input: mystar, devolatilised series and parameter values n times N
% matrix
% vPsi vector of parameters of dimension 2+ N*(N+1)/2
[n N] = size(my_star); % dimensions n and N
Q = zeros(N,N);
vQ = vPsi(3:3+N*(N+1)/2-1);
LQbar = unvech(vQ, N);
Qbar = LQbar * LQbar'; % Qbar is symmetric and pd 
a = exp(vPsi(1))/(1+exp(vPsi(1)));    % a is between 0 and 1 
b = (1-a) * exp(vPsi(2))/(1+exp(vPsi(2)));% b is between 0 and (1-a) 
mloglik = 0;   % minus log likelihood (initialisation)
for i = 1:n
    if i ==1       % first observation
        Q =  Qbar;      
    else            
        Q = (1 - a - b) * Qbar + a * ( my_star(i-1,:)' * my_star(i-1,:) ) + b * Q ;
    end
    Qnsqrt = diag(1 ./ sqrt(diag(Q)));
    P = Qnsqrt * Q * Qnsqrt;
    mloglik = mloglik + 0.5 * ( log(det(P)) + my_star(i,:) * inv(P) * my_star(i,:)'); 
    %disp(Q); disp(P);
end
end
 

