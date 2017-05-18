import numpy as np

def matmat_scalar(A, B, order = "ijk"):
  assert type(A) == np.ndarray and type(B) == np.ndarray
  m, r = A.shape
  r2, n = B.shape
  assert r == r2 , \
  "the # of columns of matrix A is not equal the # of rows of matrix B"

  C = np.zeros((m, n))

  if order == "ijk":
    for i in range(m):
      for j in range(n):
        for k in range(r):
          C[i][j] += A[i][k] * B[k][j]

  elif order == "jik":
    for j in range(n):
      for i in range(m):
        for k in range(r):
          C[i][j] += A[i][k] * B[k][j]


  elif order == "ikj":
    for i in range(m):
      for k in range(r):
        for j in range(n):
          C[i][j] += A[i][k] * B[k][j]

  elif order == "jki":
    for j in range(n):
      for k in range(r):
        for i in range(m):
          C[i][j] += A[i][k] * B[k][j]

  elif order == "kij":
    for k in range(r):
      for i in range(m):
        for j in range(n):
          C[i][j] += A[i][k] * B[k][j]

  elif order == "kji":
    for k in range(r):
      for j in range(n):
        for i in range(m):
          C[i][j] += A[i][k] * B[k][j]

  else:
    except ValueError:
      print("order only excepts to take values of permutation of ijk")


  return C








