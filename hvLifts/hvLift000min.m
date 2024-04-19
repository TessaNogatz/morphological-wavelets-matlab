function A000 = hvLift000min(A010, A100, A001, cmax)
%-----------------------------------------------------------------------------
% For each point of colour 000 this function assigns the minimum value at the
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
  S=min(stripR3D(extL3D(A010,cmax)), A010);
elseif n000 == n010+1 
  S=min(extR3D(A010,cmax), extL3D(A010, cmax));
else
  %disp([' size A11 = ' int2str(size(A011)) ' size A00 = ' int2str(size(A000))]);
  error(' hvLift000max - sizes do not match ');
end

if     m000 == m100
  T=min(A100, stripD3D(extU3D(A100, cmax)));
elseif m000 == m100+1 
  T=min(extD3D(A100, cmax), extU3D(A100, cmax));
else
  %disp([' size A11 = ' int2str(size(A101)) ' size A00 = ' int2str(size(A000))]);
  error(' hvLift000max - sizes do not match ');
end

if     l000 == l001
  R=min(A001, stripB3D(extF3D(A001, cmax)));
elseif l000 == l001+1 
  R=min(extB3D(A001, cmax), extF3D(A001, cmax));
else
  %disp([' size A11 = ' int2str(size(A000)) ' size A00 = ' int2str(size(A000))]);
  error(' hvLift000max - sizes do not match ');
end 

%Note: all(size(S) == size(T)) & all(size(S) == [n01 m01]) always holds.
A000=min(S, min(R ,T));
%-----------------------------------------------------------------------------
