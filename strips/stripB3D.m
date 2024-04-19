function S = stripB3D(A)
%------------------------------------------------------------------------------
%
% strip back slice 
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com
%------------------------------------------------------------------------------
S=A(:,:,1:end-1);
%------------------------------------------------------------------------------
