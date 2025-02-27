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
## @deftypefn {} {@var{retval} =} Solve1 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Octa476 <Octa476@DESKTOP-1986M2J>
## Created: 2024-05-31

function A = Solve1(f1, f2, f3, a, b, h, u10, u20, u30)
  t = a : h : b;
  n = length(t);
  u1 = zeros(1, n);
  u2 = zeros(1, n);
  u3 = zeros(1, n);
  u1(1) = u10;
  u2(1) = u20;
  u3(1) = u30;
  for i = 1 : n - 1
    k11 = h * f1(t(i), u1(i), u2(i), u3(i));
    k12 = h * f2(t(i), u1(i), u2(i), u3(i));
    k13 = h * f3(t(i), u1(i), u2(i), u3(i));
    k21 = h * f1(t(i) + h, u1(i) + k11, u2(i) + k12, u3(i) + k13);
    k22 = h * f2(t(i) + h, u1(i) + k11, u2(i) + k12, u3(i) + k13);
    k23 = h * f3(t(i) + h, u1(i) + k11, u2(i) + k12, u3(i) + k13);
    u1(i + 1) = u1(i) + (k11 + k21) / 2;
    u2(i + 1) = u2(i) + (k12 + k22) / 2;
    u3(i + 1) = u3(i) + (k13 + k23) / 2;
  endfor
  u1 = u1';
  t = t';
  A = [t, u1];
  plot(t, u1);
endfunction
