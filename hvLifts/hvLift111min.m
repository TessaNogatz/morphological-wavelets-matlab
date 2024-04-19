function A111 = hvLift111min(A101, A011, A110, cmax)
%-----------------------------------------------------------------------------
%
% For each point of colour 111 this function assigns the minimum value at the
% neighbouring gridpoints of colours 101, 011, 110.
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com
%
%-----------------------------------------------------------------------------
[m110, n110, l110] = size(A110);
[m011, n011, l011] = size(A011);
[m101, n101, l101] = size(A101);

n111 = n110;
m111 = m101;
l111 = l101;

if n111 == n101
    S = min(stripL3D(extR3D(A101,cmax)), A101);
elseif n111 == n101-1 
    S = min(stripR3D(A101), stripL3D(A101));
else
  error(' hvLift111max - sizes do not match ');
end 

if m111 == m011
    T = min(A011, stripU3D(extD3D(A011, cmax)));
elseif m111 == m011-1 
    T = min(stripD3D(A011), stripU3D(A011));
else
  error(' hvLift111max - sizes do not match ');
end 

if l111 == l110
    R = min(A110, stripF3D(extB3D(A110, cmax)));
elseif l111 == l110-1 
    R = min(stripF3D(A110), stripB3D(A110));
else
  error(' hvLift111max - sizes do not match ');
end 

A111=min(S, min(R ,T));
%-----------------------------------------------------------------------------
