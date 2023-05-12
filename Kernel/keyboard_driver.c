#include <lib.h>
#include <naiveConsole.h>
#include "keyboard_driver.h"

static char ScanCodes[256]={0, 0, '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '-', '=',
'\b', '\t', 'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', '[', ']', '\n', 0, 'A', 'S', 
'D', 'F', 'G', 'H', 'J', 'K', 'L', ';', '\'', '`', 0, '\\', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', 0, 0 };

void keyboard_handler(){
    char key = getKey();

	if(key == 0x39){ // space
		ncPrint(" ");
		return;
	}
	if(ScanCodes[key] == '\b'){
		ncBackspace();
		return;
	}
	if(ScanCodes[key] == '\t'){
		ncPrint("    ");
		return;
	}
	if(ScanCodes[key] == '\n'){
		ncNewline();
		return;
	}
	if( key>=0 && key<=256 && ScanCodes[key] != 0 ){
		ncPrintChar(ScanCodes[key]);
		return;
	}
	
}