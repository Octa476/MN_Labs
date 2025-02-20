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
## @deftypefn {} {@var{retval} =} Givens (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Octa476 <Octa476@DESKTOP-1986M2J>
## Created: 2024-04-24

function [Q R] = Givens(A)
  [m n] = size(A);
  G = eye(m);
  for k = 1 : min(m - 1, n)
    for l = k + 1 : m
      ro = sqrt(A(k, k) ^ 2 + A(l, k) ^ 2);
      c = A(k, k) / ro;
      s = -A(l, k) / ro;
      Gkl = eye(m);
      Gkl(k, k) = c;
      Gkl(l, k) = s;
      Gkl(k, l) = -s;
      Gkl(l, l) = c;
      A = Gkl * A;
      G = Gkl * G;
    endfor
    R = A;
    Q = G';
  endfor
endfunction
