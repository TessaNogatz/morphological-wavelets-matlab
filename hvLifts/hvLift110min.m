function A110 = hvLift110min(A100, A010, A111, cmax)
%-----------------------------------------------------------------------------
% For each point of colour 110 this function assigns the minimum value at the
% neighbouring gridpoints of colours 100, 010, 111.
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com
%
%-----------------------------------------------------------------------------
[m010, n010, l010] = size(A010);
[m100, n100, l100] = size(A100);
[m111, n111, l111] = size(A111);

n110 = n010;
m110 = m100;
l110 = l100;

if n110 == n100
    S = min(stripL3D(extR3D(A100,cmax)), A100);
elseif n110 == n100-1 
    S = min(stripL3D(A100), stripR3D(A100));
else
  error(' hvLift110max - sizes do not match ');
end 

if m110 == m010
    T = min(A010, stripU3D(extD3D(A010, cmax)));
elseif m110 == m010-1 
    T = min(stripD3D(A010), stripU3D(A010));
else
    error(' hvLift110max - sizes do not match ');
end 

if l110 == l111
    R = min(A111, stripB3D(extF3D(A111, cmax)));
elseif l110 == l111+1 
    R = min(extB3D(A111, cmax), extF3D(A111, cmax));
else
  error(' hvLift110max - sizes do not match ');
end 

A110=min(S, min(R ,T));
%-----------------------------------------------------------------------------
