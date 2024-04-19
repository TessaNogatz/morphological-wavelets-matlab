function A010 = hvLift010max(A000, A110, A011, cmin)
%-----------------------------------------------------------------------------
%
% For each point of colour 010 this function assigns the maximum value at the
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
    S = max(stripL3D(extR3D(A000,cmin)), A000);
elseif n010 == n000-1 
    S = max(stripL3D(A000), stripR3D(A000));
else
  error(' hvLift000max - sizes do not match ');
end

if m010 == m110
  T = max(A110, stripD3D(extU3D(A110, cmin)));
elseif m010 == m110+1 
  T = max(extD3D(A110, cmin), extU3D(A110, cmin));
else
  error(' hvLift001max - sizes do not match ');
end

if l010 == l011
  R = max(A011, stripB3D(extF3D(A011, cmin)));
elseif l010 == l011+1 
  R = max(extB3D(A011, cmin), extF3D(A011, cmin));
else
  error(' synA01max - A11 and A00 do not match ');
end 

A010=max(S, max(R ,T));
%-----------------------------------------------------------------------------
