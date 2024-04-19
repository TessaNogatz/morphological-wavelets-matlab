function A000 = d1Lift000max(A110, A011, n000, cmin)
%-----------------------------------------------------------------------------
%
% For each point of colour 000 this function assigns the maximum value at the
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

m000 = m011; 

l000=l110;

if n000 == n011 % n even
    if l000 == l011 % m even
        R1 = max(extL3D(stripR3D(extF3D(stripB3D(A011), cmin)), cmin), A011);
        R2 = max(A011, stripB3D(extF3D(A011, cmin)));
    elseif l000 == l011+1 % m odd
        R1 = max(extL3D(stripR3D(extF3D(A011, cmin)), cmin), extB3D(A011, cmin));
        R2 = max(extB3D(A011, cmin), extF3D(A011, cmin));
    else
        error(' d1Lift000max - sizes do not match ');
    end
elseif n000 == n011+1 % n odd
    if l000 == l011 % m even
        R1 = max(extL3D(extF3D(stripB3D(A011), cmin), cmin), extL3D(A011, cmin));
        R2 = max(extR3D(A011, cmin), extR3D(stripB3D(extF3D(A011, cmin)), cmin));
    elseif l000 == l011+1 % m odd
        R1 = max(extL3D(extF3D(A011, cmin), cmin), extL3D(extB3D(A011, cmin), cmin));
        R2 = max(extR3D(extB3D(A011, cmin), cmin), extR3D(extF3D(A011, cmin), cmin));
    else
        error(' d1Lift000max - sizes do not match ');
    end
else 
    error(' d1Lift000max - sizes do not match ');
end

R = max(R1, R2);
  
if n000 == n110 % n even
    if m000 == m110 % m even
        S1 = max(extL3D(stripR3D(extU3D(stripD3D(A110), cmin)), cmin), A110);
        S2 = max(extL3D(stripR3D(A110), cmin), stripD3D(extU3D(A110, cmin)));
    elseif m000 == m110+1 % m odd
        S1 = max(extL3D(stripR3D(extU3D(A110, cmin)), cmin), extD3D(A110, cmin));
        S2 = max(extD3D(A110, cmin), extU3D(A110, cmin));
    else
        error(' d1Lift000max - sizes do not match ');
    end
elseif n000 == n110+1 % n odd
    if m000 == m110 % m even
        S1 = max(extL3D(extU3D(stripD3D(A110), cmin), cmin), extR3D(A110, cmin));
        S2 = max(extR3D(A110, cmin), extR3D(stripD3D(extU3D(A110, cmin)), cmin));
    elseif m000 == m110+1 % m odd
        S1 = max(extL3D(extU3D(A110, cmin), cmin), extL3D(extD3D(A110, cmin), cmin));
        S2 = max(extR3D(extD3D(A110, cmin), cmin), extR3D(extU3D(A110, cmin), cmin));
    else
        error(' d1Lift000max - sizes do not match ');
    end
else 
    error(' d1Lift000max - sizes do not match ');
end

S = max(S1, S2);

A000=max(R, S);
%-----------------------------------------------------------------------------
