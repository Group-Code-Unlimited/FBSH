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

	//Remove trailing newline
	//strtok(input,"\n");

	if(strncmp(input, "exit\n", sizeof(input)) == 0 || strncmp(input, "quit\n",sizeof(input)) == 0){
	  //Run Clean Up function here
	  exit(1);
	}
	
}

  
  return 0;
}
