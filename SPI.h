  
#ifndef p24FJ64GA004_H
#define	p24FJ64GA004_H

#include <p24FJ64GA004.h>

#endif	

#ifndef SPI_H
#define SPI_H

uint8_t SPI_TransferByte (uint8_t data);
unsigned char _readSPI8bit(char reg);
void _writeSPI(char reg, char data);

void BME280_init(void);
void writeSPI(char,char);
unsigned int readSPI16bit( char);
unsigned char readSPI8bit( char); 
unsigned int readSPI16bit_u_LE( char);
signed int readSPI16bit_s_LE(char); 

#endif	

