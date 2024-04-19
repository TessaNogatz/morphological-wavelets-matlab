function E = extF3D(A, c)
%------------------------------------------------------------------------------
% Extend front by slice occupied with c
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com
%-----------------------------------------------------------------------------
[n, m, l] = size(A);
%E=[A.'; linspace(c, c, n)].';
E = cat(3, c*ones(n,m,1,class(A)), A);
%------------------------------------------------------------------------------
