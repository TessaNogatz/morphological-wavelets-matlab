function [F110, F011] = retrieved1Lift(level, o, H, L)
%------------------------------------------------------------------------------
%
% This function extracts gridfunction F110 and F011 from H.
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com
%------------------------------------------------------------------------------
F110 = retrieveQ3D(level, '110', o, H, L);
F011 = retrieveQ3D(level, '011', o, H, L);
if isempty(F110) || isempty(F011)
  disp([' retrieved1Lift - ERROR at type ' o ' with level ' num2str(level)]);
  error(' retrieved1Lift - empty result ')
else
  [n110, m110, l110]=size(F110);
  [n011, m011, l011]=size(F011);
  if m011 < m110
    disp([' retrieved1Lift - ERROR at type ' o ' with level ' num2str(level)]);
    error(' retrieved1Lift - dimensions do not match for m01 > m10 ')
  end 
  if n110 > n011
    disp([' retrieved1Lift - ERROR at type ' o ' with level ' num2str(level)]);
    error(' retrieved1Lift - dimensions do not match for n10 > n01 ')
  end 
  if l110 < l011
    disp([' retrieved1Lift - ERROR at type ' o ' with level ' num2str(level)]);
    error(' retrieved1Lift - dimensions do not match for l110 > l001 ')
  end 
  if m110 < m011-1
    disp([' retrieved1Lift - ERROR at type ' o ' with level ' num2str(level)]);
    error(' retrieved1Lift - dimensions do not match for m10 > m01+1 ')
  end 
  if n011 > n110+1
    disp([' retrieved1Lift - ERROR at type ' o ' with level ' num2str(level)]);
    error(' retrieved1Lift - dimensions do not match for n01 > n10+1 ')
  end 
  if l011 > l110
    disp([' retrieved1Lift - ERROR at type ' o ' with level ' num2str(level)]);
    error(' retrieved1Lift - dimensions do not match for n01 > n10+1 ')
  end 
%
% m01 <= m10 <= m01+1 is satisfied
% n10 <= n01 <= n10+1 is satisfied
%
end
%------------------------------------------------------------------------------
