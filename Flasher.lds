OUTPUT_FORMAT("elf32-littlearm", "elf32-littlearm", "elf32-littlearm")
OUTPUT_ARCH(arm)
/*ENTRY(Init_set_WDT)*/
ENTRY(_start)
SECTIONS
{
. = 0xe6300000;
/*. = 0xe6304000;*/
/* . =    0x50000000;*/
 . = ALIGN(4);
 .text :
 {
  start.o (.text)
  *(.text)
 }
 . = ALIGN(4);
 .rodata : { *(SORT_BY_ALIGNMENT(SORT_BY_NAME(.rodata*))) }
 . = ALIGN(4);
 .data : {
  *(.data)
 . = ALIGN(4);
  __bss_start = .;
  *(.bss)
   . = ALIGN(4);
  __bss_end__ = .;
 }
}
