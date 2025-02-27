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
## @deftypefn {} {@var{retval} =} SOR (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Octa476 <Octa476@DESKTOP-1986M2J>
## Created: 2024-04-23

function x = SOR(A, b, x0, w, tol, max_iter)
  [n n] = size(A);
  x = zeros(n, 1);
  iter = 0;

  while iter < max_iter
    for i = 1 : n
      x(i) = (b(i) - A(i, 1 : i - 1) * x(1 : i - 1) - A(i, i + 1 : n) * x0(i + 1 : n)) / A(i, i);
      x(i) = w * x(i) + (1 - w) * x0(i);
    endfor

    if norm(x - x0, 2) < tol
      break;
    endif

    x0 = x;
    iter++;
  endwhile
  iter
endfunction
