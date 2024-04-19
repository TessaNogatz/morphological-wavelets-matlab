function A011 = hvLift011min(A001, A111, A010, cmax)
%-----------------------------------------------------------------------------
%
% For each point of colour 011 this function assigns the minimum value at the
% neighbouring gridpoints of colours 001, 110, 010.
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com
%
%-----------------------------------------------------------------------------
[m001, n001, l001] = size(A001);
[m111, n111, l111] = size(A111);
[m010, n010, l010] = size(A010);

n011 = n010;
m011 = m001;
l011 = l001;

if n011 == n001
  S = min(stripL3D(extR3D(A001,cmax)), A001);
elseif n011 == n001-1 
  S = min(stripL3D(A001), stripR3D(A001));
else
  error(' hvLift011max - sizes do not match ');
end 

if m011 == m111
  T = min(A111, stripD3D(extU3D(A111, cmax)));
elseif m011 == m111+1 
  T = min(extD3D(A111, cmax), extU3D(A111, cmax));
else
  error(' hvLift011max - sizes do not match ');
end 

if     l011 == l010
  R = min(A010, stripF3D(extB3D(A010, cmax)));
elseif l011 == l010-1 
  R = min(stripB3D(A010), stripF3D(A010));
else
  error(' hvLift011max - sizes do not match ');
end 

A011=min(S, min(R ,T));
%-----------------------------------------------------------------------------
