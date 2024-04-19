function A101 = hvLift101min(A111, A001, A100, cmax)
%-----------------------------------------------------------------------------
%
% For each point of colour 101 this function assigns the minimum value at the
% neighbouring gridpoints of colours 111, 001, 100.
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com
%
%-----------------------------------------------------------------------------
[m111, n111, l111] = size(A111);
[m001, n001, l001] = size(A001);
[m100, n100, l100] = size(A100);

n101 = n001;
m101 = m111;
l101 = l111;
 
if n101 == n111
  S = min(stripR3D(extL3D(A111,cmax)), A111);
elseif n101 == n111+1 
  S = min(extL3D(A111, cmax), extR3D(A111, cmax));
else
  error(' hvLift101max - sizes do not match ');
end 

if m101 == m001
    T = min(A001, stripU3D(extD3D(A001, cmax)));
elseif m101 == m001-1 
    T = min(stripD3D(A001), stripU3D(A001));
else
  error(' hvLift101max - sizes do not match ');
end 

if l101 == l100
    R = min(A100, stripF3D(extB3D(A100, cmax)));
elseif l101 == l100-1 
    R = min(stripB3D(A100), stripF3D(A100));
else
    error(' hvLift101max - sizes do not match ');
end
A101=min(S, min(R ,T));
%-----------------------------------------------------------------------------
