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
## @deftypefn {} {@var{retval} =} gpt (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2022-03-25

function A = gpt (A)
  [n, n] = size (A);
  
  for p = 1:n-1
    pivot = -inf;
    indice_i = -1;
    indice_j = -1;
    
    #Cautam in submatrice maximul
    for i = p:n
      for j = p:n
        if abs(A(i, j)) > pivot
          indice_i = i;
          indice_j = j;
          pivot = abs(A(i, j));
        endif
      endfor
    endfor
    pivot
    # Permutam mai intai liniile
    aux = A(p, :);
    A(p, :) = A(indice_i, :);
    A(indice_i, :) = aux;
    
    #Permutam apoi coloanele
    aux = A(:, p);
    A(:, p) = A(:, indice_j);
    A(:, indice_j) = aux;
    
    #Aplicam Gauss
    for i = p+1:n
      miu = A(i, p) / A(p, p);
      A(i, :) = A(i, :) - miu * A(p, :);
    endfor
    
  endfor

endfunction
