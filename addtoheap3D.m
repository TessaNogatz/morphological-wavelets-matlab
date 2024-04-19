function H = addtoheap3D(F, H)
%------------------------------------------------------------------------------
%
% Appends 3D gridfunction to 1D storage (heap) H.
%
% Note: because of reasons of efficiency we opt for columnwise storage as
%       in Matlab. This is also how Fortran stores matrices.
%
% See also: storeR3D, storeQ3D.
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com

%------------------------------------------------------------------------------
[nH, mH] = size(H);
if ~isempty(H)
  if mH ~= 1
    error(' addtoheap - heap should be column vector ')
  end
end
H = [H; F(:)];
%------------------------------------------------------------------------------
