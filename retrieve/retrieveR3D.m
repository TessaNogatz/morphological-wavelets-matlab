function F = retrieveR3D(level, o, H, L)
%------------------------------------------------------------------------------
%
% This function extracts a 3-dimensional gridfunction F from H.
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com
%------------------------------------------------------------------------------
if isempty(L)
  if ~isempty(H)
    disp([' retrieveR - ERROR at type ' o ' with level ' num2str(level)]);
    error(' retrieveR - books empty but heap is not ')
  else 
    F = [];
  end
else
  if isempty(H)
    disp([' retrieveR - ERROR at type ' o ' with level ' num2str(level)]);
    error(' retrieveR - books not empty but heap is ')
  else
    [nL, mL] = size(L);
    if mL ~= 7
      disp([' retrieveR - ERROR at type ' o ' level ' num2str(level)]);
      error(' retrieveR - books do not fit ')
    else   
      jL = -1;
      j = 1;
      foundit = 0;
      while j <= nL && ~foundit
         if L(j, 1) == level
           switch o
               case 'a' , if L(j, 3) == 0 && L(j, 2) == 0
                            jL = j;
                            foundit = 1;
                          end
               case 'd' , if L(j, 3) == 1 && L(j, 2) == 0 
                            jL = j;
                            foundit = 1;
                          end
               otherwise
               disp([' retrieveR - ERROR at type ' o ' level ' num2str(level)]);
               error(' retrieveR - unknown type of coefficients ')
           end         
         end
         j = j + 1;
      end
      if jL == -1
        disp([' retrieveR - ERROR at type ' o ' level ' num2str(level)]);
        error(' retrieveR - no such coefficients in heap')
      else
        nF = L(jL, 4);
        if nF < 1
          disp([' retrieveR - ERROR at type ' o ' level ' num2str(level)]);
          error(' retrieveR - unvalid 1st dimension of target')
        end
        mF = L(jL, 5);
        if mF < 1
          disp([' retrieveR - ERROR at type ' o ' level ' num2str(level)]);
          error(' retrieveR - unvalid 2nd dimension of target')
        end 
        lF = L(jL, 6);
        if lF < 1
          disp([' retrieveR - ERROR at type ' o ' level ' num2str(level)]);
          error(' retrieveR - unvalid 3rd dimension of target')
        end 
        heaptr = L(jL, 7);
        if heaptr < 2
          disp([' retrieveR - ERROR at type ' o ' level ' num2str(level)]);
          error(' retrieveR - bookkeeping error ')
        else
          [nH, mH] = size(H);
          if mH ~=1
            disp([' retrieveR - ERROR at type ' o ' level ' num2str(level)]);
            error(' retrieveR - heap should be column vector')
          else
            beginptr = heaptr-nF*mF*lF;
            if heaptr-1 > nH
              disp([' retrieveR - ERROR at type ' o ' level ' num2str(level)]);
              error(' retrieveR - heap not that large')
            elseif beginptr < 1
              disp([' retrieveR - ERROR at type ' o ' level ' num2str(level)]);
              error(' retrieveR - heap not that large, dimensions?')
            else
              F = reshape(H(beginptr:(heaptr-1)), nF, mF, lF);            
            end          
          end
        end             
      end            
    end
  end
end
%------------------------------------------------------------------------------

