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
## @deftypefn {} {@var{retval} =} Curbe_Bezier (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Octa476 <Octa476@DESKTOP-1986M2J>
## Created: 2024-05-28

function retval = Curbe_Bezier(x, y)
  n = length(x);
  % Impartim intervalul [0 1] in 100 de puncte.
  t = linspace(0, 1, 100);
  m = length(t);
  xd = zeros(1, m);
  yd = zeros(1, m);
  figure;
  for k = 1 : m
    Px = zeros(n, n);
    Py = zeros(n, n);
    for i = 1 : n
      Px(i, 1) = x(i);
      Py(i, 1) = y(i);
    endfor
    for j = 2 : n
      for i = 1 : n - j + 1
         Px(i, j) = (1 - t(k)) * Px(i, j - 1) + t(k) * Px(i + 1, j - 1);
         Py(i, j) = (1 - t(k)) * Py(i, j -1) + t(k) * Py(i + 1, j - 1);
      endfor
    endfor
    xd(k) = Px(1, n);
    yd(k) = Py(1, n);
    if k == 50
      for j = 1 : n
        plot(Px(1 : n - j + 1, j), Py(1 : n - j + 1, j), "g", Px(1 : n - j + 1, j), Py(1 : n - j + 1, j), "*p");
        hold on;
      endfor
    endif
  endfor
  plot(xd, yd, "b", x, y, "*r");
  axis("equal");
endfunction
