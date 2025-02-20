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
## @deftypefn {} {@var{retval} =} gram_modificat (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2022-03-19

function [Q, R] = gram_modificat (A)
 [m, n] = size (A);
 Q = zeros (m, n);
 R = zeros (n, n);
 
 for i = 1:n
  R(i, i) = norm (A(:, i));
  Q(:, i) = A(:, i) / R(i, i);
  
  
  R(i, i+1:n) = Q(:, i)' * A(:, i+1:n);
  A(:, i+1:n) = A(:, i+1:n) - Q(:, i) * R(i, i+1:n);

 endfor

endfunction
