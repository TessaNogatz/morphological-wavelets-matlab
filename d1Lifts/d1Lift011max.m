function A011 = d1Lift011max(A000, A101, n011, cmin)
%-----------------------------------------------------------------------------
%
% For each point of colour 011 this function assigns the maximum value at the
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
        R1 = max(A101, stripD3D(extU3D(A101, cmin)));
        R2 = max(stripL3D(extR3D(A101, cmin)), stripL3D(extR3D(stripD3D(extU3D(A101, cmin)), cmin)));
    elseif m011 == m101+1 % m odd
        R1 = max(extU3D(A101, cmin), extD3D(A101, cmin));
        R2 = max(stripL3D(extR3D(extU3D(A101, cmin), cmin)), stripL3D(extR3D(extD3D(A101, cmin), cmin)));
    else
        error(' d1Lift000max - sizes do not match ');
    end
elseif n011 == n101-1 % n odd
    if m011 == m101 % m even
        R1 = max(stripR3D(A101), stripR3D(stripD3D(extU3D(A101, cmin))));
        R2 = max(stripL3D(A101), stripL3D(stripD3D(extU3D(A101, cmin))));
    elseif m011 == m101+1 % m odd
        R1 = max(stripR3D(extU3D(A101, cmin)), stripR3D(extD3D(A101, cmin)));
        R2 = max(stripL3D(extU3D(A101, cmin)), stripL3D(extD3D(A101, cmin)));
    else
        error(' d1Lift000max - sizes do not match ');
    end
else 
    error(' d1Lift000max - sizes do not match ');
end

R = max(R1, R2);
  
if n011 == n000 % n even
    if l011 == l000 % m even
        S1 = max(A000, stripF3D(extB3D(A000, cmin)));
        S2 = max(stripL3D(extR3D(A000, cmin)), stripL3D(extR3D(stripF3D(extB3D(A000, cmin)), cmin)));
    elseif l011 == l000-1 % m odd
        S1 = max(stripF3D(A000), stripB3D(A000));
        S2 = max(stripL3D(extR3D(stripF3D(A000), cmin)), stripL3D(extR3D(stripB3D(A000), cmin)));
    else
        error(' d1Lift000max - sizes do not match ');
    end
elseif n011 == n000-1 % n odd
    if l011 == l000 % m even
        S1 = max(stripR3D(A000), stripR3D(stripF3D(extB3D(A000, cmin))));
        S2 = max(stripL3D(A000), stripL3D(stripF3D(extB3D(A000, cmin))));
    elseif l011 == l000-1 % m odd
        S1 = max(stripR3D(stripF3D(A000)), stripR3D(stripB3D(A000)));
        S2 = max(stripL3D(stripF3D(A000)), stripL3D(stripB3D(A000)));
    else
        error(' d1Lift000max - sizes do not match ');
    end
else 
    error(' d1Lift000max - sizes do not match ');
end

S = max(S1, S2);

A011=max(R, S);
%-----------------------------------------------------------------------------
