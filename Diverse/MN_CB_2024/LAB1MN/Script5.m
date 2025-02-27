A = magic(4)
suma_linii(A)

[n m] = size(A);
for i = 1:n
  v = A(i, :);
  s1(i) = sum(v);
endfor
s1'
