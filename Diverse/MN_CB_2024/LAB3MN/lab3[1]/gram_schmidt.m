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
## @deftypefn {} {@var{retval} =} gram_scmidt (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2022-03-19

function [Q, R] = gram_schmidt (A)
  [m n] = size(A);
  Q = zeros(m, n);
  R = zeros(n);
  
  for j = 1:n
    R(1:j-1, j) = Q(:, 1:j-1)' * A(:, j);
    u = A(:, j) - Q(:, 1:j-1) * R(1:j-1, j);
    R(j, j) = norm(u);
    Q(:, j) = u / R(j, j);
  endfor

endfunction
