%------------------------------------------------------------------------------
% Usage of 3D Morphological Wavelet Decomposition
%
% Original design and implementation in 2D by:
% Dr. Paul M. de Zeeuw 
% (c) 2002 Stichting CWI, Amsterdam
%
% Design and implementation in 3D
% (c) 2024 Dr. Tessa Nogatz, tessa.nogatz@gmail.com
%-----------------------------------------------------------------------------

%% Add all subfolders to Matlabs search path

addpath(genpath(pwd))

%% Load sample stack from matlab

load mristack.mat

%% Apply minmaxmin-Scheme
% Note that levels have to be multiples of 3, so d*3
% Size reduction per dimension is then 1/(2^d)

[C, S] = QLiftDec3MinMaxMin(mristack,6);

%% retrieve outermost decomposition

I_A000 = retrieveR3D(6, 'a', C, S);    
