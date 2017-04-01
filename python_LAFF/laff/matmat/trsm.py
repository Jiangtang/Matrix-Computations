from numpy import matrix
from numpy import shape
from numpy import transpose
from laff.matmat.trsm_llnn import trsm_llnn
from laff.matmat.trsm_llnu import trsm_llnu
from laff.matmat.trsm_lltn import trsm_lltn
from laff.matmat.trsm_lltu import trsm_lltu
from laff.matmat.trsm_lunn import trsm_lunn
from laff.matmat.trsm_lunu import trsm_lunu
from laff.matmat.trsm_lutn import trsm_lutn
from laff.matmat.trsm_lutu import trsm_lutu
from laff.matmat.trsm_rlnn import trsm_rlnn
from laff.matmat.trsm_rlnu import trsm_rlnu
from laff.matmat.trsm_rltn import trsm_rltn
from laff.matmat.trsm_rltu import trsm_rltu
from laff.matmat.trsm_runn import trsm_runn
from laff.matmat.trsm_runu import trsm_runu
from laff.matmat.trsm_rutn import trsm_rutn
from laff.matmat.trsm_rutu import trsm_rutu


def trsm(side, uplo, trans, diag, A, B ):
    """
    Solve one of the following:
        A   X = B    (side='Left',  trans='No transpose')
        A^T X = B    (side='Left',  trans='Transpose')
        X A   = B    (side='Right', trans='No transpose')
        X A^T = B    (side='Right', trans='Transpose')

    Parameter uplo indicates whether to use the lower triangular or
    upper triangular part of A:
    if uplo == 'Lower triangular':
       A is lower triangular
    elif upl == 'Upper triangular':
       A is upper trianglar

    Parameter diag indicates whether A has an (implicit) unit diagonal:
    if diag == 'Unit diagonal':
       A has an implicit unit diagonal
    elif diag == 'Nonunit diagonal':
       Use the entries on the diagonal of A

    """

    """
    Check parameters
    """
    assert (side == 'Left' or side == 'Right'), "laff.trsm: illegal value for side"

    assert (uplo == 'Lower triangular' or uplo == 'Upper triangular'), "laff.trsm: illegal value for uplo"

    assert (trans == 'No transpose' or trans == 'Transpose'), "laff.trsm: illegal value for trans"

    assert (diag == 'Nonunit diagonal' or diag == 'Unit diagonal'), "laff.trsm: illegal value for diag"

    assert type(A) is matrix and len(A.shape) is 2, \
           "laff.trsm: matrix A must be a 2D numpy.matrix"

    assert type(B) is matrix and len(B.shape) is 2, \
           "laff.trsm: matrix B must be a 2D numpy.matrix"

    """
    Extract sizes
    """
    m_A, n_A = A.shape
    m_B, n_B = B.shape

    if 'Left' == side:

        if 'Lower triangular' == uplo:

            if 'No transpose' == trans:

                if 'Nonunit diagonal' == diag:
                    trsm_llnn( A, B )
                else:
                    trsm_llnu( A, B )
            else:
                if 'Nonunit diagonal' == diag:
                    trsm_lltn( A, B )
                else:
                    trsm_lltu( A, B )

        else: #'Upper triangular' == uplo

            if 'No transpose' == trans:

                if 'Nonunit diagonal' == diag:
                    trsm_lunn( A, B )

                else:
                    trsm_lunu( A, B )

            else:

                if 'Nonunit diagonal' == diag:
                    trsm_lutn( A, B )
                else:
                    trsm_lutu( A, B )

    else: #'Right' == side

        if 'Lower triangular' == uplo:

            if 'No transpose' == trans:

                if 'Nonunit diagonal' == diag:
                    trsm_rlnn( A, B )
                else:
                    trsm_rlnu( A, B )
            else:
                if 'Nonunit diagonal' == diag:
                    trsm_rltn( A, B )
                else:
                    trsm_rltu( A, B )

        else: #'Upper triangular' == uplo

            if 'No transpose' == trans:

                if 'Nonunit diagonal' == diag:
                    trsm_runn( A, B )

                else:
                    trsm_runu( A, B )

            else:

                if 'Nonunit diagonal' == diag:
                    trsm_rutn( A, B )
                else:
                    trsm_rutu( A, B )
