A = [ 1 2 0 4; 5 6 7 8; 1 0 1 0; 0 0 1 1];
b = [ 1 2 3 4];
b = b';
[L, U] = Doolittle(A)
y = SIT(L, b)
x = SST(U, y)
