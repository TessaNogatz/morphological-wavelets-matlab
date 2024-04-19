function A110 = hvLift110max(A100, A010, A111, cmin)
%-----------------------------------------------------------------------------
%
% For each point of colour 110 this function assigns the maximum value at the
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
    S = max(stripL3D(extR3D(A100,cmin)), A100);
elseif n110 == n100-1 
    S = max(stripL3D(A100), stripR3D(A100));
else
  error(' hvLift110max - sizes do not match ');
end 

if m110 == m010
    T = max(A010, stripU3D(extD3D(A010, cmin)));
elseif m110 == m010-1 
    T = max(stripD3D(A010), stripU3D(A010));
else
    error(' hvLift110max - sizes do not match ');
end 

if l110 == l111
    R = max(A111, stripB3D(extF3D(A111, cmin)));
elseif l110 == l111+1 
    R = max(extB3D(A111, cmin), extF3D(A111, cmin));
else
  error(' hvLift110max - sizes do not match ');
end 

A110=max(S, max(R ,T));
%-----------------------------------------------------------------------------
