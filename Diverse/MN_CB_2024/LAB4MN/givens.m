## Copyright (C) 2022 Andrei
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
## @deftypefn {} {@var{retval} =} givens (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2022-03-18

function [Q, R] = givens (A)
  [m, n] = size (A);
  G = eye(m);
  
  for k = 1:min(m-1, n)
    for l = k+1:n
      r = sqrt (A(l, k) ^ 2 + A(k, k) ^ 2);
      c = A(k, k) / r;
      s = -A(l, k) / r;
      Gkl = eye (m);
      Gkl (k, k) = c;
      Gkl (l, k) = s;
      Gkl (k, l) = -s;
      Gkl (l, l) = c;
      Gkl
      G = Gkl * G;
      A = Gkl * A;
    endfor
  endfor
  
  Q = G';
  R = A;

endfunction
