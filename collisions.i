# 1 "collisions.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "collisions.c"
# 1 "main.h" 1
# 11 "main.h"
unsigned int buttons;
unsigned int oldButtons;


int state;
enum {SPLASH, INSTRUCTIONS, GAME, PAUSE, WINLOSE};

enum {SCORESPRITE, HEIGHTSPRITE, CHEATSPRITE, SOUNDSPRITE, PLAYERSPRITE, PLATFORMSPRITE,
 STARSPRITE = PLATFORMSPRITE + (9 + 1), NUMSPRITE = STARSPRITE + (5 + 1),
 NUMHEIGHT = NUMSPRITE + (3 + 1), PRESSA = 60};
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
int random(int min, int max);
int getDigit(int num, int digit);
# 2 "collisions.c" 2
# 1 "collisions.h" 1
int genericCollision(int r1, int c1, int w1, int h1, int r2, int c2, int w2, int h2);
int platformCollisions(PLAYER*, PLATFORM*);
int starCollision(PLAYER *player, STAR *s);
# 3 "collisions.c" 2
# 1 "myLib.h" 1



typedef unsigned short u16;
# 44 "myLib.h"
extern unsigned short *videoBuffer;

extern unsigned short *frontBuffer;
extern unsigned short *backBuffer;



void loadPalette(const unsigned short* palette);
void initialize();

void waitForVblank();


void flipPage();
void setPixel4(int row, int col, unsigned char color);
void fillScreen4(unsigned char color);
void drawBackgroundImage4(volatile const unsigned short*);
void drawImage4(volatile const unsigned short* image, int row, int col, int height, int width);
void drawRect4(int row, int col, int height, int width, volatile unsigned char colorIndex);


const unsigned char fontdata_6x8[12288];

void drawChar(int, int, char, unsigned char);
void drawString(int, int, char*, unsigned char);
# 89 "myLib.h"
extern unsigned int oldButtons;
extern unsigned int buttons;
# 99 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile void* destination, unsigned int control);






typedef volatile struct
{
        volatile const void *src;
        volatile void *dst;
        volatile unsigned int cnt;
} DMA;

extern DMA *dma;
# 228 "myLib.h"
typedef struct { u16 tileimg[8192]; } charblock;
typedef struct { u16 tilemap[1024]; } screenblock;
# 322 "myLib.h"
typedef struct{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
}OBJ_ATTR;

typedef struct {
    int row;
    int col;
} Sprite;
# 4 "collisions.c" 2


int platformCollisions(PLAYER *pl, PLATFORM *p){
 for (int i = 0; i < 9; ++i){

  if(p[i].row > 60 && p[i].active && p[i].type != BROKEN){
   int collisionCheck = genericCollision(
     p[i].row, p[i].col, p[i].width, p[i].height,
     ((pl->row) >> 8) + pl->size/2, pl->col, pl->size, pl->size/2);
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

 for (int i = 0; i < 5; ++i)
 {
  if (star[i].active)
  {
   int collisionCheck = genericCollision(
     star[i].row, star[i].col, star[i].size, star[i].size,
     ((player->row) >> 8), player->col, player->size, player->size);
   if (collisionCheck == 0 || collisionCheck == 2 ||
    collisionCheck == 3 || collisionCheck == 1){
    star[i].active = 0;

    return 1;
   }
  }
 }



 return 0;
}







int genericCollision(int r1, int c1, int w1, int h1, int r2, int c2, int w2, int h2) {

 int topAboveBottom = r1 <= r2+h2 && r1 >= r2;


 int box2VerticalAligned = c1 < c2+w2 && c1+w1 > c2;


 if(topAboveBottom && box2VerticalAligned) return 0;


 int bottomBelowTop = r1+h1 >= r2 && r1+h1 <= r2+h2;


 if(bottomBelowTop && box2VerticalAligned) return 2;


 int box2HorizontalAligned = r1 < r2+h2 && r1+h1 > r2;


 int leftPastRight = c1 <= c2+w2 && c1 >= c2;


 if(box2HorizontalAligned && leftPastRight) return 3;


 int rightPastleft = c1+w1 >= c2 && c1+w1 <= c2+w2;


 if(box2HorizontalAligned && rightPastleft) return 1;

 return -1;
}
