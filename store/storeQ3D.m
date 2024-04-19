function [H, L] = storeQ3D( F, levelF, colorF, o, H, L)
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
[H, L] = storeR3D( F, levelF, o, H, L);
[nL, mL] = size(L);
switch colorF
    case '000' , L(nL, 2) = 1;
    case '110' , L(nL, 2) = 2;
    case '011' , L(nL, 2) = 3;
    case '101' , L(nL, 2) = 4;
    case '010' , L(nL, 2) = 5;
    case '100' , L(nL, 2) = 6;
    case '001' , L(nL, 2) = 7;
    case '111' , L(nL, 2) = 8;
    otherwise
                error(' storeQ - unknown type of coefficients ')
end
%------------------------------------------------------------------------------

