/********************************
This a game where the goal
is to jump the highest distance up
the screen map as you can while
avoiding obstacles

You also achieve points by catching
stars, the end screen is evaluated
by this.

Extra Credit
* gravity
* blending
* custom art
********************************/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>

#include "main.h"
#include "myLib.h"
#include "collisions.h"
#include "platforms.h"	


#include "start.h"
#include "instructions.h"
#include "endScreens.h"
#include "pause.h"	

#include "sprites.h"
#include "background.h"	
#include "clouds.h"			

#include "sound.h"
#include "songs.h"
		


OBJ_ATTR shadowOAM[128];

int timer = 0;
int ani = 0;

int move = 1;

int startInstr;

int seed = 0;

int height;
int score;

int vOff, hOff;
int timeToNextObstacle;
int time;

int startGame;

int cheat;

int mute;
int soundSprite;

PLAYER player;
PLATFORM platforms[NUMPLATFORMS];
STAR stars[NUMSTARS];

int main(){

	state = SPLASH;
	goToSplash();

	setupInterrupts();
	setupSounds();


	while(1){
		oldButtons = buttons;
		buttons = BUTTONS;

		switch(state){
			case SPLASH:
				updateSplash();
				break;
			case INSTRUCTIONS:
				updateInstructions();
				break;
			case GAME:
				updateGame();
				break;
			case PAUSE:
				updatePause();
				break;
			case WINLOSE:
				updateWinLose();
				break;					
		}
	}

}

/**SPLASH**/
void goToSplash(){
	state = SPLASH;
	startInstr = 1;
	playSoundA(introsong,INTROSONGLEN,INTROSONGFREQ, 1);
	loadPalette(startPal);
	REG_DISPCTL = MODE4 | BG2_ENABLE | BACKBUFFER;
	drawBackgroundImage4(startBitmap);
	drawRect4(115, 12, 4, 40, 5);
	flipPage();
}

void updateSplash(){
	seed++;

	if(BUTTON_PRESSED(BUTTON_START)){
		if (startInstr){
			flipPage();
			srand(seed);
			fillScreen4(0);
			stopSound();
			initialize();
			playSoundA(happy,HAPPYLEN,HAPPYFREQ, 1);
			goToGame();
		}else{
			goToInstructions();
		}
	}

	//instructions
	if (BUTTON_PRESSED(BUTTON_DOWN)){
		drawBackgroundImage4(startBitmap);
		drawRect4(145, 10, 4, 100, 5);
		startInstr = 0;
		flipPage();	
	}

	//start game
	if (BUTTON_PRESSED(BUTTON_UP)){
		drawBackgroundImage4(startBitmap);
		drawRect4(115, 10, 4, 40, 5); 
		startInstr = 1;
		flipPage();	
	}
}
/**END SPLASH**/

/**INSTRUCTIONS**/
void goToInstructions(){
	state = INSTRUCTIONS;
	loadPalette(instructionsPal);
	drawBackgroundImage4(instructionsBitmap);
	flipPage();
}

void updateInstructions(){
	if (BUTTON_PRESSED(BUTTON_B)){
		flipPage();
		fillScreen4(0);
		goToSplash();
	}

	if (BUTTON_PRESSED(BUTTON_RIGHT))
	{
		drawBackgroundImage4(instructions2Bitmap);
		flipPage();
		fillScreen4(0);
	} 

	if (BUTTON_PRESSED(BUTTON_LEFT))
	{
		drawBackgroundImage4(instructionsBitmap);
		flipPage();
		fillScreen4(0);
	}
}
/**END INSTRUCTIONS**/

/**GAME**/
void goToGame(){
	state = GAME;
	loadPalette(cloudsPal);
	REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | BG2_ENABLE | SPRITE_ENABLE;
	
	REG_BG2CNT = CBB(0) | SBB(31) | BG_SIZE0 | 2; //background
	REG_BG1CNT = CBB(1) | SBB(28) | BG_SIZE2 | 1; //clouds
	REG_BG0CNT = CBB(2) | SBB(27) | BG_SIZE0; //score

	REG_BLDMOD = BG1_A | BG2_B | OBJ_B | BACKDROP_B | NORMAL_TRANS;
	REG_COLEV = WEIGHTOFA(9) | WEIGHTOFB(9);
	
	//sky
	DMANow(3, backgroundTiles, &CHARBLOCKBASE[0], backgroundTilesLen/2);
    DMANow(3, backgroundMap, &SCREENBLOCKBASE[31], backgroundMapLen/2);

	//clouds
	DMANow(3, cloudsTiles, &CHARBLOCKBASE[1], cloudsTilesLen/2);
    DMANow(3, cloudsMap, &SCREENBLOCKBASE[28], cloudsMapLen/2);

    //score
    DMANow(3, scorebgTiles, &CHARBLOCKBASE[2], scorebgTilesLen/2);
    DMANow(3, scorebgMap, &SCREENBLOCKBASE[27], scorebgMapLen/2);

    //press A to start

    DMANow(3, spritesTiles, &CHARBLOCKBASE[4], spritesTilesLen/2);
    DMANow(3, spritesPal, SPRITE_PALETTE, spritesPalLen/2);

    vOff = 0;
    hOff = 0;

    hideSprites();
}

