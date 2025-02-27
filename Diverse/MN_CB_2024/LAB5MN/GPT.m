## Copyright (C) 2024 Octa476
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
## @deftypefn {} {@var{retval} =} eliminaregauss (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Octa476 <Octa476@DESKTOP-1986M2J>
## Created: 2024-04-03

function [A1, b1] = GPT (A, b)
  [n, n] = size(A);


  for j = 1:n
    max = 0;
    pozi = 0;
    pozj = 0;
    for k = j:n
      for i = j:n
        if max < abs(A(i, k))
          max = abs(A(i, k))
          pozi = i;
          pozj = k;
        endif
      endfor
    endfor

    aux = A(pozi, :);
    A(pozi, :) = A(j, :);
    A(j, :) = aux;

    aux = b(pozi);
    b(pozi) = b(j);
    b(j) = aux;

    aux = A(:, pozj);
    A(:, pozj) = A(:, j);
    A(:, j) = aux;

    for i = j + 1:n
      coef = A(i, j) / A(j, j);
      A(i, :) = A(i, :) - coef * A(j, :);
      b(i) = b(i) - coef * b(j);
    endfor
  endfor
  A1 = A;
  b1 = b;
endfunction
