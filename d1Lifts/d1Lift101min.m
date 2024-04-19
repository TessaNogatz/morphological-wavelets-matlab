function A101 = d1Lift101min(A110, A011, n101, cmax)
%-----------------------------------------------------------------------------
%
% For each point of colour 101 this function assigns the minimum value at the
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
        R1 = min(extL3D(stripR3D((A110)), cmax), A110);
        R2 = min(stripF3D(extB3D(stripR3D(extL3D(A110, cmax)), cmax)), stripF3D(extB3D(A110, cmax)));
    elseif l101 == l110-1 % l odd
        R1 = min(extL3D(stripR3D(stripB3D(A110)), cmax), stripB3D(A110));
        R2 = min(stripF3D(stripR3D(extL3D(A110, cmax))), stripF3D(A110));
    else
        error(' d1Lift101max - sizes do not match ');
    end
elseif n101 == n110+1 % n odd
    if l101 == l110 % l even
        R1 = min(extL3D(A110, cmax), extR3D(A110, cmax));
        R2 = min(stripF3D(extB3D(extL3D(A110, cmax), cmax)), extB3D(stripF3D(extR3D(A110, cmax)), cmax));
    elseif l101 == l110-1 % l odd
        R1 = min(extL3D(stripB3D(A110), cmax), extL3D(stripB3D(A110), cmax));
        R2 = min(stripF3D(extL3D(A110, cmax)), stripF3D(extR3D(A110, cmax)));
    else
        error(' d1Lift101max - sizes do not match ');
    end
else 
    error(' d1Lift101max - sizes do not match ');
end

R = min(R1, R2);
  
if n101 == n011 % n even
    if m101 == m011 % m even
        S1 = min(extL3D(stripR3D(extD3D(stripU3D(A011), cmax)), cmax), stripR3D(extL3D(A011, cmax)));
        S2 = min(A011, stripU3D(extD3D(A011, cmax)));
    elseif m101 == m011-1 % m odd
        S1 = min(extL3D(stripR3D(stripU3D(A011)), cmax), extL3D(stripR3D(stripD3D(A011)), cmax));
        S2 = min(stripU3D(A011), stripD3D(A011));
    else
        error(' d1Lift101max - sizes do not match ');
    end
elseif n101 == n011+1 % n odd
    if m101 == m011 % m even
        S1 = min(extL3D(extD3D(stripU3D(A011), cmax), cmax), extR3D(A011, cmax));
        S2 = min(extR3D(extD3D(stripU3D(A011), cmax), cmax), extL3D(A011, cmax));
    elseif m101 == m011-1 % m odd
        S1 = min(extL3D(stripU3D(A011), cmax), extL3D(stripD3D(A011), cmax));
        S2 = min(extR3D(stripU3D(A011), cmax), extR3D(stripD3D(A011), cmax));
    else
        error(' d1Lift101max - sizes do not match ');
    end
else 
    error(' d1Lift101max - sizes do not match ');
end

S = min(S1, S2);

A101=min(R, S);
%-----------------------------------------------------------------------------
