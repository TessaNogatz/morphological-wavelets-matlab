function P = putcolor001(A001, sizeP)
%------------------------------------------------------------------------------
% Set submatrix 001
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com
%------------------------------------------------------------------------------
[m, n, l] = size(A001);
if nargin == 2
  mP = sizeP(1);
  nP = sizeP(2);
  lP = sizeP(3);
  if mP < 2*m-1
    error(' putcolor001 - 1st dimension of P too small ')
  end
  if nP < 2*n-1
    error(' putcolor001 - 2nd dimension of P too small ')
  end
  if lP < 2*l-1
    error(' putcolor001 - 3rd dimension of P too small ')
  end
elseif nargin == 1
  mP = 2*m-1;
  nP = 2*n-1;
  lP = 2*l-1;
else
  error(' putcolor001 - wrong number of arguments ')
end
P = zeros([mP, nP, lP],class(A001));
P(1:2:mP, 1:2:nP, 2:2:lP)=A001;
%------------------------------------------------------------------------------
