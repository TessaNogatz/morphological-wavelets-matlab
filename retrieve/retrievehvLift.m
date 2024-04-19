function [F010, F100, F001, F111] = retrievehvLift(level, o, H, L)
%------------------------------------------------------------------------------
%
% This function extracts gridfunction F010, F100, F001 and F111 from H.
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com
%------------------------------------------------------------------------------
F010 = retrieveQ3D(level, '010', o, H, L);
F100 = retrieveQ3D(level, '100', o, H, L);
F001 = retrieveQ3D(level, '001', o, H, L);
F111 = retrieveQ3D(level, '111', o, H, L);
if isempty(F010) || isempty(F100)
  disp([' retrieved1Lift - ERROR at type ' o ' with level ' num2str(level)]);
  error(' retrieved1Lift - empty result ')
else
  [m010, n010, l010]=size(F010);
  [m100, n100, l100]=size(F100);
  [m001, n001, l001]=size(F001);
  [m111, n111, l111]=size(F111);
if m010 < m100 || m010 < m111 || m010 > m100+1 || m010 > m111+1 ...
        || m010 ~= m001 
  error(' retrievehvLift - dimensions do not match for m ')
end 
if n001 < n010 || n001 < n111 || n001 > n010+1 || n001 > n010+1 ...
        || n001 ~= n100 
  error(' retrievehvLift - dimensions do not match for n ')
end  
if l100 < l001 || l100 < l111 || l100 > l001+1 || l100 > l111+1 ...
        || l100 ~= l010 
  error(' retrievehvLift - dimensions do not match for l ')
end 
%
% m01 <= m10 <= m01+1 is satisfied
% n10 <= n01 <= n10+1 is satisfied
%
end
%------------------------------------------------------------------------------
