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
## @deftypefn {} {@var{retval} =} crout (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2022-03-05

function [L, U] = crout_novect (A)
  tic
  [n, n] = size(A);
  L = zeros(n);
  U = eye(n);
  
  for p = 1:n
    for i = p:n
      s = 0;
      for k = 1:p-1
        s += L(i, k) * U(k, p);
      endfor
      L(i, p) = A(i, p) - s;
    endfor
    
    for j = p+1:n
      s = 0;
      for k = 1:p-1
        s += L(p, k) * U(k, j);
      endfor
      U(p, j) = (A(p, j) - s) / L(p, p);
    endfor
  endfor
  toc

endfunction
