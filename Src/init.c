#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "lib.h"

bool start_up(void);

bool clean_up(void);

int run_shell(void);

int main(void){

  start_up();
  
  if(DEBUG){
  puts(YELLOW_TEXT"Successfully Initialized :)"RESET_TEXT);
  }
  
  if(clean_up() == TRUE){
    if(DEBUG){
      puts("Launching Shell");
    }
      //Test if the binary for the shell exists
    system("clear");
    run_shell();
  }else{
    puts("Initialization Failed :(");
    exit(-1);
  }
  
  return 0;
}

//Define test paramters and such below
bool start_up(void){
  
  return TRUE;

}

//If clean_up fails --> Return FALSE
bool clean_up(void){

  puts(RESET_TEXT);
  
  return TRUE;

}

int run_shell(){

  if(access(SHELL_BIN, F_OK) != -1){
    system(SHELL_BIN);
  }else{
    puts(RED_TEXT"Binary NOT found!");
    exit -1;
  }
  
  return 0;
}
