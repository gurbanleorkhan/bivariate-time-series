function  Slow = unvech(vS, N)
% returns N times N lower triangular matrix from vech 
Slow = zeros(N,N);
j = 1;
for i=1:N
    Slow(i:N, i) = vS(j:j + N-i);
    j = j + N-i + 1;
end    
end

