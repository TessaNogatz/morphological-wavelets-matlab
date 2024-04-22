# morphological-wavelets-matlab

Calculate 3D morphological wavelet transform

### Usage

First add all subfolders to the Matlab search path. From download/clone root folder, call 
```matlab
addpath(genpath(pwd))
```

Then, call the morphological wavelet transform with image name and number of levels (must be a multiple of 3, here e.g. 6)
```matlab
[C, S] = QLiftDec3MinMaxMin(image,6);
```

To view the outermost decomposition image, call
```matlab
I_A000 = retrieveR3D(6, 'a', C, S);
sliceViewer(I_A000);  
```




### License

This code is distributed under BSD-2-Clause license. If you want to use the morphological wavelet transform in 3D in a scientific context, please cite
<ul>
  <li> de Zeeuw, P. M. (2002). A toolbox for the lifting scheme on quincunx grids (lisq). Report-Probability, networks and algorithms, (24), 1-23.</li>
  <li> Nogatz, T., Redenbach, C., & Schladitz, K. (2023). MorphFlow: Estimating Motion in In Situ Tests of Concrete. arXiv preprint arXiv:2310.11109. </li>
</ul>
