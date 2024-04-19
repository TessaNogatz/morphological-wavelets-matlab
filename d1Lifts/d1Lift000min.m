function A000 = d1Lift000min(A110, A011, n000, cmax)
%-----------------------------------------------------------------------------
%
% For each point of colour 000 this function assigns the minimum value at the
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
        R1 = min(extL3D(stripR3D(extF3D(stripB3D(A011), cmax)), cmax), A011);
        R2 = min(A011, stripB3D(extF3D(A011, cmax)));
    elseif l000 == l011+1 % m odd
        R1 = min(extL3D(stripR3D(extF3D(A011, cmax)), cmax), extB3D(A011, cmax));
        R2 = min(extB3D(A011, cmax), extF3D(A011, cmax));
    else
        error(' d1Lift000max - sizes do not match ');
    end
elseif n000 == n011+1 % n odd
    if l000 == l011 % m even
        R1 = min(extL3D(extF3D(stripB3D(A011), cmax), cmax), extL3D(A011, cmax));
        R2 = min(extR3D(A011, cmax), extR3D(stripB3D(extF3D(A011, cmax)), cmax));
    elseif l000 == l011+1 % m odd
        R1 = min(extL3D(extF3D(A011, cmax), cmax), extL3D(extB3D(A011, cmax), cmax));
        R2 = min(extR3D(extB3D(A011, cmax), cmax), extR3D(extF3D(A011, cmax), cmax));
    else
        error(' d1Lift000max - sizes do not match ');
    end
else 
    error(' d1Lift000max - sizes do not match ');
end

R = min(R1, R2);
  
if n000 == n110 % n even
    if m000 == m110 % m even
        S1 = min(extL3D(stripR3D(extU3D(stripD3D(A110), cmax)), cmax), A110);
        S2 = min(A110, stripD3D(extU3D(A110, cmax)));
    elseif m000 == m110+1 % m odd
        S1 = min(extL3D(stripR3D(extU3D(A110, cmax)), cmax), extD3D(A110, cmax));
        S2 = min(extD3D(A110, cmax), extU3D(A110, cmax));
    else
        error(' d1Lift000max - sizes do not match ');
    end
elseif n000 == n110+1 % n odd
    if m000 == m110 % m even
        S1 = min(extL3D(extU3D(stripD3D(A110), cmax), cmax), extL3D(A110, cmax));
        S2 = min(extR3D(A110, cmax), extR3D(stripD3D(extU3D(A110, cmax)), cmax));
    elseif m000 == m110+1 % m odd
        S1 = min(extL3D(extU3D(A110, cmax), cmax), extL3D(extD3D(A110, cmax), cmax));
        S2 = min(extR3D(extD3D(A110, cmax), cmax), extR3D(extU3D(A110, cmax), cmax));
    else
        error(' d1Lift000max - sizes do not match ');
    end
else 
    error(' d1Lift000max - sizes do not match ');
end

S = min(S1, S2);

A000=min(R, S);
%-----------------------------------------------------------------------------
