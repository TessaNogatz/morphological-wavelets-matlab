function A001 = hvLift001min(A011, A000, A101, cmax)
%-----------------------------------------------------------------------------
% For each point of colour 001 this function assigns the minimum value at the
% neighbouring gridpoints of colours 011, 000, 101.
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com
%-----------------------------------------------------------------------------
[m011, n011, l011]=size(A011);
[m000, n000, l000]=size(A000);
[m101, n101, l101]=size(A101);

n001 = n000;
m001 = m011;
l001 = l011;

if     n001 == n011
  S = min(stripR3D(extL3D(A011, cmax)), A011);
elseif n001 == n011+1 
  S = min(extR3D(A011, cmax), extL3D(A011, cmax));
else
  error(' hvLift001max - sizes do not match ');
end

if     m001 == m101
  T = min(A101, stripD3D(extU3D(A101, cmax)));
elseif m001 == m101+1 
  T = min(extD3D(A101, cmax), extU3D(A101, cmax));
else
  error(' hvLift001max - sizes do not match ');
end

if     l001 == l000
  R = min(A000, stripF3D(extB3D(A000, cmax)));
elseif l001 == l000-1 
  R = min(stripF3D(A000), stripB3D(A000));
else
  error(' hvLift001max - sizes do not match ');
end

A001=min(S, min(R ,T));
%-----------------------------------------------------------------------------
