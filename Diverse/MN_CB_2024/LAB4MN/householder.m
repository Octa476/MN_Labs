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
## @deftypefn {} {@var{retval} =} householder (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2022-03-11

function [Q, R] = householder (A)
 [m n] = size(A);
 R = zeros(m, n);
 Q = eye(m);
 
 for p = [1:min(m - 1, n)]
    v = zeros(m, 1);
    v(p+1:m) = A(p+1:m, p);
    sigma = sign(A(p, p)) * norm (A(p:m, p));
    v(p) = A(p, p) + sigma;
    v
    H = eye(m) - 2 * (v * v') / (v' * v)
    A = H * A;
    Q = H * Q;
 endfor
 R = A;
 Q = Q';

endfunction
