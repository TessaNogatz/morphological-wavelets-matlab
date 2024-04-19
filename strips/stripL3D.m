function S = stripL3D(A)
%------------------------------------------------------------------------------
%
% strip left slice 
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com
%------------------------------------------------------------------------------
%[n, m, l] = size(A);
%Y = A.';
S = A(:,2:end,:);
%------------------------------------------------------------------------------
