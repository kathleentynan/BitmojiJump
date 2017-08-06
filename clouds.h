
//{{BLOCK(clouds)

//======================================================================
//
//	clouds, 256x512@4, 
//	+ palette 256 entries, not compressed
//	+ 153 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x64 
//	Total size: 512 + 4896 + 4096 = 9504
//
//	Time-stamp: 2017-04-24, 22:30:24
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_CLOUDS_H
#define GRIT_CLOUDS_H

#define cloudsTilesLen 4896
extern const unsigned short cloudsTiles[2448];

#define cloudsMapLen 4096
extern const unsigned short cloudsMap[2048];

#define cloudsPalLen 512
extern const unsigned short cloudsPal[256];

#endif // GRIT_CLOUDS_H

//}}BLOCK(clouds)
