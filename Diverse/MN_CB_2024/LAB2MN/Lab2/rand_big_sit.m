big_random = zeros(1000);

for i = 1:1000
  for j = 1:i
    big_random(i, j) = rand;
  endfor
endfor

b = rand(1000, 1);
