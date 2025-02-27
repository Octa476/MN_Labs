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
## @deftypefn {} {@var{retval} =} MetodaSimpson (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Octa476 <Octa476@DESKTOP-1986M2J>
## Created: 2024-05-27

function retval = MetodaSimpson(f, a, b, n)
  dx = (b - a) / n;
  x = linspace(a, b, n + 1);
  retval = f(a) + f(b);
  for k = 1 : n / 2
    retval = retval + 4 * f(x(2 * k - 1)) ;
  endfor
  for k = 1 : n / 2 - 1
    retval = retval + 2 * f(x(2 * k)) ;
  endfor
  retval = retval * dx / 3;
endfunction
