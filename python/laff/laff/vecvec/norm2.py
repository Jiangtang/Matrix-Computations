from laff.vecvec.dot import dot
from laff.vecvec.scal import scal
from laff.vecvec.copy import copy
from numpy import matrix
from numpy import shape
from numpy import zeros
from math import sqrt

def norm2( x ):

	"""
    Compute the 2-norm of a vector, returning alpha

    x can be a row or column vector.
    """
	assert type(x) is matrix and len(x.shape) is 2, \
		"laff.norm2: vector x must be a 2D numpy.matrix"

	m, n = shape(x)
	assert m is 1 or n is 1, \
		"laff.norm2: x is not a vector"

	#Ensure that we don't modify x in
	#any way by copying it to a new vector, y
	y = matrix( zeros( (m,n) ) )
	copy( x, y )

	#Initialize variables that we will use to appropriate values
	alpha = 0
	maxval = y[ 0, 0 ]

	if m is 1: #y is a row
		#Find a value to scale by to avoid under/overflow
		for i in range(n):
			if abs(y[ 0, i ]) > maxval:
				maxval = abs(y[ 0, i ])

	elif n is 1: #y is a column
		#Find a value to scale by to avoid under/overflow
		for i in range(m):
			if abs(y[ i, 0 ]) > maxval:
				maxval = abs(y[ i, 0 ])

	#If y is the zero vector, return 0
	if abs(maxval) < 1e-7:
		return 0

	#Scale all of the values by 1/maxval to prevent under/overflow
	scal( 1.0/maxval, y )

	alpha = maxval * sqrt( dot( y, y ) )

	return alpha
