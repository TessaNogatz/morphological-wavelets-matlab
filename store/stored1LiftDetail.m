function [H, L] = stored1LiftDetail( F110, F011, levelF, o, H, L)
%------------------------------------------------------------------------------
%
% This function stores F110 and F011 (separately) for future extraction.
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com
%------------------------------------------------------------------------------
[m110, n110, l110]=size(F110);
[m011, n011, l011]=size(F011);

if m011 < m110  || m011 > m110+1 
  error(' stored1LiftDetail - dimensions do not match for m ')
end 
if n011 ~= n110 
  error(' stored1LiftDetail - dimensions do not match for n ')
end  
if l110 < l011 || l110 > l011+1 
  error(' stored1LiftDetail - dimensions do not match for l ')
end 
%
% m01 <= m10 <= m01+1 is satisfied
% n10 <= n01 <= n10+1 is satisfied
%
[H, L] = storeQ3D( F110, levelF, '110', o, H, L);
[H, L] = storeQ3D( F011, levelF, '011', o, H, L);

%------------------------------------------------------------------------------

