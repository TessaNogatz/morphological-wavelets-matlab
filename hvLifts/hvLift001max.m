function A001 = hvLift001max(A011, A000, A101, cmin)
%-----------------------------------------------------------------------------
% For each point of colour 001 this function assigns the maximum value at the
% neighbouring gridpoints of colours 011, 000, 101.
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com
%
%-----------------------------------------------------------------------------
[m011, n011, l011]=size(A011);
[m000, n000, l000]=size(A000);
[m101, n101, l101]=size(A101);

n001 = n000;
m001 = m011;
l001 = l011;

if     n001 == n011
  S = max(stripR3D(extL3D(A011, cmin)), A011);
elseif n001 == n011+1 
  S = max(extR3D(A011, cmin), extL3D(A011, cmin));
else
  %disp([' size A11 = ' int2str(size(A011)) ' size A00 = ' int2str(size(A000))]);
  error(' hvLift001max - sizes do not match ');
end

if     m001 == m101
  T = max(A101, stripD3D(extU3D(A101, cmin)));
elseif m001 == m101+1 
  T = max(extD3D(A101, cmin), extU3D(A101, cmin));
else
  %disp([' size A11 = ' int2str(size(A101)) ' size A00 = ' int2str(size(A000))]);
  error(' hvLift001max - sizes do not match ');
end

if     l001 == l000
  R = max(A000, stripF3D(extB3D(A000, cmin)));
elseif l001 == l000-1 
  R = max(stripF3D(A000), stripB3D(A000));
else
  %disp([' size A11 = ' int2str(size(A000)) ' size A00 = ' int2str(size(A000))]);
  error(' hvLift001max - sizes do not match ');
end

%Note: all(size(S) == size(T)) & all(size(S) == [n01 m01]) always holds.
A001=max(S, max(R ,T));
%-----------------------------------------------------------------------------
