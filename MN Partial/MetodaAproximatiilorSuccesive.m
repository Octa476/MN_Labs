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
## @deftypefn {} {@var{retval} =} MetodaAproximatiilorSuccesive (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Octa476 <Octa476@DESKTOP-1986M2J>
## Created: 2024-04-21

% Puteti observa cea mai divergenta metoda creata vreodata.
function x = MetodaAproximatiilorSuccesive(f, x0, tol)
  g = @(x) f(x) + x;
  x = g(x0);
  iter = 1;
  while abs(x - x0) > tol
    x0 = x;
    x = g(x0);
    iter++;
  endwhile
  iter
endfunction