void updateGame(){

	timer++;
	hideSprites();

	if (!startGame)
	{
		
	}

	//start
	if(!startGame && BUTTON_PRESSED(BUTTON_A) ){
		player.rDel = -player.maxVSpeed;
		startGame = 1;
	}

	//gravity
	player.rDel += player.racc;
	player.row += player.rDel;

	

	//gravity
	if(SHIFTDOWN(player.row) >= 143-player.size-1){
		player.row = SHIFTUP(143-player.size-1);
		player.rDel = 0;
	}

	//platform collisions
	if (startGame && platformCollisions(&player, platforms)){
		player.rDel = -player.maxVSpeed;
		if (!mute)
		{
			playSoundB(jump, JUMPLEN, JUMPFREQ, 0);
		}
	
	}

	//animation
	if (player.rDel > 100){
		if (player.rDel > 1000){
			player.aniState = PLAYERJUMP;
		}else{
			player.aniState = PLAYERHALFJUMP;
		}

	} else {
		player.aniState = PLAYERNORMAL;
	}

	//increase platforms and stars
	if (SHIFTDOWN(player.row) < SCREENHEIGHT/3 && player.rDel < 0){
		for (int i = 0; i < NUMPLATFORMS; ++i)
		{	
			platforms[i].row -= SHIFTDOWN(player.rDel);
			height++;
			vOff--;
			if (i < NUMSTARS && stars[i].active)
			{
				if (stars[i].row + stars[i].size > 160)
				{
					stars[i].active = 0;
				} else {
					stars[i].row -= SHIFTDOWN(player.rDel);
				}
			}
		}

	}

	//star animation
	if (!(++ani % 10)){
		for (int i = 0; i < NUMSTARS; ++i)
		{
			if (stars[i].active)
			{
				stars[i].aniState ++;
				stars[i].aniState = stars[i].aniState % 3; 
			}
		}
	}

	//stars
	if (!(++time % timeToNextObstacle))
	{
	
		for (int i = 0; i < NUMSTARS; ++i)
		{
			if (!stars[i].active)
			{
				stars[i].active = 1;
				stars[i].row = random(0, SCREENHEIGHT/2);
				stars[i].col = random(0, SCREENWIDTH - stars[i].size);
				timeToNextObstacle = rand()%400;
				break;
			}
		}
	}

	//star collision
	if (starCollision(&player, stars)){
			score++;
			if (!mute)
			{
				playSoundB(yeah, YEAHLEN, YEAHFREQ, 0);
			}

	}	
	
	
	//left
	if (BUTTON_HELD(BUTTON_LEFT)){
		if (player.col > 0){
			player.col-=3;
		} else {
			player.col = SCREENWIDTH - player.size - 1;
		}
	}

	//right
	if (BUTTON_HELD(BUTTON_RIGHT)){
		if (player.col + player.size < 240){
			player.col+=3;
		} else {
			player.col = 0;
		}
	}

	//pause
	if (BUTTON_PRESSED(BUTTON_SELECT)){
		goToPause();
	}

	//cheat
	if (BUTTON_PRESSED(BUTTON_B)){
		if (cheat == HEIGHTNUMFAST)
		{
			cheat = HEIGHTNUMSLOW;
		} else {
			cheat = HEIGHTNUMFAST;
		}
	}

	//sound off
	if (BUTTON_PRESSED(BUTTON_R))
	{
		if (!mute){
			pauseSound();
			soundSprite = 6;
			mute = 1;
		} else{
			unpauseSound();
			soundSprite = 4;
			mute = 0;
		}
	}

	//win/lose
	if (startGame && (!player.alive || ((SHIFTDOWN(player.row) + player.size > 141)))){
		goToWinLose();
	}

	handlePlatforms(platforms);

	player.oldRow = SHIFTDOWN(player.row);
	updateOAM();	

	DMANow(3, shadowOAM, OAM, 128*4);
    waitForVblank();


    REG_BG1VOFS = vOff/4;
    REG_BG1HOFS = (hOff++)/2;
	REG_BG2VOFS = vOff/2;
}
/**END GAME**/

