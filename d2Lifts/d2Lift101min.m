function A101 = d2Lift101min(A000, m101, l101, cmax)
%-----------------------------------------------------------------------------
%
% For each point of colour 101 this function assigns the minimum value at the
% neighbouring gridpoints of colour 000.
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com
%-----------------------------------------------------------------------------
[m000, n000, l000] = size(A000);

if l101 == l000 % n even
    if m101 == m000 % l even
        R = min(A000, extB3D(stripF3D(extD3D(stripU3D(A000), cmax)), cmax));
        S = min(stripU3D(extD3D(A000, cmax)), stripF3D(extB3D(A000, cmax)));
    elseif m101 == m000-1 % l odd
        R = min(stripD3D(A000), extB3D(stripF3D(stripU3D(A000)), cmax));
        S = min(stripU3D(A000), stripD3D(stripF3D(extB3D(A000, cmax))));
    else
        error(' d2Lift101max - sizes do not match ');
    end
elseif l101 == l000-1 % l odd
    if m101 == m000 % m even
        R = min(stripB3D(A000), stripF3D(extD3D(stripU3D(A000), cmax)));
        S = min(stripB3D(stripU3D(extD3D(A000, cmax))), stripF3D(A000));
    elseif m101 == m000-1 % l odd
        R = min(stripB3D(stripD3D(A000)), stripF3D(stripU3D(A000)));
        S = min(stripB3D(stripU3D(A000)), stripD3D(stripF3D(A000)));
    else
        error(' d2Lift101max - sizes do not match ');
    end
else 
    error(' d2Lift101max - sizes do not match ');
end

A101=min(R, S);
%-----------------------------------------------------------------------------
