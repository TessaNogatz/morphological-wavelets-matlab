function A000 = hvLift000max(A010, A100, A001, cmin)
%-----------------------------------------------------------------------------
%
% For each point of colour 000 this function assigns the maximum value at the
% neighbouring gridpoints of colours 010, 100, 001.
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com
%-----------------------------------------------------------------------------
[m010, n010, l010]=size(A010);
[m100, n100, l100]=size(A100);
[m001, n001, l001]=size(A001);

n000=n100; 
m000=m010;
l000=l010;
if n000 == n010
  S=max(stripR3D(extL3D(A010,cmin)), A010);
elseif n000 == n010+1 
  S=max(extR3D(A010,cmin), extL3D(A010, cmin));
else
  error(' hvLift000max - sizes do not match ');
end

if     m000 == m100
  T=max(A100, stripD3D(extU3D(A100, cmin)));
elseif m000 == m100+1 
  T=max(extD3D(A100, cmin), extU3D(A100, cmin));
else
  error(' hvLift000max - sizes do not match ');
end

if     l000 == l001
  R=max(A001, stripF3D(extB3D(A001, cmin)));
elseif l000 == l001+1 
  R=max(extB3D(A001, cmin), extF3D(A001, cmin));
else
  error(' hvLift000max - sizes do not match ');
end 

A000=max(S, max(R ,T));
%-----------------------------------------------------------------------------