/**PAUSE**/
void goToPause(){
	state = PAUSE;
	REG_DISPCTL = MODE4 | BG2_ENABLE | BACKBUFFER;
	pauseSound();
	loadPalette(pausePal);
	drawBackgroundImage4(pauseBitmap);
	flipPage();
}

void updatePause(){
	//return
	if(BUTTON_PRESSED(BUTTON_SELECT)){
		flipPage();
		unpauseSound();
		fillScreen4(0);
		goToGame();
	}

	//restart
	if (BUTTON_PRESSED(BUTTON_START)){
		flipPage();
		fillScreen4(0);
		goToSplash();
	}
}
/**END PAUSE**/

/**WIN/LOSE**/
void goToWinLose(){
	state = WINLOSE;
	REG_DISPCTL = MODE4 | BG2_ENABLE | BACKBUFFER;
	
	if (height <= 200 || score == 0){
		loadPalette(realbadPal);
		drawBackgroundImage4(realbadBitmap);
		char livesString[41];
		sprintf(livesString, "%d", height);
		drawString(70, 170, livesString, 4);
		sprintf(livesString, "%d", score);
		drawString(110, 180, livesString, 4);
		flipPage();
	}else if (height < 600 || score < 3)
	{
		loadPalette(badPal);
		drawBackgroundImage4(badBitmap);
		char livesString[41];
		sprintf(livesString, "%d", height);
		drawString(70, 170, livesString, 6);
		sprintf(livesString, "%d", score);
		drawString(110, 180, livesString, 6);
		flipPage();
	} else if ((height >= 600 && height < 1200) || score < 5) {
		loadPalette(okPal);
		drawBackgroundImage4(okBitmap);
		char livesString[41];
		sprintf(livesString, "%d", height);
		drawString(70, 170, livesString, 7);
		sprintf(livesString, "%d", score);
		drawString(110, 180, livesString, 7);
		flipPage();
	} else {
		loadPalette(awesomePal);
		drawBackgroundImage4(awesomeBitmap);
		char livesString[41];
		sprintf(livesString, "%d", height);
		drawString(70, 50, livesString, 3);
		sprintf(livesString, "%d", score);
		drawString(110, 55, livesString, 3);
		flipPage();
	}
}

void updateWinLose(){
	if(BUTTON_PRESSED(BUTTON_START)){
		flipPage();
		goToSplash();
	}
}
/**END WIN/LOSE**/


