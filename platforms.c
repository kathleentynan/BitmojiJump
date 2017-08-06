#include "main.h"
#include "myLib.h"
#include "platforms.h"
#include <stdlib.h>
#include <stdio.h>

void handlePlatforms(PLATFORM * platforms){
	for (int i = 0; i < NUMPLATFORMS; ++i){

		if (platforms[i].active && platforms[i].type == MOVING){	
		
				platforms[i].col += platforms[i].cDel;

				if (platforms[i].col < 3 || platforms[i].col + platforms[i].width - 3 > 240){
					platforms[i].cDel = -(platforms[i].cDel);
				}
			
		}

		if (platforms[i].row > 145){
			platforms[i].col = random(0, SCREENWIDTH - platforms[i].width - 1);
			platforms[i].row = 0;
			if (rand() % 5 == 0){
			platforms[i].type = NONE;
			} else if (rand() % 5 == 1 || rand() % 5 == 2){
				platforms[i].type = MOVING;

			} else {
				platforms[i].type = STATIONARY;
			}
		}

	}
}

int random(int min, int max){
   return min + rand() / (RAND_MAX / (max - min + 1) + 1);
}