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
## @deftypefn {} {@var{retval} =} hs (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2022-03-15

function [Q, R] = hs (A)
  [m n] = size(A);
  H = eye(m);
  R = zeros(m , n);
  
  for p = 1:min(m-1, n)
    vp = zeros(m, 1);
    vp(p+1:m) = A(p+1:m, p);
    sigma = sign(A(p, p)) * norm(A(p:m, p));
    vp(p) = A(p, p) + sigma;
    Hp = eye(m) - 2 * vp * vp' / (vp' * vp);
    H = Hp * H;
    A = Hp * A;
  endfor
  
  Q = H';
  R = A;
  
endfunction
