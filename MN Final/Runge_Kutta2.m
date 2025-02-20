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
## @deftypefn {} {@var{retval} =} Runge_Kutta2 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Octa476 <Octa476@DESKTOP-1986M2J>
## Created: 2024-05-30

function Runge_Kutta2(f, y0, a, b)
  N = 100000;
  t = linspace(a, b, N);
  h = t(2) - t(1);
  y = zeros(1, N);
  y(1) = y0;
  for i = 1 : N - 1
   K1 = h * f(t(i), y(i));
   K2 = h * f(t(i) + h, y(i) + K1);
   y(i + 1) = y(i) + (K1 + K2) / 2;
  endfor
  plot(t, y);
  hold on;
endfunction
