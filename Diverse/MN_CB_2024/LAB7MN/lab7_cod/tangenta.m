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
## @deftypefn {} {@var{retval} =} tangenta (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2022-04-09

function x = tangenta (f, x0, tol)
  pkg load symbolic;
  syms x;
  df = function_handle (diff(f, x));
  x = x0 - f(x0) / df(x0);
  iter = 1;
  
  while abs(f(x)) > tol
    x0 = x;
    x = x0 - f(x0) / df(x0);
    iter++;
  endwhile
 
  iter
endfunction
