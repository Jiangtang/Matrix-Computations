Warning: Function power has the same name as a MATLAB builtin. We suggest you rename the function to avoid a potential name conflict.
Warning: Function randperm has the same name as a MATLAB builtin. We suggest you rename the function to avoid a potential name conflict.
----------------------
            INTRODUCTION TO LINEAR ALGEBRA TOOLBOX
 
 This is a package of MATLAB programs to join with MATLAB itself in learning
 and experimenting with linear algebra. The toolbox is coordinated with the 
 text
 
          Introduction to Linear Algebra   by  Gilbert Strang  (1993)
          Wellesley-Cambridge Press   Box 812060   Wellesley MA 02181
 
 The last page of the book lists the Teaching Codes which are the backbone of
 this Toolbox. Many programs are printed in the book - this diskette makes
 it easy to use them.  Each code comes with a read-only help file.
 
 Each Teaching Code also has an "x file" to demonstrate how it can be used.
 You will see that the xamples and xperiments also lead to questions. 
 If necessary those can be called xercises. Their purpose is 
 entirely friendly - to suggest how to start using the codes.
 
 The email contact for this Toolbox is linalg@math.mit.edu  This address will 
 respond to math questions. You may also request an email copy of the Toolbox. 
 Linalg is NOT COMPETENT to help with installation or computer questions.
 For MATLAB itself all questions should be directed to support@mathworks.com
 For the Student Version, Prentice-Hall gives support via matlab@prenhall.com
 The Toolbox is not prepared by The MathWorks so it cannot provide support.
 
 This Toolbox is written to be used with MATLAB 3.5, 4.0, 4.1 and the Student
 Edition of MATLAB. [Some graphics commands are new in 4.0]  We mention the
 new SYMBOLIC MATH TOOLBOX based on Maple V which allows symbolic expressions
 instead of numbers. The command d = determ(A - x*I) gives a polynomial in x. 
 There is also variable precision arithmetic beyond the 16 digits in MATLAB.
 
 Now we list the programs in this Toolbox. They are in three groups:
 
   (1)  Teaching Codes, each with help.
   (2)  An explanatory "x" code for each of the Teaching Codes.
   (3)  A growing collection of extra programs to illustrate linear algebra.
 
 The Teaching Codes are:
 
   BASIS       EIGEN2        LSQ         PROJMAT         SLU
   COFACTOR    FINDPIV       NULL        RANDPERM        SLV
   CRAMER      GRAMS         PERMDET     RATS            SOLVE
   DETERM      INVERSE       PLOT2D      REF             SPLU
   EIGEN       LINEFIT       PLU         SIGNPERM        SPLV
 
 The extra programs include:
 
    ADDVEC    EXPAGE35   HAND       FOURIER    POLY2STR   SIXPACK
    ATIMESV   EXPAGE36   HOUSE      LINPROG    POWER      ZEROONE
    COSINE    EXPOWER    FASTFOUR   MOVIES                
   
 For a quick explanation of one of the Teaching Codes, for example basis, type
    help basis
 
 To see some examples and exercises involving BASIS, type
    xbasis
 
 To see the actual MATLAB code, type
    type basis
 
 To apply the function to a matrix A, type
    basis(A)
 
 Here is an index, showing the relevant section and page in the text
 for each code.

  Section  Page
     1.1     2    ADDVEC     Graph: Addition of 2 two-dimensional vector
     1.1     2    ATIMESV    Graph, interactive: two-dimensional scalar vector product
     1.2    16    COSINE     (failed in Notebook)
     1.4    35    EXPAGE35   Exercise 30 starting on page 35, Markov matrix
     1.4    36    EXPAGE36   page 36 exercise 32
     2.3    56    SIXPACK    matrix multiplication
     2.4    71    MOVIES     Matlab rrefmovie depreciated (see offline copy)
     2.4    72    INVERSE    computes the inverse of  A by computing the reduced echelon form, R, after A is augmented by the identity matrix.
     2.4    72    ZEROONE    creates matrices with 0's and 1's at random
     2.5    83    SLU        [L,U] = SLU(A) ,Gaussian elimination , Simple, square, LU factorization
     2.5    83    SLV         x = SLV(A,b), Simple linear equation solver, using SLU
     2.6    96    SPLU       [P,L,U] = SPLU(A), Square LU factorization with row exchanges, for a square, invertible matrix A
     2.6    97    SPLV       x = SPLV(A,b), the solution to a square, invertible system, using SPLU
     3.2   118    FINDPIV     Used by PLU
     3.2   119    PLU        [P,L,U] = PLU(A), for a rectangular matrix A, uses Gaussian elimination,U is the same size as A.  P and L are square, with as many rows as A.
     3.2   119    REF        R = ref(A) uses the pivoting LU factorization computed by PLU
     3.2   120    NULL       N = NULL(A) uses the pivoting LU factorization computed by	PLU and the resulting reduced row echelon form computed by REF
     3.3   128    SOLVE      x = SOLVE(A,b) uses the pivoting LU factorization computed by PLU to find a particular solution 
     3.4   143    BASIS      B = BASIS(A) uses the pivot indices found by PLU(A) to pick out a basis for the column space of A.
     4.2   172    PROJMAT    P = projmat(A) is the symmetric, square matrix that projects any vector onto the column space of A.
     4.3   179    LINEFIT    LINEFIT(t,b), Plot the least squares fit by a line
     4.3   179    LSQ        [xbar,p,e] = lsq(A,b), using x = solve(A,b)
     4.4   194    GRAMS      [Q,R] = grams(A), Gram-Schmidt orthogonalization
     5.1   201    DETERM      det = determ(A), using splu to get determinant
     5.2   214    PERMDET     s = permdet(p), Determinant of a permutation.
     5.2   214    RANDPERM    p = randperm(n),Random permutation.
     5.2   214    SIGNPERM    s = signperm(p),Sign of a permutation.
     5.2   216    COFACTOR    C = cofactor(A,i,j),returns the cofactor of row i, column j.; COFACTOR(A) returns the matrix C of cofactors
     5.3   223    CRAMER      x = cramer(A,b), solves the square system A*x = b
     6.1   237    EIGEN       eigen(A): prints the eigenvalues and eigenvectors of an n by n matrix. If A is not diagonalizable, its single eigenvector is printed twice.
     6.1   237    EIGEN2      EIGEN2(A): prints the eigenvalues and eigenvectors of a 2 by 2 matrix
     6.1   237    POLY2STR    ? Convert a polynomial coefficient vector to a strin
     7.1   306    HAND         "Hand" data set for use with plot2d
     7.1   306    HOUSE        "House" data set: xplot2d
     7.1   309    PLOT2D       Two dimensional plot
     8.3   357    LINPROG      [x,f,itn] = linprog(A,b,c,k,maxit,tol): solve the linear programming problem
     9.3   395    EXPOWER       demonstrates the power method of finding the dominant eigenvalue
     9.3   395    POWER         Execute the power method on a 2 by 2 matrix A
    10.2   415    FOURIER       Fourier matrix.
    10.3   421    FASTFOUR      Fast Fourier Transform


