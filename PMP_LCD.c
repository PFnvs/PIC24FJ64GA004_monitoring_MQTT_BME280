#include <P24FJ64GA004.h>
#include "PMP_LCD.h"



void LCD_init(void)
    {
    // PMP initialization
        PMCON = 0x83BF; // Enable the PMP, long waits
        PMMODE = 0x3FF; // Master Mode 1
        PMAEN = 0x0001; // PMA0 enabled
        
        // init TRM1
        T1CON = 0x8030; // FOSC/2, prescaled 1:256. 16us/tick

        TMR1 = 0; while( TMR1<2000); //2000 x 16us = 32ms
        PMADDR = SEND_PMP_COMMAND;
        PMDIN1 =  0b00111000; //function set: 8-bit interface, 2 lines, 5x7
        TMR1 = 0; while( TMR1<3); // 3 x 16us = 48us
        PMDIN1 = 0b00001100; // display ON, cursor off, blink off
        TMR1 = 0; while( TMR1<3); // 3 x 16us = 48us
        PMDIN1 = 0b00000001; // clear display
        TMR1 = 0; while( TMR1<100); // 100 x 16us = 1.6us
        PMDIN1 = 0b00000110; // increment cursor, no shift
        TMR1 = 0; while( TMR1<100); // 100 x 16us = 1.6us   
    
    }

char LCD_read(int addr)
    {
        int buf;
        while( PMMODEbits.BUSY); // wait for PMP to complete previous commands
        PMADDR = addr; // select the command address
        buf = PMDIN1; //initiate a read cycle, dummy read
        while( PMMODEbits.BUSY); //wait for PMP to complete the sequence
        return(PMDIN1); // read the status register
    }

void LCD_write( int addr, char c)
    {
        while( LCD_read(SEND_PMP_COMMAND)&0x80);
        while( PMMODEbits.BUSY); //wait for PMP to be available
        PMADDR = addr;
        PMDIN1 = c;
    } 

void Puts_LCD( char *s)
    {
        while( *s)
            LCD_write( SEND_PMP_DATA, (*s++));
        
    } 

void Clear_LCD (void)
    {
       LCD_write( SEND_PMP_COMMAND,1);
    }
 
void Home_LCD (void)
{
    LCD_write( SEND_PMP_COMMAND,2);
}

void Position_LCD(char x, char y)
{
    LCD_write(SEND_PMP_COMMAND, (0x80 | (0x40 * x + y)));
}