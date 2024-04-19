function X = QLiftRec3MinMaxMin(C, S)
%-----------------------------------------------------------------------------
% QLiftRec3MinMaxMin
% Multilevel 3-D reconstruction by the lifting scheme and using quincunx grids
%
% The MaxMin scheme has been proposed by Heijmans and Goutsias, see e.g.
%    H.J.A.M. Heijmans, J. Goutsias,
%    Multiresolution signal decomposition schemes.
%    Part 2: morphological wavelets.
%    CWI Report PNA-R9905, Amsterdam, 1999.
%    http://repository.cwi.nl:8888/cwi_repository/docs/IV/04/04625D.pdf
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com
%-----------------------------------------------------------------------------
% Note: argument list of this function might be extended with an argument that
%       points to another level than 1, nargin could be checked for this.
% Firstly, check input data
%
if isempty(C)
  error(' QLiftRec3MaxMax - empty decomposition ');
else
  if isempty(S)
    error(' QLiftRec3MaxMax - empty bookkeeping ');
  end
end
%
N = numoflevs3D(S); 
if mod(N, 3) == 1
  error(' QLiftRec3MaxMax - only an even number of levels is accepted ');
end
%
%Secondly, start reconstruction
%
for lev=N:-3:1
%
%  The Inverse Scheme proceeds from rectangular grid to quincunx grid.
   if lev >= N
     A000 = retrieveR3D(lev, 'a', C, S);     % "even slots"
   end
   tp = class(A000);
   D101 = retrieveR3D(lev, 'd', C, S);       % "odd slots"
   minO = min(min(A000, [], 'all'), min(D101, [], 'all'));
   maxO = max(max(A000, [], 'all'), max(D101, [], 'all'));
   cmin = minO-(maxO-minO);
   cmax = maxO+(maxO-minO);
%
%  Level: Diagonal Lift II
%  Stage: reverse update 3
   sizeA000 = size(A000);
   A000 = A000 - min(zeros(sizeA000,tp),...
    d2Lift000min(D101, size(A000, 1), size(A000, 3), cmax));
   clear sizeA00;      
%
%  Stage: reverse predict 3
   A101 = D101 + ...
    d2Lift101min(A000, size(D101, 1), size(D101, 3), cmax);
%     
%  Merge
%  The union Q0011 of Q0011A00 & Q0011A11 now contains the approximation on 
%  the next scale (with index lev-1).
%
%  The Inverse Scheme proceeds from quincunx grid to rectangular grid.
%
%  The "even slots" are in the colours 00 and 11,
%  the "odd slots"  are in the colours 10 and 01.
%
%  Level: Diagonal Lift I
%  Stage: reverse update 2
   [D110, D011] = retrieved1Lift(lev-1, 'd', C, S);
   A000 = A000 - ...
         max(zeros(size(A000),tp), d1Lift000max(D110, D011, size(A000, 2), cmin));
   A101 = A101 - ...
         max(zeros(size(A101),tp), d1Lift101max(D110, D011, size(A101, 2), cmin));
% A000, A101
%  Stage: reverse predict 2 
   A110 = D110 + d1Lift110max(A000, A101, size(D110, 2), cmin);
   A011 = D011 + d1Lift011max(A000, A101, size(D011, 2) ,cmin);
   clear D110 D011;
%  
%  Level: Horizontal / Vertical Lift
%  Stage: reverse update 1
   [D010, D100, D001, D111] = retrievehvLift(lev-2, 'd', C, S);
   A000 = A000 - min(zeros(size(A000),tp),...
        hvLift000min(D010, D100, D001, cmax));     % X1
   A110 = A110 - min(zeros(size(A110),tp), ...
        hvLift110min(D100, D010, D111, cmax));     % X1
   A011 = A011 - min(zeros(size(A011),tp), ...
        hvLift011min(D001, D111, D010, cmax));     % X1
   A101 = A101 - min(zeros(size(A101),tp), ...
        hvLift101min(D111, D001, D100, cmax));     % X1
   
%
%  Stage: reverse predict 1 
   A010 = D010 + hvLift010min(A000, A110, A011, cmax);                % Y1
   A100 = D100 + hvLift100min(A110, A000, A101, cmax);                % Y1
   A001 = D001 + hvLift001min(A011, A000, A101, cmax);                % Y1
   A111 = D111 + hvLift111min(A101, A011, A110, cmax);
   clear D010 D100 D001 D111;
   
   %sizeR = size(A000) + size(A110) + size(A011) + size(A101) + ...
   %       size(A010) + size(A100) + size(A001) + size(A111);
   sizeR = size(A000) + size(A111);
%  Merge
   A000 = putcolor000(A000, sizeR) + putcolor101(A101, sizeR) + ...
          putcolor110(A110, sizeR) + putcolor011(A011, sizeR) + ...
          putcolor010(A010, sizeR) + putcolor100(A100, sizeR) + ...
          putcolor001(A001, sizeR) + putcolor111(A111, sizeR);
%  APPROX00 is used in the next iteration of the "for"-loop!
   clear A110 A011 A101 A010 A100 A001 A111;
%   
%  Warning: not yet verified whether sizeQ and sizeR will be consistent for all
%           possible griddimensions of original image. 
%
   if (lev-2) == 1
     X = A000; clear APPROX00;
   end
end
%-----------------------------------------------------------------------------
