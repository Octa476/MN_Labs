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
## @deftypefn {} {@var{retval} =} QR_fara_deplasare (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Octa476 <Octa476@DESKTOP-1986M2J>
## Created: 2024-05-29

function valp = QR_fara_deplasare(A, maxiter, tol)
  [n n] = size(A);
  Hu = Forma_Superior_Hessenberg(A);
  A = Hu;
  for k = 1 : maxiter
    [Q R] = Householder(A);
    A = R * Q;
  endfor
  valp = zeros(n, 1);
  for k = 1 : n
    valp(k) = A(k, k);
  endfor
endfunction
