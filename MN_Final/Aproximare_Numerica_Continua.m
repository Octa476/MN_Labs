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
## @deftypefn {} {@var{retval} =} Aproximare_Numerica_Continua (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Octa476 <Octa476@DESKTOP-1986M2J>
## Created: 2024-05-30

function c = Aproximare_Numerica_Continua(f, a, b, n)
  % n - cel mai mare grad al unui polinom din baza.
  A = zeros(n + 1, n + 1);
  for i = 1 : n + 1
    for j = 1 : n + 1
      g = @(x) x ^ (i + j - 2);
      A(i, j) = MetodaTrapezelor(g, a, b, 100);
    endfor
  endfor
  d = zeros(n + 1, 1);
  for i = 1 : n + 1
    g = @(x) x ^ (i - 1);
    d(i) = Metoda_Trapezelor_Produs(f, g, a, b, 100);
  endfor
  c = A \ d;

  % Graficele funtiei si aproximarii.
  N = 1000;
  x = linspace(a, b, N);
  yr = zeros(1, N);
  for i = 1 : N
    yr(i) = f(x(i));
  endfor

  ya = zeros(1, N);
  for i = 1 : N
    ya(i) = 0;
    for j = 0 : n
      ya(i) = ya(i) + c(j + 1) * (x(i)) ^ j;
    endfor
  endfor
  plot(x, yr, "b", x, ya, "r");
endfunction
