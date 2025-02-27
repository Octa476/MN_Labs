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
## @deftypefn {} {@var{retval} =} Derivare (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Octa476 <Octa476@DESKTOP-1986M2J>
## Created: 2024-05-27

function [dI1 dI2 dII] = Derivare(f, x0)
  h = 0.001;
  % Prima derivata.
  dI1 = (f(x0 + h) - f(x0)) / h;
  % A doua formula este mai precisa.
  dI2 = (f(x0 + h) - f(x0 - h)) / (2 * h);
  % Derivata de ordinul II.
  dII = (f(x0 + h) + f(x0 -h) - 2 * f(x0)) / (h * h);
endfunction
