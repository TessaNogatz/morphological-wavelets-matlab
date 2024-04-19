function A100 = hvLift100max(A110, A000, A101, cmin)
%-----------------------------------------------------------------------------
%
% For each point of colour 100 this function assigns the maximum value at the
% neighbouring gridpoints of colours 100, 000, 101.
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com
%-----------------------------------------------------------------------------
[m000, n000, l000]=size(A000);
[m110, n110, l110]=size(A110);
[m101, n101, l101]=size(A101);

n100=n000;
m100=m110;
l100=l110;

if n100 == n110
  S = max(stripR3D(extL3D(A110,cmin)), A110);
elseif n100 == n110+1 
  S = max(extL3D(A110, cmin), extR3D(A110, cmin));
else
  error(' hvLift100max - sizes do not match ');
end

if m100 == m000
  T = max(A000, stripU3D(extD3D(A000, cmin)));
elseif m100 == m000-1 
  T = max(stripD3D(A000), stripU3D(A000));
else
  error(' hvLift100max - sizes do not match ');
end 

if l100 == l101
  R = max(A101, stripB3D(extF3D(A101, cmin)));
elseif l100 == l101+1 
  R = max(extB3D(A101, cmin), extF3D(A101, cmin));
else
  error(' v do not match ');
end 

A100=max(S, max(R ,T));
%-----------------------------------------------------------------------------
