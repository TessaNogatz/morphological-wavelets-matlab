function C = getcolor010(A)
%------------------------------------------------------------------------------
% Return submatrix 010
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com
%------------------------------------------------------------------------------
[n, m, l] = size(A);
C=A(1:2:n, 2:2:m, 1:2:l);
%------------------------------------------------------------------------------
