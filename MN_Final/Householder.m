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
## @deftypefn {} {@var{retval} =} Householder (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Octa476 <Octa476@DESKTOP-1986M2J>
## Created: 2024-04-24

function [Q R] = Householder(A)
  [m n] = size(A);
  H = eye(m);
  for p = 1 : min(m - 1, n)
    vp = zeros(m, 1);
    vp(p + 1 : m) = A(p + 1 : m, p);
    sigmap = sign(A(p, p)) * sqrt(A(p : m, p)' * A(p : m, p));
    vp(p) = A(p, p) + sigmap;
    Hp = eye(m) - 2 * (vp * vp') / (vp' * vp);
    A = Hp * A;
    H = Hp * H;
  endfor
  R = A;
  Q = H';
endfunction
