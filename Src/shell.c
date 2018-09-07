#include <stdio.h>
#include <stdlib.h>
#include "lib.h"

int main(void){

  //Define Local Variables

  char input[256] = "";
  
  puts("Welcome to the FBSH!");

  while(TRUE){
    
        printf("Command: ");
	fgets(input,sizeof(input),stdin);
	
}

  
  return 0;
}
