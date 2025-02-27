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
## @deftypefn {} {@var{retval} =} Crout3diag (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Octa476 <Octa476@DESKTOP-1986M2J>
## Created: 2024-04-20

function [L U] = Crout3diag(a, c, d)
  % functia va calcula in loop termenii de la 2 la n - 1, ceilalti fiind calculati in afara for-ului
  % pentru simplitate
  n = length(a);
  ld = zeros(1, n);
  ud = zeros(1, n);
  ls = zeros(1, n - 1);
  us = zeros(1, n - 1);

  ld(1) = a(1);
  ls(1) = d(1);
  ud(1) = 1;
  us(1) = c(1) / a(1);
  for p = 2 : n - 1
    ud(p) = 1;
    ld(p) = a(p) - ls(p - 1) * us(p - 1);
    ls(p) = d(p);
    us(p) = c(p) / ld(p);
  endfor
  ud(n) = 1;
  ld(n) = a(n) - ls(n - 1) * us(n - 1);

  L = diag(ls, -1) + diag(ld);
  U = diag(us, 1) + diag(ud);
endfunction