/**OAM**/
void updateOAM(){
	//player oam
	if (player.alive){
		shadowOAM[PLAYERSPRITE].attr0 = SHIFTDOWN(player.row);
		shadowOAM[PLAYERSPRITE].attr1 = ATTR1_SIZE32 | player.col;
		shadowOAM[PLAYERSPRITE].attr2 = ((ATTR2_PRIORITY(2)) | (SPRITEOFFSET16(0, player.aniState)));
	} else {
		shadowOAM[PLAYERSPRITE].attr0 = ATTR0_HIDE;
	}

	//platform oam
	for (int i = 0; i < NUMPLATFORMS; ++i){
		if (platforms[i].active){
			shadowOAM[PLATFORMSPRITE + i].attr0 = platforms[i].row;
			shadowOAM[PLATFORMSPRITE + i].attr1 = ATTR1_SIZE16 | platforms[i].col;
			shadowOAM[PLATFORMSPRITE + i].attr2 = ((ATTR2_PRIORITY(2)) | (SPRITEOFFSET16(4, platforms[i].type)));
		} else{
			shadowOAM[PLATFORMSPRITE + i].attr0 = ATTR0_HIDE;
		}
	}

	//stars oam
	for (int i = 0; i < NUMSTARS; ++i)
	{
		if (stars[i].active){
			shadowOAM[STARSPRITE + i].attr0 = stars[i].row;
			shadowOAM[STARSPRITE + i].attr1 = ATTR1_SIZE8 | stars[i].col;
			shadowOAM[STARSPRITE + i].attr2 = ((ATTR2_PRIORITY(2)) | (SPRITEOFFSET16(8, stars[i].aniState)));
		} else{
			shadowOAM[STARSPRITE + i].attr0 = ATTR0_HIDE;
		}
	}

	//score && height text oam
    shadowOAM[SCORESPRITE].attr0 = 145;
	shadowOAM[SCORESPRITE].attr1 = ATTR1_SIZE32 | 5;
	shadowOAM[SCORESPRITE].attr2 = SPRITEOFFSET16(6, 10);

	//height text && cheat text
	shadowOAM[HEIGHTSPRITE].attr0 = 145;
	shadowOAM[CHEATSPRITE].attr0 = 145;
	if (cheat == HEIGHTNUMFAST){
		shadowOAM[HEIGHTSPRITE].attr1 = ATTR1_SIZE32 | 150;
		shadowOAM[CHEATSPRITE].attr0 = ATTR0_HIDE;
	}else {
		shadowOAM[HEIGHTSPRITE].attr1 = ATTR1_SIZE32 | 140;
		shadowOAM[CHEATSPRITE].attr1 = ATTR1_SIZE32 | 90;
	}
	shadowOAM[HEIGHTSPRITE].attr2 = SPRITEOFFSET16(6, 14);	
	shadowOAM[CHEATSPRITE].attr2 = SPRITEOFFSET16(9, 0);

	//sound
	shadowOAM[SOUNDSPRITE].attr0 = 142;
	shadowOAM[SOUNDSPRITE].attr1 = ATTR1_SIZE16 | 70;
	shadowOAM[SOUNDSPRITE].attr2 = SPRITEOFFSET16(9, soundSprite);	

	//score
	for (int i = 0; i < SCORENUM; i++){
	
		shadowOAM[NUMSPRITE + i].attr0 = 145;
		shadowOAM[NUMSPRITE + i].attr1 = ATTR1_SIZE8 | (50 - 8*i);
		shadowOAM[NUMSPRITE + i].attr2 = SPRITEOFFSET16(6, getDigit(score, i));
	
	}

	for (int i = 0; i < cheat; i++){
	
		shadowOAM[NUMHEIGHT + i].attr0 = 145;
		shadowOAM[NUMHEIGHT + i].attr1 = ATTR1_SIZE8 | (230 - 8*i);
		shadowOAM[NUMHEIGHT + i].attr2 = SPRITEOFFSET16(6, getDigit(height, i));
	
	}

	//press A to start
	if (!startGame)
	{
		shadowOAM[PRESSA].attr0 = 40;
		shadowOAM[PRESSA].attr1 = ATTR1_SIZE64 | 60;
		shadowOAM[PRESSA].attr2 = SPRITEOFFSET16(11, 0);

		shadowOAM[PRESSA + 1].attr0 = 40;
		shadowOAM[PRESSA + 1].attr1 = ATTR1_SIZE64 | 125;
		shadowOAM[PRESSA + 1].attr2 = SPRITEOFFSET16(11, 8);
	} else {
		shadowOAM[PRESSA].attr0 = ATTR0_HIDE;
		shadowOAM[PRESSA + 1].attr0 = ATTR0_HIDE;
	}

}

int getDigit(int num, int digit){
	return ((int)(num/(pow(10, digit))))%10;
}

void hideSprites(){
    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }
}
/**END OAM**/

void initialize(){
	height = 0;
	score = 0;
	startGame = 0;
	soundSprite = 4;
	mute = 0;
	cheat = HEIGHTNUMFAST;

	//player
	player.size = 32;
	player.rDel = 1;
	player.cDel = 1;
	player.row = SHIFTUP(130-player.size - 1);
	player.oldRow = SCREENHEIGHT-player.size;
	player.col = SCREENWIDTH/2-player.size/2;
	player.racc = 120;
	player.maxVSpeed = SHIFTUP(6);
	player.stopRange = 3;
	player.alive = 1;
	player.aniState = PLAYERNORMAL;

	//stars
	STAR star;
	star.row = 0;
	star.col = 0;
	star.size = 8;
	star.active = 0;
	star.aniState = FRONT;

	for (int i = 0; i < NUMSTARS; ++i)
	{
		stars[i] = star;
	}


	//platforms
	PLATFORM platform;
	platform.cDel = 1;
	platform.width = 16;
	platform.height = 4;
	platform.active = 1;
	for (int i = 0; i < NUMPLATFORMS; i++){
		platforms[i] = platform;
		platforms[i].col = random(0, SCREENWIDTH - platform.width - 1);
		platforms[i].row = i * 18;
		if (rand() % 5 == 0){
			platforms[i].type = NONE;
		} else if (rand() % 5 == 1 || rand() % 5 == 2){
			platforms[i].type = MOVING;

		} else {
			platforms[i].type = STATIONARY;
		}
	}

	time = 0;
}

