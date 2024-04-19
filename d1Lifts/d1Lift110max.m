function A110 = d1Lift110max(A000, A101, n110, cmin)
%-----------------------------------------------------------------------------
%
% For each point of colour 110 this function assigns the maximum value at the
% neighbouring gridpoints of colours 000 and 101.
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com
%-----------------------------------------------------------------------------
[m000, n000, l000] = size(A000);
[m101, n101, l101] = size(A101);

m110 = m101; 
l110=l000;

if n110 == n000 % n even
    if m110 == m000 % m even
        R1 = max(A000, stripU3D(extD3D(A000, cmin)));
        R2 = max(stripL3D(extR3D(A000, cmin)), stripL3D(extR3D(stripU3D(extD3D(A000, cmin)), cmin)));
    elseif m110 == m000-1 % m odd
        R1 = max(stripU3D(A000), stripD3D(A000));
        R2 = max(stripL3D(extR3D(stripU3D(A000), cmin)), stripL3D(extR3D(stripD3D(A000), cmin)));
    else
        error(' d1Lift000max - sizes do not match ');
    end
elseif n110 == n000-1 % n odd
    if m110 == m000 % m even
        R1 = max(stripR3D(A000), stripR3D(stripU3D(extD3D(A000, cmin))));
        R2 = max(stripL3D(A000), stripL3D(stripU3D(extD3D(A000, cmin))));
    elseif m110 == m000-1 % m odd
        R1 = max(stripR3D(stripU3D(A000)), stripR3D(stripD3D(A000)));
        R2 = max(stripL3D(stripU3D(A000)), stripL3D(stripD3D(A000)));
    else
        error(' d1Lift000max - sizes do not match ');
    end
else 
    error(' d1Lift000max - sizes do not match ');
end

R = max(R1, R2);
  
if n110 == n101 % n even
    if l110 == l101 % l even
        S1 = max(A101, stripB3D(extF3D(A101, cmin)));
        S2 = max(stripL3D(extR3D(A101, cmin)), stripL3D(extR3D(stripB3D(extF3D(A101, cmin)), cmin)));
    elseif l110 == l101+1 % l odd
        S1 = max(extF3D(A101, cmin), extB3D(A101, cmin));
        S2 = max(stripL3D(extR3D(extF3D(A101, cmin), cmin)), stripL3D(extR3D(extB3D(A101, cmin), cmin)));
    else
        error(' d1Lift000max - sizes do not match ');
    end
elseif n110 == n101-1 % n odd
    if l110 == l101 % m even
        S1 = max(stripR3D(A101), stripR3D(stripB3D(extF3D(A101, cmin))));
        S2 = max(stripL3D(A101), stripL3D(stripB3D(extF3D(A101, cmin))));
    elseif l110 == l101+1 % m odd
        S1 = max(stripR3D(extF3D(A101, cmin)), stripR3D(extB3D(A101, cmin)));
        S2 = max(stripL3D(extF3D(A101, cmin)), stripL3D(extB3D(A101, cmin)));
    else
        error(' d1Lift000max - sizes do not match ');
    end
else 
    error(' d1Lift000max - sizes do not match ');
end

S = max(S1, S2);

A110=max(R, S);
%-----------------------------------------------------------------------------
