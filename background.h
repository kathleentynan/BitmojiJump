
//{{BLOCK(background)

//======================================================================
//
//	background, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 159 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 5088 + 2048 = 7648
//
//	Time-stamp: 2017-04-24, 17:11:25
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BACKGROUND_H
#define GRIT_BACKGROUND_H

#define backgroundTilesLen 5088
extern const unsigned short backgroundTiles[2544];

#define backgroundMapLen 2048
extern const unsigned short backgroundMap[1024];

#define backgroundPalLen 512
extern const unsigned short backgroundPal[256];

#define scorebgTilesLen 128
extern const unsigned short scorebgTiles[64];

#define scorebgMapLen 2048
extern const unsigned short scorebgMap[1024];

#endif // GRIT_BACKGROUND_H

//}}BLOCK(background)
