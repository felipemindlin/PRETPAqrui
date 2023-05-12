
#include <naiveConsole.h>
#include "syscall.h"
#define RED 0x40
void sys_write(const char *buf, int len, int filedescriptior){
    if(filedescriptior == 1){
        ncPrint(buf);
    }else if(filedescriptior == 2){
        ncPrintColor(buf, 0x0F, RED);
    }
}