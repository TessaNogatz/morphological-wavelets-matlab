function F = retrieveQ3D(level, colorF, o, H, L)
%------------------------------------------------------------------------------
%
% This function extracts gridfunction F of colour colorF from heap H.
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com
%------------------------------------------------------------------------------
if isempty(L) || isempty(H)
  F = [];
else
  FL = [];
  [nL, mL] = size(L);
  if mL ~= 7
    disp([' retrieveQ - ERROR at type ' o ' color ' colorF ...
          ' with level ' num2str(level)]);
    error(' retrieveQ - books do not fit ')
  end    
  switch colorF
      case '000' , icolorF = 1;
      case '110' , icolorF = 2;
      case '011' , icolorF = 3;
      case '101' , icolorF = 4;
      case '010' , icolorF = 5;
      case '100' , icolorF = 6;
      case '001' , icolorF = 7;
      case '111' , icolorF = 8;
      otherwise
          disp([' retrieveQ - ERROR at type ' o ' color ' colorF ...
                ' with level ' num2str(level)]);
          error(' retrieveQ - unknown type of coefficients ')          
  end
  for j=1:nL
    if L(j, 2) == icolorF
      FL = [FL; [ L(j,1) 0 L(j,3:7)]];
    end
  end
  if isempty(FL)
    F = [];
  else
    F = retrieveR3D(level, o, H, FL);
  end
end
%------------------------------------------------------------------------------
