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
## @deftypefn {} {@var{retval} =} EliminareGaussiana (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Octa476 <Octa476@DESKTOP-1986M2J>
## Created: 2024-04-23

% Algoritmul aduce sistemul la forma scara.
function [A b] = EliminareGaussiana(A, b)
  [n n] = size(A);
  for j = 1 : n
    for i = j + 1 : n
      miu = A(i, j) / A(j, j);
      A(i, :) = A(i, :) - miu * A(j, :);
      b(i) = b(i) - miu * b(j);
    endfor
  endfor
endfunction
