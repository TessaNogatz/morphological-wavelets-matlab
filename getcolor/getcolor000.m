function C = getcolor000(A)
%------------------------------------------------------------------------------
% Return submatrix 000
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com
%------------------------------------------------------------------------------
[n, m, l] = size(A);
C=A(1:2:n, 1:2:m, 1:2:l);
%------------------------------------------------------------------------------
