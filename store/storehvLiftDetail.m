function [H, L] = storehvLiftDetail( F010, F100, F001, F111, levelF, o, H, L)
%------------------------------------------------------------------------------
%
% This function stores F010, F100, F001 and F111 (separately) for future extraction.
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com
%------------------------------------------------------------------------------
[m010, n010, l010]=size(F010);
[m100, n100, l100]=size(F100);
[m001, n001, l001]=size(F001);
[m111, n111, l111]=size(F111);

if m010 < m100 || m010 < m111 || m010 > m100+1 || m010 > m111+1 ...
        || m010 ~= m001 
  error(' storehvLiftDetail - dimensions do not match for m ')
end 
if n001 < n010 || n001 < n111 || n001 > n010+1 || n001 > n010+1 ...
        || n001 ~= n100 
  error(' storehvLiftDetail - dimensions do not match for n ')
end  
if l100 < l001 || l100 < l111 || l100 > l001+1 || l100 > l111+1 ...
        || l100 ~= l010 
  error(' storehvLiftDetail - dimensions do not match for l ')
end 
%
% m01 <= m10 <= m01+1 is satisfied
% n10 <= n01 <= n10+1 is satisfied
%
[H, L] = storeQ3D( F010, levelF, '010', o, H, L);
[H, L] = storeQ3D( F100, levelF, '100', o, H, L);
[H, L] = storeQ3D( F001, levelF, '001', o, H, L);
[H, L] = storeQ3D( F111, levelF, '111', o, H, L);
%------------------------------------------------------------------------------

