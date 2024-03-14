#include <P24FJ64GA004.h>
#include "SPI.h"



unsigned char readSPI8bit(char reg){
    unsigned char trash;
    while(SPI2STATbits.SRXMPT == 0);
    LATCbits.LATC1=1;
    LATCbits.LATC2=0;
    SPI2BUF = reg;
    while(SPI2STATbits.SRXMPT == 1 );

    trash = SPI2BUF; // clear BF flag

    SPI2BUF = 0; // Send garbage
    while(SPI2STATbits.SRXMPT == 1);
    LATCbits.LATC1=0;
    LATCbits.LATC2=1;
    return SPI2BUF;       // clear flag by reading buffer
}

unsigned int readSPI16bit_u_LE( char reg){
    
    unsigned int val;
    
    val = readSPI16bit(reg); 
    
    return (val >> 8) | (val << 8); // swap upper and lower regs
}

signed int readSPI16bit_s_LE( char reg){ // read 16-bit signed little endian
    return (signed int)readSPI16bit_u_LE(reg);
}



unsigned int readSPI16bit( char reg){
    unsigned int val;
    
    val = readSPI8bit(reg); // shift in MSB
    val = val << 8 | readSPI8bit(reg+1); // shift in LSB
    
    return val;
}

void writeSPI(char reg, char data){
    unsigned char trash;
    while(SPI2STATbits.SRXMPT == 0);
    LATCbits.LATC1=1;
    LATCbits.LATC2=0;
    SPI2BUF =(reg & ~0x80);
    while(SPI2STATbits.SRXMPT == 1 );
    trash = SPI2BUF; // clear BF flag

    SPI2BUF = data; 
    while(SPI2STATbits.SRXMPT == 1);
    trash = SPI2BUF; // clear BF flag 
    LATCbits.LATC1=0;
    LATCbits.LATC2=1;
    return;
}
