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
## @deftypefn {} {@var{retval} =} Thomas (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Octa476 <Octa476@DESKTOP-1986M2J>
## Created: 2024-04-23

function x = Thomas(a, b, c, d)
  % Vectorii a si c au lungimea n - 1 la input.
  % Le adaugam cate un zero pentru a-i putea utiliza in algoritm.
  a = [0 a];
  c = [c 0];
  n = length(b);
  x = zeros(n, 1);
  c(1) = c(1) / b(1);
  d(1) = d(1) / b(1);

  for i = 2 : n
    c(i) = c(i) / (b(i) - a(i) * c(i - 1));
    d(i) = (d(i) - a(i) * d(i - 1)) / (b(i) - a(i) * c(i - 1));
  endfor

  x(n) = d(n);
  for i = n - 1 : -1 : 1
    x(i) = d(i) - c(i) * x(i + 1);
  endfor
endfunction
