## Copyright (C) 2022 Andrei
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} gpps (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2022-03-25

function A = gpps (A)
  [n, n] = size(A);
  
  for j = 1:n-1
    pivot = -inf;
    linie_pivot = -1;
    
    for i = j:n
      maxim = max(abs (A(i, j:n)));
      coeficient = abs (A(i, j)) / maxim;
      
      if coeficient > pivot
        pivot = coeficient;
        linie_pivot = i;
      endif
    endfor
    
    aux = A(linie_pivot, :);
    A(linie_pivot, :) = A(j, :);
    A(j, :) = aux;
    
    for i = j+1:n
      A(i, :) = A(i, :) - A(i, j) / A(j, j) * A(j, :);
    endfor
  endfor
  
endfunction
