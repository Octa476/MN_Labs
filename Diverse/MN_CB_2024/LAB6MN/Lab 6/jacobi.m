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
## @deftypefn {} {@var{retval} =} jacobi (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2022-04-02

function x = jacobi (A, b, x0, tol, max_iter)
  [n n] = size(A);
  x = zeros(n, 1);
  
  while max_iter > 0
    max_iter--;
    
    for i = 1:n
      x(i) = (b(i) - A(i, 1:i-1) * x0(1:i-1) - A(i, i+1:n) * x0(i+1:n)) / A(i, i);
    endfor
    
    if norm(x - x0) < tol
      break;
    endif
    
    x0 = x;
    x
  endwhile

endfunction
