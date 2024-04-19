function N = numoflevs3D(L)
%------------------------------------------------------------------------------
%
% Extracts the number of levels from the array of bookkeeping.
%
% L = 3D integer array of bookkeeping.
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com
%------------------------------------------------------------------------------
[nL, mL] = size(L);
if mL ~= 7
  error(' numoflevs - books do not fit ');
end
N = L(nL,1);
if N < 1
  error(' numoflevs - the number of levels should be at least one ');
end
%------------------------------------------------------------------------------
