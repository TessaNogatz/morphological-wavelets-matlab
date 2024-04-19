function A000 = d2Lift000min(A101, m000, l000, cmax)
%-----------------------------------------------------------------------------
%
% For each point of colour 000 this function assigns the minimum value at the
% neighbouring gridpoints of colour 101.
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com
%-----------------------------------------------------------------------------
[m101, n101, l101] = size(A101);

n000 = n101; 

if l000 == l101 % n even
    if m000 == m101 % m even
        R = min(extF3D(stripB3D(A101), cmax), extF3D(stripB3D(extU3D(stripD3D(A101), cmax)), cmax));
        S = min(A101, stripD3D(extU3D(A101, cmax)));
    elseif m000 == m101+1 % m odd
        R = min(extF3D(stripB3D(extD3D(A101, cmax)), cmax), extF3D(stripB3D(extU3D(A101, cmax)), cmax));
        S = min(extD3D(A101, cmax), extU3D(A101, cmax));
    else
        error(' d1Lift000max - sizes do not match ');
    end
elseif l000 == l101+1 % n odd
    if m000 == m101 % m even
        R = min(extF3D(A101, cmax), extB3D(extU3D(stripD3D(A101), cmax), cmax));
        S = min(extB3D(A101, cmax), extF3D(stripD3D(extU3D(A101, cmax)), cmax));
    elseif m000 == m101+1 % m odd
        R = min(extF3D(extD3D(A101, cmax), cmax), extF3D(extU3D(A101, cmax), cmax));
        S = min(extB3D(extD3D(A101, cmax), cmax), extB3D(extU3D(A101, cmax), cmax));
    else
        error(' d1Lift000max - sizes do not match ');
    end
else 
    error(' d1Lift000max - sizes do not match ');
end

A000=min(R, S);
%-----------------------------------------------------------------------------
