#include <stdio.h>
#include "hocdec.h"
#define IMPORT extern __declspec(dllimport)
IMPORT int nrnmpi_myid, nrn_nobanner_;

extern void _A_current_reg();
extern void _leak_reg();
extern void _na_current_reg();
extern void _p_current_reg();
extern void _s_current_reg();

modl_reg(){
	//nrn_mswindll_stdio(stdin, stdout, stderr);
    if (!nrn_nobanner_) if (nrnmpi_myid < 1) {
	fprintf(stderr, "Additional mechanisms from files\n");

fprintf(stderr," A_current.mod");
fprintf(stderr," leak.mod");
fprintf(stderr," na_current.mod");
fprintf(stderr," p_current.mod");
fprintf(stderr," s_current.mod");
fprintf(stderr, "\n");
    }
_A_current_reg();
_leak_reg();
_na_current_reg();
_p_current_reg();
_s_current_reg();
}
