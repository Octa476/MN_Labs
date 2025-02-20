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
## @deftypefn {} {@var{retval} =} Interpolare_liniara (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Octa476 <Octa476@DESKTOP-1986M2J>
## Created: 2024-05-26

function AB = Interpolare_liniara(x, f)
  n = length(x);
  AB =  zeros(n - 1, 2);
  for i = 1 : n - 1
    AB(i, 1) = (f(i + 1) - f(i)) / (x(i + 1) - x(i));
    AB(i, 2) = (x(i + 1) * f(i) - x(i) * f(i + 1)) / (x(i + 1) - x(i));
  endfor

  % Desenare plot.
  xd = x(1) : 0.1 : x(n);
  m = length(xd);
  yd = zeros(1, m);
  j = 1;
  for i = 1 : m
    if xd(i) > x(j + 1)
      j = j + 1;
    endif
    yd(i) = AB(j, 1) * xd(i) + AB(j, 2);
  endfor
  plot(xd, yd, "b", x, f, "r*");
endfunction
