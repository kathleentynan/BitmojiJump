#include "myLib.h"

unsigned short *videoBuffer = (u16 *)0x6000000;

unsigned short *frontBuffer = (u16 *)0x6000000;
unsigned short *backBuffer =  (u16 *)0x600A000;

DMA *dma = (DMA *)0x40000B0;

void loadPalette(const unsigned short* palette)
{
	DMANow(3, (unsigned short*)palette, PALETTE, 256);
}


void DMANow(int channel, volatile const void* source, volatile void* destination, unsigned int control){
	dma[channel].src = source;
	dma[channel].dst = destination;
	dma[channel].cnt = DMA_ON | control;
}

void waitForVblank(){
	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}

//mode4

void flipPage(){
    if(REG_DISPCTL & BACKBUFFER)
    {
        REG_DISPCTL &= ~BACKBUFFER;
        videoBuffer = backBuffer;
    }
    else
    {
        REG_DISPCTL |= BACKBUFFER;
        videoBuffer = frontBuffer;
    }
}

void setPixel4(int row, int col, unsigned char colorIndex) {
    unsigned short pixel = videoBuffer[OFFSET(row,col,240)/2];
    if(col & 1) {
        pixel &= 0xFF;
        videoBuffer[OFFSET(row,col,240)/2] = pixel | (colorIndex << 8);
    } else {
        pixel &= ~0xFF;
        videoBuffer[OFFSET(row,col,240)/2] = pixel | colorIndex;
    }
}

void drawRect4(int row, int col, int height, int width, volatile unsigned char colorIndex) {
    unsigned short pixels = colorIndex << 8 | colorIndex;
    for(int r = 0; r < height; r++) {
        if(col & 1) {
            setPixel4(row + r, col, colorIndex);
            if(width & 1) {
                DMANow(3, &pixels, &videoBuffer[OFFSET(row+r,col+1,240)/2], width/2 | DMA_SOURCE_FIXED);
            } else {
                DMANow(3, &pixels, &videoBuffer[OFFSET(row+r,col+1,240)/2], (width/2 - 1) | DMA_SOURCE_FIXED);
                setPixel4(row + r, col + width - 1, colorIndex);
            }
        } else {
            if (width & 1) {
                DMANow(3, &pixels, &videoBuffer[OFFSET(row+r,col,240)/2], width/2 | DMA_SOURCE_FIXED);
                setPixel4(row + r, col + width - 1, colorIndex);
            } else {
                DMANow(3, &pixels, &videoBuffer[OFFSET(row+r,col,240)/2], width/2 | DMA_SOURCE_FIXED);
            }
        }
    }
}

void drawBackgroundImage4(volatile const unsigned short* image) {
    DMANow(3, (unsigned short*)image, videoBuffer, (240*160)/2);
}

void drawImage4(volatile const unsigned short* image, int row, int col, int height, int width) {
    if(col & 1) {
        col++;
    }

    for(int r = 0; r < height; r++) {
        DMANow(3, (unsigned short*)&image[OFFSET(r,0, width/2)], &videoBuffer[OFFSET(row+r,col,SCREENWIDTH)/2], width/2);
    }
            
}

void fillScreen4(unsigned char colorIndex) {
    volatile unsigned short pixels = ((colorIndex << 8) | colorIndex);
    DMANow(3, &pixels, videoBuffer, DMA_SOURCE_FIXED | (240 * 160)/2); 
}


