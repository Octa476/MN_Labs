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
## @deftypefn {} {@var{retval} =} Interpolare_Newton (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Octa476 <Octa476@DESKTOP-1986M2J>
## Created: 2024-05-31

function c = Interpolare_Newton(x, f)
  n = length(x);
  A =  zeros(n, n);
  for i = 1 : n
    A(i, 1) = f(i);
  endfor
  for j = 2 : n
    for i = 1 : n - j + 1
      A(i, j) = (A(i, j - 1) - A(i + 1, j - 1)) / (x(i) - x(i + j - 1));
    endfor
  endfor
  A
  N = 1000;
  xd = linspace(min(x), max(x), N);
  yd = zeros(1, N);
  for k = 1 : N
    yd(k) = 0;
    for i = 1 : n
      pol = A(1, i);
      for j = 1 : i
        pol = pol * (xd(k) - x(j));
      endfor
      yd(k) = yd(k) + pol;
    endfor
  endfor
  plot(xd, yd, "b", x, f, "*r");
endfunction
