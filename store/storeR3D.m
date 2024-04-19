function [H, L] = storeR3D( F, levelF, o, H, L)
%------------------------------------------------------------------------------
% 
% This function is a 3-dimensional lifting scheme utility. 
% 
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com
%------------------------------------------------------------------------------
addend = [0 0 0 0 0 0 0];
if isempty(L)
  if ~isempty(H)
    error(' storeR - books empty but heap is not ')
  else 
    nL = 0;
%   mL = 6;
    heaptr = 1;
  end
else
  if isempty(H)
    error(' storeR - books not empty but heap is ')
  else
    [nL, mL] = size(L); 
    if mL ~= 7
      error(' storeR - books do not fit ')
    else
      heaptr = L(nL, 7);
      if heaptr < 2
        error(' storeR - bookkeeping error ')
      end
    end
  end
end
%
L = [L; addend];
nL = nL + 1;
%
L(nL, 1) = levelF;
L(nL, 2) = 0;
switch o
    case 'a' , L(nL, 3) = 0;
    case 'd' , L(nL, 3) = 1;
%   case 'n' , L(nL, 3) = 2;
    otherwise
        error(' storeR - unknown type of coefficients ')
end
if isempty(F)
  error(' storeR - addition is empty ')
else
  [nF, mF, lF] = size(F);
end
L(nL, 4) = nF;
L(nL, 5) = mF;
L(nL, 6) = lF;
L(nL, 7) = heaptr + nF * mF *lF;
%
H = addtoheap3D(F, H);
%------------------------------------------------------------------------------
