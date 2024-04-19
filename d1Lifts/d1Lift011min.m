function A011 = d1Lift011min(A000, A101, n011, cmax)
%-----------------------------------------------------------------------------
%
% For each point of colour 011 this function assigns the minimum value at the
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

m011 = m000; 

l011=l101;

if n011 == n101 % n even
    if m011 == m101 % m even
        R1 = min(A101, stripD3D(extU3D(A101, cmax)));
        R2 = min(stripL3D(extR3D(A101, cmax)), stripL3D(extR3D(stripD3D(extU3D(A101, cmax)), cmax)));
    elseif m011 == m101+1 % m odd
        R1 = min(extU3D(A101, cmax), extD3D(A101, cmax));
        R2 = min(stripL3D(extR3D(extU3D(A101, cmax), cmax)), stripL3D(extR3D(extD3D(A101, cmax), cmax)));
    else
        error(' d1Lift000max - sizes do not match ');
    end
elseif n011 == n101-1 % n odd
    if m011 == m101 % m even
        R1 = min(stripR3D(A101), stripR3D(stripD3D(extU3D(A101, cmax))));
        R2 = min(stripL3D(A101), stripL3D(stripD3D(extU3D(A101, cmax))));
    elseif m011 == m101+1 % m odd
        R1 = min(stripR3D(extU3D(A101, cmax)), stripR3D(extD3D(A101, cmax)));
        R2 = min(stripL3D(extU3D(A101, cmax)), stripL3D(extD3D(A101, cmax)));
    else
        error(' d1Lift000max - sizes do not match ');
    end
else 
    error(' d1Lift000max - sizes do not match ');
end

R = min(R1, R2);
  
if n011 == n000 % n even
    if l011 == l000 % m even
        S1 = min(A000, stripF3D(extB3D(A000, cmax)));
        S2 = min(stripL3D(extR3D(A000, cmax)), stripL3D(extR3D(stripF3D(extB3D(A000, cmax)), cmax)));
    elseif l011 == l000-1 % m odd
        S1 = min(stripF3D(A000), stripB3D(A000));
        S2 = min(stripL3D(extR3D(stripF3D(A000), cmax)), stripL3D(extR3D(stripB3D(A000), cmax)));
    else
        error(' d1Lift000max - sizes do not match ');
    end
elseif n011 == n000-1 % n odd
    if l011 == l000 % m even
        S1 = min(stripR3D(A000), stripR3D(stripF3D(extB3D(A000, cmax))));
        S2 = min(stripL3D(A000), stripL3D(stripF3D(extB3D(A000, cmax))));
    elseif l011 == l000-1 % m odd
        S1 = min(stripR3D(stripF3D(A000)), stripR3D(stripB3D(A000)));
        S2 = min(stripL3D(stripF3D(A000)), stripL3D(stripB3D(A000)));
    else
        error(' d1Lift000max - sizes do not match ');
    end
else 
    error(' d1Lift000max - sizes do not match ');
end

S = min(S1, S2);

A011=min(R, S);
%-----------------------------------------------------------------------------
