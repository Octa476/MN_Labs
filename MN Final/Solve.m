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
## @deftypefn {} {@var{retval} =} Solve (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Octa476 <Octa476@DESKTOP-1986M2J>
## Created: 2024-05-31

function A = Solve(f1, f2, a, b, u10, u20)
  N = 10;
  x = linspace(a, b, N + 1);
  h = x(2) - x(1);
  u1 = zeros(1, N + 1);
  u2 = zeros(1, N + 1);
  u1(1) = u10;
  u2(1) = u20;
  for i = 1 : N
    k1 = h * f1(x(i), u1(i), u2(i));
    k2 = h * f2(x(i), u1(i), u2(i));
    u1(i + 1) = u1(i) + k1;
    u2(i + 1) = u2(i) + k2;
  endfor
  u1 = u1';
  x = x';
  A = [x, u1];
endfunction
