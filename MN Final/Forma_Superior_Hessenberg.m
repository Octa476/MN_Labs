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
## @deftypefn {} {@var{retval} =} Forma_Superior_Hessenberg (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Octa476 <Octa476@DESKTOP-1986M2J>
## Created: 2024-05-28

function Hu = Forma_Superior_Hessenberg(A)
  [n n] = size(A);
  for k = 1 : n - 2
    vk = zeros(n - k, 1);
    sigma = sign(A(k + 1, k)) * sqrt(A(k + 1 : n, k)' * A(k + 1 : n, k));
    vk(1) = A(k + 1, k) + sigma;
    vk(2 : n - k) = A(k + 2 : n, k);
    Pk1 = eye(n - k) - 2 * (vk * vk') / (vk' * vk);
    Pk2 = eye(n, n);
    Pk2(k + 1 : n, k + 1 : n) = Pk1;
    Ak = Pk2 * A * Pk2';
    A = Ak;
  endfor
  Hu = A;
endfunction
