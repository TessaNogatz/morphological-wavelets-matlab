function E = extU3D(A, c)
%------------------------------------------------------------------------------
% Extend up by slice occupied with c
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com
%-----------------------------------------------------------------------------
[~, m, n] = size(A);
E = cat(1, c*ones(1, m,n,class(A)), A);
%------------------------------------------------------------------------------
