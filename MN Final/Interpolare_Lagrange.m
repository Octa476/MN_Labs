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
## @deftypefn {} {@var{retval} =} Interpolare_Lagrange (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Octa476 <Octa476@DESKTOP-1986M2J>
## Created: 2024-05-28

function a = Interpolare_Lagrange(x, y)
  n = length(x);

  % Desenare plot.
  xd = x(1) : 0.1 : x(n);
  m = length(xd);

  yd = zeros(1, m);

  for i = 1 : m
    yd(i) = 0;
   for j = 1 : n

     pol = y(j);
     for k = 1 : n
       if k != j
          pol = pol * (xd(i) - x(k)) / (x(j) - x(k));
        endif
     endfor

     yd(i) = yd(i) + pol;
   endfor

  endfor
  plot(xd, yd, "b", x, y, "r*");
endfunction
