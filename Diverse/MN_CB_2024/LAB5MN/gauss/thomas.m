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
## @deftypefn {} {@var{retval} =} thomas (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2022-03-25

function x = thomas (a, b, c, d)
  n = length(d);
  
  a = [0; a];
  c(1) = c(1) / b(1);
  d(1) = d(1) / b(1);
  
  for i = 2:n-1
    aux = b(i) - c(i-1) * a(i);
    c(i) = c(i) / aux;
    d(i) = (d(i) - d(i-1) * a(i)) / aux;
  endfor

  d(n) = (d(n) - d(n-1)*a(n)) / (b(n) - c(n-1) * a(n));
  x(n) = d(n);
  
  for i = n-1:-1:1
    x(i) = d(i) - c(i) * x(i+1);
  endfor
  
  x = x';
  
endfunction
