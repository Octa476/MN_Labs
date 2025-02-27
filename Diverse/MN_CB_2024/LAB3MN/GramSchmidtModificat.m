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
## @deftypefn {} {@var{retval} =} GramSchmidtModificat (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Octa476 <Octa476@DESKTOP-1986M2J>
## Created: 2024-03-23

function [Q R] = GramSchmidtModificat (A)
  [n n] = size(A);
  Q = zeros(n,n);
  R = zeros(n,n);
  for i = 1:n
    R(i, i) = norm(A(:, i), 2);
    Q(:, i) = A(:, i) / R(i, i);
    for j = i + 1:n
      R(i, j) = Q(:, i)' * A(:, j);
      A(:, j) = A(:, j) - R(i, j) * Q(:, i);
    endfor
  endfor
endfunction