% Teaching Codes
%   basis      - Basis for the column space.
%   cofactor   - Cofactors and the cofactor matrix.
%   cramer     - Solve a linear system by Cramer's Rule.
%   determ     - Matrix determinant from the pivots in PA = LU.
%   eigen      - Describe the eigenvalues and eigenvectors.
%   eigen2     - Two by two eigenvalues and eigenvectors.
%   findpiv    - Used by PLU to find pivots for elimination.
%   grams      - Orthonormal vectors from Gram-Schmidt.
%   inverse    - Matrix inverse by Gauss-Jordan elimination.
%   linefit    - Plot the least squares fit by a line.
%   lsq        - Compute the least squares solution to Ax = b.
%   null       - Nullspace matrix: n - r solutions to Ax = 0
%   permdet    - Determinant of a permutation.
%   plot2d     - Show linear transformations of the plane.
%   plu        - PA = LU for any A, with row exchanges in P.
%   projmat    - Projection matrix onto the column space.
%   randperm   - Random permutation.
%   rats       - Convert to nearby rational numbers.
%   ref        - Reduced echelon form R from elimination on [A I]
%   signperm   - Sign of a permutation: 1 or -1 for even or odd.
%   slu        - Square LU factorization but no row exchanges.
%   slv        - Solve square Ax = b using L and U from SLU.
%   solve      - Particular solution to consistent Ax = b.
%   splu       - PA = LU factorization of square invertible A.
%   splv       - Unique solution to Ax = b using SPLU.
%
% Each teaching code has a companion explanatory "x" code.
%
% Extra codes, examples and exercises.
%   addvec     - Two-dimensional plot of vector addition
%   atimesv    - Number times vector in 2D: elementary graphics
%   cosine     - Graphical display of u and v and the cosine formula
%   expage35   - MATLAB tutorial for Markov exercise 30, page 35
%   expage36   - Interactive plot for Markov exercise 32, page 36
%   expower    - Successes and failures of the power method
%   hand       - Coordinates that give the outline of a hand
%   house      - House matrix from 7.1 in the book: Transformations by A
%   fastfour   - Fourier matrix times vector: by FFT if n = 2^k
%   fourier    - The Fourier matrix diagonalizes every circulant matrix
%   linprog    - Minimize cost in linear programming
%   movies     - Note on ratmovie and rrefmovie for reduced echelon form R
%   poly2str   - Convert a polynomial coefficient vector to a string
%   power      - Power method to find the largest eigenvalue (2 by 2)
%   sixpack    - Six ways to multiply AB: Permute "for i" "for j" "for k"
%   zeroone    - Probability that a 0-1 matrix is singular: Experiment

    
 A good, quick introduction to MATLAB is provided by a 25-page tutorial,
    The MATLAB Primer, by Kermit Sigmon.
 This is available by anonymous ftp from
    math.ufl.edu   directory: pub/matlab  file: primer35.tex
 and also from
    ftp.mathworks.com   directory: pub/doc/Primer  file: primer35.tex
 The Primer can be distributed via a local copy center. The ftp file is
 plain TEX.  For PostScript change the file name to primer.ps  There is
 also a Spanish edition.  If you cannot obtain a copy from these sources
 you  may contact the author:
     Prof. Kermit Sigmon   Mathematics Department   University of Florida
     sigmon@math.ufl.edu                            Gainesville FL 32611
 
 Suggestions for the Toolbox can be directed to linalg@math.mit.edu
 The email address to request this Toolbox is   info@mathworks.com
