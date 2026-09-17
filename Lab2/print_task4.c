#include <stdio.h>
extern unsigned char ram[]; // RAM declared in assembly
extern void sum_loop(void); // Assembly function
int main()
{sum_loop(); // Run assembly code
printf("RAM contents at 50H:\n");
printf("%d ", ram[0x50]);
printf("\n");
return 0;
}