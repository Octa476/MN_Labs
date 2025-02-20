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
## @deftypefn {} {@var{retval} =} MPD_SMALL (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Octa476 <Octa476@DESKTOP-1986M2J>
## Created: 2024-05-25

function [lambdan, xn] = MPD_SMALL(A, y0, tol, maxiter)
  B = inv(A);
  for k = 1 : maxiter
    z = B * y0;
    yn = z / norm(z, 2);
    lambdan = yn' * B * yn;
    if norm(B * yn - lambdan * yn, 2) < tol
      break;
    endif
    y0 = yn;
  endfor
  lambdan = 1 / lambdan;
  xn = yn;
endfunction
