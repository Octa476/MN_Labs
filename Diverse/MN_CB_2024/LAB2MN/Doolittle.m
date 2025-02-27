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
## @deftypefn {} {@var{retval} =} doolittle (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2022-03-05

function [L, U] = doolittle (A)
[n, n] = size(A);
L = eye(n);
U = zeros(n);

for p = 1:n
  U(p, p:n) = A(p, p:n) - L(p, 1:p-1) * U(1:p-1, p:n);
  L(p+1:n, p) = (A(p+1:n, p) - L(p+1:n, 1:p-1) * U(1:p-1, p)) / U(p, p);
endfor

endfunction
