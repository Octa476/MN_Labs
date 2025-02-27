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
## @deftypefn {} {@var{retval} =} Crout (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Octa476 <Octa476@DESKTOP-1986M2J>
## Created: 2024-04-20

function [L U] = Crout(A)
  [n n] = size(A);
  L = zeros(n, n);
  U = eye(n);
  for p = 1 : n
    for i = p : n
      L(i, p) = A(i, p) - L(i, :) * U(:, p);
    endfor
    for j = p + 1 : n
      U(p, j) = (A(p, j) - L(p, :) * U(:, j)) / L(p, p);
    endfor
  endfor
endfunction
