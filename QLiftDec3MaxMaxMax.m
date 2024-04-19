function [C, S] = QLiftDec3MaxMaxMax(X, N)
%-----------------------------------------------------------------------------
% QLiftDec3MaxMaxMax
% Multilevel 3-D decomposition by the lifting scheme and using quincunx grids
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
%Firstly, check input data
%
if  isempty(X)
  error(' QLiftDec3MaxMax - empty matrix ');
else
  if mod(N, 3) == 1
    error(' QLiftDec3MaxMax - only a number of levels of multiples of 3 is accepted ');
  end
  %if QLmaxlev(size(X), 'maxmax') < N 
    %error(' QLiftDec3MaxMax - too many levels requested ');
  %end Check levels!
  if N < 2
    disp([' QLiftDec3MaxMax - WARNING too few levels requested ' ...
          '-> empty decomposition ']);
  end
end
%
%Secondly, start decomposition
%
O = X; % For the sake of efficient use of memory this could be improved upon.
% We descend to coarser grids, integer lev indicates number of scale.
C = []; S = [];

for lev=1:3:N
%
   [nO, mO, lO] = size(O);
   if ( nO < 4 ) || ( mO < 4) || ( lO < 4)
     error(' QLiftDec3MaxMax - too many levels ');
   end
   minO = min(O, [], 'all');
   maxO = max(O, [], 'all');
   cmin = minO-(maxO-minO);
%
%  The Lifting Scheme proceeds from a rectangular grid
%  towards a quincunx grid.
%
%  Level A: Horizontal / Vertical Lifting
%  Stage: predict
   A000 = getcolor000(O);
   A110 = getcolor110(O);
   A011 = getcolor011(O);
   A101 = getcolor101(O);
%  Quincunx grid QRED is the union of the values at .00 and .11: "even slots"
%  Quincunx grid QBLACK is the union of the values at .10 and .01: "odd slots"
   QBLACKD010 = getcolor010(O) - hvLift010max(A000, A110, A011, cmin);                % Y1
   QBLACKD100 = getcolor100(O) - hvLift100max(A110, A000, A101, cmin);                % Y1
   QBLACKD001 = getcolor001(O) - hvLift001max(A011, A000, A101, cmin);                % Y1
   QBLACKD111 = getcolor111(O) - hvLift111max(A101, A011, A110, cmin);                % Y1
%  
%  At this point the union (quincunx) of QBLACKD01 & QBLACKD10
%  contains the DETAILS of O.
%
%  For the inverse transform QBLACKD01 and QBLACKD10 have to be stored:
   [C, S] = storehvLiftDetail( QBLACKD010,QBLACKD100,QBLACKD001,QBLACKD111, lev, 'd', C, S);
%
%  Stage: update
   QREDA000 = A000 + ...
        max(zeros(size(A000),class(O)), hvLift000max(QBLACKD010, QBLACKD100, ...
        QBLACKD001, cmin));     % X1
   clear A000;
   QREDA110 = A110 + ...
        max(zeros(size(A110),class(O)), hvLift110max(QBLACKD100, QBLACKD010,...
        QBLACKD111, cmin));     % X1
   clear A110
   QREDA011 = A011 + ...
        max(zeros(size(A011),class(O)), hvLift011max(QBLACKD001, QBLACKD111,...
        QBLACKD010, cmin));     % X1
   clear A011;
   QREDA101 = A101 + ...
        max(zeros(size(A101),class(O)), hvLift101max(QBLACKD111, QBLACKD001,...
        QBLACKD100, cmin));     % X1
   clear A11 QBLACKD010 QBLACKD100 QBLACKD001 QBLACKD111;   
%  At this point the union (quincunx) of QREDA00 & QREDA11
%  contains the updated APPROXIMATION of O, the DETAILS of O
%  were in the union (quincunx) of QBLACKD01 & QBLACKD10 (see above).
%
%  The Lifting Scheme proceeds by a subsequent step from quincunx
%  to rectangular grid.
%
%  QRED is split into the 11 colour with the "odd slots" and 
%  the 00 colour with the "even slots".
%
%  Level: Diagonal Lifting I
%  Stage: predict
   DETAIL110 = QREDA110 - ...
       d1Lift110max(QREDA000, QREDA101, size(QREDA110, 2), cmin);        % Y2
   DETAIL011 = QREDA011 - ...
       d1Lift011max(QREDA000, QREDA101, size(QREDA011, 2), cmin);        % Y2
   clear QREDA110 QREDA011;
   
   [C, S] = stored1LiftDetail(DETAIL110, DETAIL011, lev+1, 'd', C, S);
%  Stage: update
   APPROX000 = QREDA000 + ...
     max(zeros(size(QREDA000),class(O)), ...
     d1Lift000max(DETAIL110, DETAIL011, size(QREDA000, 2), cmin));% X2
   APPROX101 = QREDA101 + ...
     max(zeros(size(QREDA101),class(O)), ...
     d1Lift101max(DETAIL110, DETAIL011, size(QREDA101, 2), cmin));% X2
%
%  DETAIL11 presents the detail gridfunction w.r.t. QRED
%  APPROX00 now represents the updated version of the approximation of QRED
%
%  For the inverse transform DETAIL11 has to be stored:
   clear QREDA000 QREDA011 DETAIL110 DETAIL011;     
% 
%  Level: Diagonal Lifting II
%  Stage: predict
   DETAIL101 =  APPROX101 - ...
       d2Lift101max(APPROX000, size(APPROX101, 1), size(APPROX101, 3), cmin);
   clear APPROX101;
   [C, S] = storeR3D(DETAIL101, lev+2, 'd', C, S);
   
%  Stage: update
   APPROX000 = APPROX000 + ...
       max(zeros(size(APPROX000),class(O)), ...
       d2Lift000max(DETAIL101, size(APPROX000, 1), size(APPROX000, 3),  cmin));
%  At this point gridfunction DETAIL11 containing the DETAILS has been stoBLACK,
%  gridfunction APPROX00 contains the updated APPROXIMATION, on the (down-
%  sampled) rectangular grid and has to be stoBLACK as well if at the highest
%  scale.
%  Note that APPROX00 is downsampled onto a rectangular grid with dimensions of 
%  half size of the original O.
   if lev+2 >= N
     [C, S] = storeR3D(APPROX000, lev+2, 'a', C, S);
%    It is obligatory that at least at one scale the Approximation has to be
%    stored or else the scheme cannot be inverted.
     clear APPROX000;
%    In the Lifting Scheme all scales have now been processed!
   else
%    We proceed to the next scale.
     O = APPROX000; clear APPROX000;
   end   
end
%-----------------------------------------------------------------------------
