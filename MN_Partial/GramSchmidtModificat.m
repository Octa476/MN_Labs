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
## @deftypefn {} {@var{retval} =} GramSchmidtModificat (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Octa476 <Octa476@DESKTOP-1986M2J>
## Created: 2024-04-22

function [Q R] = GramSchmidtModificat(A)
  % Se initializeaza matricele Q si R
  [n n] = size(A);
  Q = zeros(n, n);
  R = zeros(n,n);
  for i = 1 : n
    % Se caluleaza elementul curent de pe diagonala lui R si coloana curenta
    % a matricii Q; A(:, i) va fi egal cu vectorul u(i), deoarece in for
    % se construieste treptat proiectia vectorului A(:, i) pe subspatiul
    % vectorial format din Q(:, 1), ..., Q(:, i - 1).
    R(i, i) = norm(A(i, :), 2);
    Q(:, i) = A(:, i) / R(i, i);
    for j = i + 1 : n
      % Se populeaza  linia i a matricii R.
      R(i, j) = Q(:, i)' * A(:, j);
      % Se precalculeaza proiectiile.
      A(:, j) = A(:, j) - R(i, j) * Q(:, i);
    endfor
  endfor
endfunction
