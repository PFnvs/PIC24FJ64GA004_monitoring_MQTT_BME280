#ifndef p24FJ64GA004_H
#define	p24FJ64GA004_H

#include <p24FJ64GA004.h>

#endif	/* XC_HEADER_TEMPLATE_H */

#ifndef PMP_LCD_H
#define PMP_LCD_H



#define SEND_PMP_COMMAND 0
#define SEND_PMP_DATA 1
void LCD_init(void);
char LCD_read(int addr);
void LCD_write( int addr, char c);
void Puts_LCD( char *s);
void Clear_LCD (void);
void Home_LCD (void);
void Position_LCD(char x, char y);


#endif // PMP_LCD_H


