#include <stdio.h>
#include <stdlib.h>
#include "lib.h"

//Define Symbolic-Constants here
#define DEBUG 1

bool clean_up(void);

int main(void){

  if(DEBUG){
  puts(YELLOW_TEXT"Successfully Initialized :)"RESET_TEXT);
  }
  if(clean_up() == TRUE){
    puts("Launching Shell");
  }else{
    puts("Initialization Failed :(");
    exit(-1);
  }
  
  return 0;
}

//If clean_up fails --> Return FALSE
bool clean_up(void){


  puts(RESET_TEXT);
  

  return TRUE;

}
