function  vS = vech(S)
% returns an N * (N+1)/2 vector containing the unique elements of a
% symmetric matrix  S
N = size(S, 1);
vS = zeros(N * (N+1)/2,1);
j = 1;
for i=1:N
    vS(j:j + N-i) = S(i:N, i);
    j = j + N - i + 1;
end    
end

