function A010 = hvLift010min(A000, A110, A011, cmax)
%-----------------------------------------------------------------------------
%
% For each point of colour 010 this function assigns the minimum value at the
% neighbouring gridpoints of colours 000, 110, 011.
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com
%
%-----------------------------------------------------------------------------
[m000, n000, l000] = size(A000);
[m110, n110, l110] = size(A110);
[m011, n011, l011] = size(A011);

n010 = n110;
m010 = m000;
l010 = l000;

if n010 == n000
    S = min(stripL3D(extR3D(A000,cmax)), A000);
elseif n010 == n000-1 
    S = min(stripL3D(A000), stripR3D(A000));
else
  error(' hvLift000max - sizes do not match ');
end

if m010 == m110
  T = min(A110, stripD3D(extU3D(A110, cmax)));
elseif m010 == m110+1 
  T = min(extD3D(A110, cmax), extU3D(A110, cmax));
else
  error(' hvLift001max - sizes do not match ');
end

if l010 == l011
  R = min(A011, stripB3D(extF3D(A011, cmax)));
elseif l010 == l011+1 
  R = min(extB3D(A011, cmax), extF3D(A011, cmax));
else
  error(' synA01max - A11 and A00 do not match ');
end 

A010=min(S, min(R ,T));
%-----------------------------------------------------------------------------
