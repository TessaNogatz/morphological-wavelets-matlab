function A101 = d1Lift101max(A110, A011, n101, cmin)
%-----------------------------------------------------------------------------
%
% For each point of colour 101 this function assigns the maximum value at the
% neighbouring gridpoints of colours 110 and 011.
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com
%-----------------------------------------------------------------------------
[m110, n110, l110] = size(A110);
[m011, n011, l011] = size(A011);

m101 = m110; 
l101=l011;

if n101 == n110 % n even
    if l101 == l110 % l even
        R1 = max(extL3D(stripR3D((A110)), cmin), A110);
        R2 = max(stripF3D(extB3D(stripR3D(extL3D(A110, cmin)), cmin)), stripF3D(extB3D(A110, cmin)));
    elseif l101 == l110-1 % l odd
        R1 = max(extL3D(stripR3D(stripB3D(A110)), cmin), stripB3D(A110));
        R2 = max(stripF3D(stripR3D(extL3D(A110, cmin))), stripF3D(A110));
    else
        error(' d1Lift101max - sizes do not match ');
    end
elseif n101 == n110+1 % n odd
    if l101 == l110 % l even
        R1 = max(extL3D(A110, cmin), extR3D(A110, cmin));
        R2 = max(stripF3D(extB3D(extL3D(A110, cmin), cmin)), extB3D(stripF3D(extR3D(A110, cmin)), cmin));
    elseif l101 == l110-1 % l odd
        R1 = max(extL3D(stripB3D(A110), cmin), extL3D(stripB3D(A110), cmin));
        R2 = max(stripF3D(extL3D(A110, cmin)), stripF3D(extR3D(A110, cmin)));
    else
        error(' d1Lift101max - sizes do not match ');
    end
else 
    error(' d1Lift101max - sizes do not match ');
end

R = max(R1, R2);
  
if n101 == n011 % n even
    if m101 == m011 % m even
        S1 = max(extL3D(stripR3D(extD3D(stripU3D(A011), cmin)), cmin), stripR3D(extL3D(A011, cmin)));
        S2 = max(A011, stripU3D(extD3D(A011, cmin)));
    elseif m101 == m011-1 % m odd
        S1 = max(extL3D(stripR3D(stripU3D(A011)), cmin), extL3D(stripR3D(stripD3D(A011)), cmin));
        S2 = max(stripU3D(A011), stripD3D(A011));
    else
        error(' d1Lift101max - sizes do not match ');
    end
elseif n101 == n011+1 % n odd
    if m101 == m011 % m even
        S1 = max(extR3D(A011, cmin), extL3D(extD3D(stripU3D(A011), cmin), cmin));
        S2 = max(extR3D(stripU3D(extD3D(A011, cmin)), cmin), extL3D(A011, cmin));
    elseif m101 == m011-1 % m odd
        S1 = max(extL3D(stripU3D(A011), cmin), extL3D(stripD3D(A011), cmin));
        S2 = max(extR3D(stripU3D(A011), cmin), extR3D(stripD3D(A011), cmin));
    else
        error(' d1Lift101max - sizes do not match ');
    end
else 
    error(' d1Lift101max - sizes do not match ');
end

S = max(S1, S2);

A101=max(R, S);
%-----------------------------------------------------------------------------
