#ifndef __MY_CPU__
#define __MY_CPU__

typedef unsigned int u32;
//----------------------
// Read c0
//----------------------
volatile unsigned int read_MIDR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c0, c0, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_CTR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c0, c0, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_TCMTR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c0, c0, 2" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_TLBTR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c0, c0, 3" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_MPIDR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c0, c0, 5" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_REVIDR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c0, c0, 6" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ID_PFR0(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c0, c1, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ID_PFR1(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c0, c1, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ID_DFR0(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c0, c1, 2" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ID_AFR0(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c0, c1, 3" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ID_MMFR0(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c0, c1, 4" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ID_MMFR1(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c0, c1, 5" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ID_MMFR2(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c0, c1, 6" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ID_MMFR3(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c0, c1, 7" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ID_ISAR0(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c0, c2, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ID_ISAR1(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c0, c2, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ID_ISAR2(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c0, c2, 2" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ID_ISAR3(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c0, c2, 3" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ID_ISAR4(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c0, c2, 4" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ID_ISAR5(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c0, c2, 5" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_CCSIDR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 1, %[rdata], c0, c0, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_CLIDR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 1, %[rdata], c0, c0, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_AIDR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 1, %[rdata], c0, c0, 7" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_CSSELR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 2, %[rdata], c0, c0, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_VPIDR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c0, c0, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_VMPIDR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c0, c0, 5" : [rdata] "=r" (rdata) :);
	return rdata;
}

//----------------------
// Write {sheet}
//----------------------
volatile unsigned int write_MIDR(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c0, c0, 0" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_CTR(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c0, c0, 1" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_TCMTR(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c0, c0, 2" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_TLBTR(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c0, c0, 3" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_MPIDR(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c0, c0, 5" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_REVIDR(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c0, c0, 6" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ID_PFR0(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c0, c1, 0" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ID_PFR1(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c0, c1, 1" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ID_DFR0(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c0, c1, 2" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ID_AFR0(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c0, c1, 3" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ID_MMFR0(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c0, c1, 4" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ID_MMFR1(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c0, c1, 5" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ID_MMFR2(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c0, c1, 6" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ID_MMFR3(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c0, c1, 7" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ID_ISAR0(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c0, c2, 0" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ID_ISAR1(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c0, c2, 1" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ID_ISAR2(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c0, c2, 2" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ID_ISAR3(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c0, c2, 3" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ID_ISAR4(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c0, c2, 4" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ID_ISAR5(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c0, c2, 5" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_CCSIDR(unsigned int wdata){
	asm volatile ("MCR p15, 1, %[wdata], c0, c0, 0" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_CLIDR(unsigned int wdata){
	asm volatile ("MCR p15, 1, %[wdata], c0, c0, 1" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_AIDR(unsigned int wdata){
	asm volatile ("MCR p15, 1, %[wdata], c0, c0, 7" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_CSSELR(unsigned int wdata){
	asm volatile ("MCR p15, 2, %[wdata], c0, c0, 0" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_VPIDR(unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c0, c0, 0" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_VMPIDR(unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c0, c0, 5" :  :[wdata] "r" (wdata));
	return 0;
}

//----------------------
// Read c1
//----------------------
volatile unsigned int read_SCTLR (void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c1, c0, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ACTLR (void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c1, c0, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_CPACR (void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c1, c0, 2" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_SCR (void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c1, c1, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_SDER (void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c1, c1, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_NSACR (void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c1, c1, 2" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_SDCR (void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c1, c3, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_HSCTLR (void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c1, c0, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_HACTLR (void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c1, c0, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_HCR (void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c1, c1, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_HDCR (void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c1, c1, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_HCPTR (void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c1, c1, 2" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_HSTR (void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c1, c1, 3" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_HCR2(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c1, c1, 4" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_HACR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c1, c1, 7" : [rdata] "=r" (rdata) :);
	return rdata;
}

//----------------------
// Write {sheet}
//----------------------
volatile unsigned int write_SCTLR (unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c1, c0, 0" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ACTLR (unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c1, c0, 1" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_CPACR (unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c1, c0, 2" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_SCR (unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c1, c1, 0" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_SDER (unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c1, c1, 1" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_NSACR (unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c1, c1, 2" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_SDCR (unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c1, c3, 1" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_HSCTLR (unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c1, c0, 0" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_HACTLR (unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c1, c0, 1" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_HCR (unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c1, c1, 0" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_HDCR (unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c1, c1, 1" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_HCPTR (unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c1, c1, 2" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_HSTR (unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c1, c1, 3" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_HCR2(unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c1, c1, 4" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_HACR(unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c1, c1, 7" :  :[wdata] "r" (wdata));
	return 0;
}

//----------------------
// Read c2
//----------------------
volatile unsigned int read_TTBR0(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c2, c0, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_TTBR1(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c2, c0, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_TTBCR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c2, c0, 2" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_HTCR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c2, c0, 2" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_VTCR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c2, c1, 2" : [rdata] "=r" (rdata) :);
	return rdata;
}

//----------------------
// Write {sheet}
//----------------------
volatile unsigned int write_TTBR0(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c2, c0, 0" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_TTBR1(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c2, c0, 1" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_TTBCR(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c2, c0, 2" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_HTCR(unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c2, c0, 2" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_VTCR(unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c2, c1, 2" :  :[wdata] "r" (wdata));
	return 0;
}

//----------------------
// Read c3
//----------------------
volatile unsigned int read_DACR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c3, c0, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

//----------------------
// Write {sheet}
//----------------------
volatile unsigned int write_DACR(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c3, c0, 0" :  :[wdata] "r" (wdata));
	return 0;
}

//----------------------
// Read c4
//----------------------
volatile unsigned int read_ICC_PMR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c4, c6, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

//----------------------
// Write {sheet}
//----------------------
volatile unsigned int write_ICC_PMR(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c4, c6, 0" :  :[wdata] "r" (wdata));
	return 0;
}

//----------------------
// Read c5
//----------------------
volatile unsigned int read_DFSR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c5, c0, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_IFSR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c5, c0, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ADFSR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c5, c1, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_AIFSR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c5, c1, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_HADFSR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c5, c1, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_HAIFSR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c5, c1, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_HSR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c5, c2, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

//----------------------
// Write {sheet}
//----------------------
volatile unsigned int write_DFSR(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c5, c0, 0" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_IFSR(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c5, c0, 1" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ADFSR(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c5, c1, 0" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_AIFSR(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c5, c1, 1" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_HADFSR(unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c5, c1, 0" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_HAIFSR(unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c5, c1, 1" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_HSR(unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c5, c2, 0" :  :[wdata] "r" (wdata));
	return 0;
}

//----------------------
// Read c6
//----------------------
volatile unsigned int read_DFAR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c6, c0, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_IFAR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c6, c0, 2" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_HDFAR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c6, c0, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_HIFAR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c6, c0, 2" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_HPFAR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c6, c0, 4" : [rdata] "=r" (rdata) :);
	return rdata;
}

//----------------------
// Write {sheet}
//----------------------
volatile unsigned int write_DFAR(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c6, c0, 0" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_IFAR(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c6, c0, 2" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_HDFAR(unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c6, c0, 0" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_HIFAR(unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c6, c0, 2" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_HPFAR(unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c6, c0, 4" :  :[wdata] "r" (wdata));
	return 0;
}

//----------------------
// Read c7
//----------------------
volatile unsigned int read_PAR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c7, c4, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ICIALLUIS (void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c7, c1, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_BPIALLIS(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c7, c1, 6" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_CFPRCTX(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c7, c3, 4" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_DVPRCTX(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c7, c3, 5" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_CPPRCTX(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c7, c3, 7" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ICIALLU(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c7, c5, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ICIMVAU(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c7, c5, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_CP15ISB(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c7, c5, 4" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_BPIALL(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c7, c5, 6" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_BPIMVA(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c7, c5, 7" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_DCIMVAC(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c7, c6, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_DCISW(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c7, c6, 2" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ATS1CPR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c7, c8, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ATS1CPW(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c7, c8, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ATS1CUR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c7, c8, 2" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ATS1CUW(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c7, c8, 3" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ATS12NSOPR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c7, c8, 4" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ATS12NSOPW(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c7, c8, 5" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ATS12NSOUR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c7, c8, 6" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ATS12NSOUW(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c7, c8, 7" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_DCCMVAC(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c7, c10, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_DCCSW(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c7, c10, 2" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_CP15DSB(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c7, c10, 4" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_CP15DMB(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c7, c10, 5" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_DCCMVAU (void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c7, c11, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_DCCIMVAC (void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c7, c14, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_DCCISW (void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c7, c14, 2" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ATS1HRc (void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c7, c8, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ATS1HWc (void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c7, c8, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

//----------------------
// Write {sheet}
//----------------------
volatile unsigned int write_PAR(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c7, c4, 0" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ICIALLUIS (unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c7, c1, 0" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_BPIALLIS(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c7, c1, 6" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_CFPRCTX(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c7, c3, 4" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_DVPRCTX(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c7, c3, 5" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_CPPRCTX(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c7, c3, 7" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ICIALLU(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c7, c5, 0" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ICIMVAU(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c7, c5, 1" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_CP15ISB(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c7, c5, 4" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_BPIALL(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c7, c5, 6" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_BPIMVA(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c7, c5, 7" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_DCIMVAC(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c7, c6, 1" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_DCISW(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c7, c6, 2" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ATS1CPR(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c7, c8, 0" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ATS1CPW(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c7, c8, 1" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ATS1CUR(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c7, c8, 2" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ATS1CUW(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c7, c8, 3" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ATS12NSOPR(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c7, c8, 4" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ATS12NSOPW(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c7, c8, 5" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ATS12NSOUR(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c7, c8, 6" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ATS12NSOUW(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c7, c8, 7" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_DCCMVAC(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c7, c10, 1" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_DCCSW(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c7, c10, 2" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_CP15DSB(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c7, c10, 4" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_CP15DMB(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c7, c10, 5" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_DCCMVAU (unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c7, c11, 1" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_DCCIMVAC (unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c7, c14, 1" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_DCCISW (unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c7, c14, 2" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ATS1HRc (unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c7, c8, 0" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ATS1HWc (unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c7, c8, 1" :  :[wdata] "r" (wdata));
	return 0;
}

//----------------------
// Read c8
//----------------------
volatile unsigned int read_TLBIALLIS(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c8, c3, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_TLBIMVAIS(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c8, c3, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_TLBIASIDIS(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c8, c3, 2" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_TLBIMVAAIS(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c8, c3, 3" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_TLBIMVALIS(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c8, c3, 5" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_TLBIMVAALIS(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c8, c3, 7" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ITLBIALL(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c8, c5, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ITLBIMVA(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c8, c5, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_ITLBIASID(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c8, c5, 2" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_DTLBIALL(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c8, c6, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_DTLBIMVA(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c8, c6, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_DTLBIASID(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c8, c6, 2" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_TLBIALL(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c8, c7, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_TLBIMVA(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c8, c7, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_TLBIASID(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c8, c7, 2" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_TLBIMVAA(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c8, c7, 3" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_TLBIMVAL(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c8, c7, 5" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_TLBIMVAAL(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c8, c7, 7" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_TLBIIPAS2IS(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c8, c0, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_TLBIIPAS2LIS(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c8, c0, 5" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_TLBIALLHIS(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c8, c3, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_TLBIMVAHIS(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c8, c3, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_TLBIALLNSNHIS(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c8, c3, 4" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_TLBIMVALHIS(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c8, c3, 5" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_TLBIIPAS2(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c8, c4, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_TLBIIPAS2L(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c8, c4, 5" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_TLBIALLH(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c8, c7, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_TLBIMVAH(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c8, c7, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_TLBIALLNSNH(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c8, c7, 4" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_TLBIMVALH(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 4, %[rdata], c8, c7, 5" : [rdata] "=r" (rdata) :);
	return rdata;
}

//----------------------
// Write {sheet}
//----------------------
volatile unsigned int write_TLBIALLIS(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c8, c3, 0" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_TLBIMVAIS(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c8, c3, 1" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_TLBIASIDIS(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c8, c3, 2" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_TLBIMVAAIS(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c8, c3, 3" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_TLBIMVALIS(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c8, c3, 5" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_TLBIMVAALIS(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c8, c3, 7" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ITLBIALL(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c8, c5, 0" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ITLBIMVA(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c8, c5, 1" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_ITLBIASID(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c8, c5, 2" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_DTLBIALL(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c8, c6, 0" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_DTLBIMVA(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c8, c6, 1" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_DTLBIASID(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c8, c6, 2" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_TLBIALL(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c8, c7, 0" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_TLBIMVA(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c8, c7, 1" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_TLBIASID(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c8, c7, 2" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_TLBIMVAA(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c8, c7, 3" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_TLBIMVAL(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c8, c7, 5" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_TLBIMVAAL(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c8, c7, 7" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_TLBIIPAS2IS(unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c8, c0, 1" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_TLBIIPAS2LIS(unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c8, c0, 5" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_TLBIALLHIS(unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c8, c3, 0" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_TLBIMVAHIS(unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c8, c3, 1" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_TLBIALLNSNHIS(unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c8, c3, 4" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_TLBIMVALHIS(unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c8, c3, 5" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_TLBIIPAS2(unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c8, c4, 1" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_TLBIIPAS2L(unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c8, c4, 5" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_TLBIALLH(unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c8, c7, 0" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_TLBIMVAH(unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c8, c7, 1" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_TLBIALLNSNH(unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c8, c7, 4" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_TLBIMVALH(unsigned int wdata){
	asm volatile ("MCR p15, 4, %[wdata], c8, c7, 5" :  :[wdata] "r" (wdata));
	return 0;
}

//----------------------
// Read c9
//----------------------
volatile unsigned int read_PMCR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c9, c12, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_PMCNTENSET(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c9, c12, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_PMCNTENCLR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c9, c12, 2" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_PMOVSR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c9, c12, 3" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_PMSWINC(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c9, c12, 4" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_PMSELR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c9, c12, 5" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_PMCEID0(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c9, c12, 6" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_PMCEID1(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c9, c12, 7" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_PMCCNTR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c9, c13, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_PMXEVTYPER(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c9, c13, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_PMXEVCNTR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c9, c13, 2" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_PMUSERENR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c9, c14, 0" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_PMINTENSET(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c9, c14, 1" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_PMINTENCLR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c9, c14, 2" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_PMOVSSET(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c9, c14, 3" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_PMCEID2(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c9, c14, 4" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_PMCEID3(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c9, c14, 5" : [rdata] "=r" (rdata) :);
	return rdata;
}

volatile unsigned int read_PMMIR(void){
	unsigned int rdata;
	asm volatile ("MRC p15, 0, %[rdata], c9, c14, 6" : [rdata] "=r" (rdata) :);
	return rdata;
}

//----------------------
// Write {sheet}
//----------------------
volatile unsigned int write_PMCR(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c9, c12, 0" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_PMCNTENSET(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c9, c12, 1" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_PMCNTENCLR(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c9, c12, 2" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_PMOVSR(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c9, c12, 3" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_PMSWINC(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c9, c12, 4" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_PMSELR(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c9, c12, 5" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_PMCEID0(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c9, c12, 6" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_PMCEID1(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c9, c12, 7" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_PMCCNTR(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c9, c13, 0" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_PMXEVTYPER(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c9, c13, 1" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_PMXEVCNTR(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c9, c13, 2" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_PMUSERENR(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c9, c14, 0" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_PMINTENSET(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c9, c14, 1" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_PMINTENCLR(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c9, c14, 2" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_PMOVSSET(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c9, c14, 3" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_PMCEID2(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c9, c14, 4" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_PMCEID3(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c9, c14, 5" :  :[wdata] "r" (wdata));
	return 0;
}

volatile unsigned int write_PMMIR(unsigned int wdata){
	asm volatile ("MCR p15, 0, %[wdata], c9, c14, 6" :  :[wdata] "r" (wdata));
	return 0;
}

void writew(u32 address, u32 value){
	asm volatile ("STR %[value], [%[address]]"
			:
			: [value] "r" (value), [address] "r" (address)
	);
}
#endif