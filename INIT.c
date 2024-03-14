#include <P24FJ64GA004.h>
#include "INIT.h"

void PIN_MANAGER_Initialize (void);
void CLOCK_Initialize(void);
void SPI2_Initialize (void);

void PIN_MANAGER_Initialize (void)
{
    /****************************************************************************
     * Setting the Output Latch SFR(s)
     ***************************************************************************/
    LATA = 0x0000;
    LATB = 0x0000;
    LATC = 0x0000;

    /****************************************************************************
     * Setting the GPIO Direction SFR(s)
     ***************************************************************************/
    TRISA = 0x0797;
    TRISB = 0xFFFB;
    TRISC = 0x03F8;

    /****************************************************************************
     * Setting the Weak Pull Up and Weak Pull Down SFR(s)
     ***************************************************************************/
    CNPU1 = 0x0000;
    CNPU2 = 0x0000;

    /****************************************************************************
     * Setting the Open Drain SFR(s)
     ***************************************************************************/
    ODCA = 0x0000;
    ODCB = 0x0000;
    ODCC = 0x0000;

    /****************************************************************************
     * Setting the Analog/Digital Configuration SFR(s)
     ***************************************************************************/
    AD1PCFG = 0x00FC;
    
    /****************************************************************************
     * Set the PPS
     ***************************************************************************/
    __builtin_write_OSCCONL(OSCCON & 0xbf); // unlock PPS

    RPOR8bits.RP16R = 0x000A;    //RC0->SPI2:SDO2
    RPOR1bits.RP2R = 0x000B;    //RB2->SPI2:SCK2OUT
    RPINR22bits.SDI2R = 0x0003;    //RB3->SPI2:SDI2
    RPOR8bits.RP17R = 0x000C;    //RC1->SPI2:SS2OUT

    __builtin_write_OSCCONL(OSCCON | 0x40); // lock PPS
    
    
    TRISCbits.TRISC2=0;
}



void CLOCK_Initialize(void)
{
    // RCDIV FRC/2; DOZE 1:8; DOZEN disabled; ROI disabled; 
    CLKDIV = 0x3100;
    // TUN Center frequency; 
    OSCTUN = 0x00;
    // ADC1MD enabled; T3MD enabled; T4MD enabled; T1MD enabled; U2MD enabled; T2MD enabled; U1MD enabled; SPI2MD enabled; SPI1MD enabled; T5MD enabled; I2C1MD enabled; 
    PMD1 = 0x00;
    // OC5MD enabled; IC5MD enabled; IC4MD enabled; IC3MD enabled; OC1MD enabled; IC2MD enabled; OC2MD enabled; IC1MD enabled; OC3MD enabled; OC4MD enabled; 
    PMD2 = 0x00;
    // PMPMD enabled; RTCCMD enabled; CMPMD enabled; CRCPMD enabled; I2C2MD enabled; 
    PMD3 = 0x00;
    // NOSC PRI; SOSCEN disabled; OSWEN Switch is Complete; 
    __builtin_write_OSCCONH((uint8_t) (0x02));
    __builtin_write_OSCCONL((uint8_t) (0x00));
}



void SPI2_Initialize (void)
{
    // MSTEN Master; DISSDO disabled; PPRE 64:1; SPRE 8:1; MODE16 disabled; SMP Middle; DISSCK disabled; CKP Idle:High, Active:Low; CKE Idle to Active; 
    SPI2CON1 = 0x60;
    // SPIBEN enabled; SPIFPOL disabled; SPIFE disabled; 
    SPI2CON2 = 0x01;
    // SPITBF disabled; SISEL SPI_INT_SPIRBF; SPIRBF disabled; SPIROV disabled; SPIEN enabled; SRXMPT disabled; SRMPT disabled; SPISIDL disabled; SPIBEC disabled; 
    SPI2STAT = 0x804e;
}