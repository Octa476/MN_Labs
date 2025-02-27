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
## @deftypefn {} {@var{retval} =} Interpolare_polinomiala (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Octa476 <Octa476@DESKTOP-1986M2J>
## Created: 2024-05-26

function a = Interpolare_polinomiala(x, y)
  n = length(x);
  A = zeros(n, n);
  for i = 1 : n
    A(i, 1) = 1;
    for j = 2 : n
      A(i, j) = A(i, j - 1) * x(i);
    endfor
  endfor
  a = A \ y;

  % Desenare plot.
  xd = x(1) : 0.1 : x(n);
  power = 0;
  m = length(xd);
  yd = zeros(1, m);
  for i = 1 : m
    yd(i) = a(1);
    power = 1;
    for j = 2 : n
      yd(i) = yd(i) + a(j) * xd(i) ^ power;
      power = power + 1;
    endfor
  endfor
  plot(xd, yd, "b", x, y, "r*");
endfunction
