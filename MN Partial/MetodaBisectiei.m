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
## @deftypefn {} {@var{retval} =} MetodaBisectiei (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Octa476 <Octa476@DESKTOP-1986M2J>
## Created: 2024-04-20

function x = MetodaBisectiei(f, a, b, tol)
  if f(a) * f(b) > 0
    disp("In intervalul ales ecuatia nu are solutie!");
    return;
  endif
  x = a + (b - a) / 2;
  iter = 1;
  while abs(f(x)) > tol && abs(b - a) > tol
    if f(x) * f(b) < 0
      a = x;
    else
      b = x;
    endif
    x = a + (b - a) / 2;
    iter++;
  endwhile
  iter
endfunction
