#define SHIFTUP(i) ((i) << 8)
#define SHIFTDOWN(i) ((i) >> 8)
#define NUMPLATFORMS 9
#define NUMSTARS 5
#define SCORENUM 3
#define HEIGHTNUMSLOW 8
#define HEIGHTNUMFAST 7


//buttons 
unsigned int buttons;
unsigned int oldButtons;

//states
int state;
enum {SPLASH, INSTRUCTIONS, GAME, PAUSE, WINLOSE};
//OAM 
enum {SCORESPRITE, HEIGHTSPRITE, CHEATSPRITE, SOUNDSPRITE, PLAYERSPRITE, PLATFORMSPRITE, 
	STARSPRITE = PLATFORMSPRITE + (NUMPLATFORMS + 1), NUMSPRITE = STARSPRITE + (NUMSTARS + 1), 
	NUMHEIGHT = NUMSPRITE + (SCORENUM + 1), PRESSA = 60};
enum {PLAYERNORMAL = 0, PLAYERHALFJUMP = 4, PLAYERJUMP = 8};
enum {STATIONARY, MOVING = 2, NONE = 4, BROKEN = 6};
enum {FRONT, SIDE, SIDESIDE, CENTER};

typedef struct {
	int row;
	int col;
	int width;
	int height;
	int cDel;
	int type;
	int active;
}PLATFORM;

//structs
typedef struct {
	int row;
	int oldRow;
	int col;
	int size;
	int rDel;
	int cDel;

	int aniCounter;
	int aniState;
	int prevAniState;

	int racc;
	int maxVSpeed;
	int stopRange;	

	int alive;
} PLAYER;



typedef struct {
	int row;
	int col;
	int size;
	int active;
	int aniState;
}STAR;

//state methods
void goToSplash();
void updateSplash();
void goToInstructions();
void updateInstructions();
void goToGame();
void updateGame();
void goToPause();
void updatePause();
void goToWinLose();
void updateWinLose();

void handlePlatforms();

void updateOAM();
void hideSprites();
int random(int min, int max); //int platforms
int getDigit(int num, int digit); 


