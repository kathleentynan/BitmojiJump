#include "main.h"
#include "collisions.h"
#include "myLib.h"


int platformCollisions(PLAYER *pl, PLATFORM *p){
	for (int i = 0; i < NUMPLATFORMS; ++i){

		if(p[i].row > 60 && p[i].active && p[i].type != BROKEN){
			int collisionCheck = genericCollision(
					p[i].row, p[i].col, p[i].width, p[i].height,
					SHIFTDOWN(pl->row) + pl->size/2, pl->col, pl->size, pl->size/2);
			if ((collisionCheck == 0) && (pl->rDel > 100)){
				
				if (p[i].type == NONE){
						p[i].type = BROKEN;	
				}
				return 1;
			}
		}

	}


	return 0;
}

int starCollision(PLAYER *player, STAR *star){

	for (int i = 0; i < NUMSTARS; ++i)
	{
		if (star[i].active)
		{
			int collisionCheck = genericCollision(
					star[i].row, star[i].col, star[i].size, star[i].size,
					SHIFTDOWN(player->row), player->col, player->size, player->size);
			if (collisionCheck == 0 || collisionCheck == 2 || 
				collisionCheck == 3 || collisionCheck == 1){
				star[i].active = 0;
				
				return 1;
			}
		}
	}



	return 0;
}


/*
*
* checks for collisions between two objects
*
*/
int genericCollision(int r1, int c1, int w1, int h1, int r2, int c2, int w2, int h2) {
	//bottom bounds
	int topAboveBottom = r1 <= r2+h2 && r1 >= r2;

	//between vertical bounds
	int box2VerticalAligned = c1 < c2+w2 && c1+w1 > c2;

	//hit bottom
	if(topAboveBottom && box2VerticalAligned) return 0;

	//top bounds
	int bottomBelowTop = r1+h1 >= r2 && r1+h1 <= r2+h2;

	//hit top 
	if(bottomBelowTop && box2VerticalAligned) return 2;

	//between horizontal bounds
	int box2HorizontalAligned = r1 < r2+h2 && r1+h1 > r2;

	//right side bounds
	int leftPastRight = c1 <= c2+w2 && c1 >= c2;

	//hit right side
	if(box2HorizontalAligned && leftPastRight) return 3;

	//left side bounds
	int rightPastleft = c1+w1 >= c2 && c1+w1 <= c2+w2;

	//hit left side
	if(box2HorizontalAligned && rightPastleft) return 1;

	return -1;
}