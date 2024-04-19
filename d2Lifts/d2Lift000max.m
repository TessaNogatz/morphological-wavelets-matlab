function A000 = d2Lift000max(A101, m000, l000, cmin)
%-----------------------------------------------------------------------------
%
% For each point of colour 000 this function assigns the maximum value at the
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
        R = max(extF3D(stripB3D(A101), cmin), extF3D(stripB3D(extU3D(stripD3D(A101), cmin)), cmin));
        S = max(A101, stripD3D(extU3D(A101, cmin)));
    elseif m000 == m101+1 % m odd
        R = max(extF3D(stripB3D(extD3D(A101, cmin)), cmin), extF3D(stripB3D(extU3D(A101, cmin)), cmin));
        S = max(extD3D(A101, cmin), extU3D(A101, cmin));
    else
        error(' d1Lift000max - sizes do not match ');
    end
elseif l000 == l101+1 % n odd
    if m000 == m101 % m even
        R = max(extB3D(A101, cmin), extF3D(extU3D(stripD3D(A101), cmin), cmin));
        S = max(extB3D(A101, cmin), extB3D(stripD3D(extU3D(A101, cmin)), cmin));
    elseif m000 == m101+1 % m odd
        R = max(extB3D(extD3D(A101, cmin), cmin), extF3D(extU3D(A101, cmin), cmin));
        S = max(extB3D(extD3D(A101, cmin), cmin), extB3D(extU3D(A101, cmin), cmin));
    else
        error(' d1Lift000max - sizes do not match ');
    end
else 
    error(' d1Lift000max - sizes do not match ');
end


A000=max(R, S);
%-----------------------------------------------------------------------------
