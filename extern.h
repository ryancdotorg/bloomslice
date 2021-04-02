#pragma once
// max hashes per scheme
extern uint8_t hash1sN;
extern uint8_t hash2bN;
extern uint8_t hash2sN;
extern uint8_t hash3sN;

// offsets for hashes
extern uint8_t data1sT[];
extern uint8_t data2bT[];
extern uint8_t data2sT[];
extern uint8_t data3sT[];

// hash descriptions
extern char hashD[256][8];
// jump table
extern uint64_t hashJ[256];
