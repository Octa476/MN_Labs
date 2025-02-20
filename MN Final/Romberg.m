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
## @deftypefn {} {@var{retval} =} Romberg (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Octa476 <Octa476@DESKTOP-1986M2J>
## Created: 2024-05-28

function retval = Romberg(f, a, b, n)
  R = zeros(n, n);
  for k = 1 : n
    R(k, 1) = MetodaTrapezelor(f, a, b, 2 ^ (k - 1));
  endfor
  for j = 2 : n
    for k = j : n
      R(k, j) = R(k, j - 1) + (R(k, j - 1) - R(k - 1, j - 1)) / (4 ^ (k - 1));
    endfor
  endfor
  retval = R(n, n);
endfunction
