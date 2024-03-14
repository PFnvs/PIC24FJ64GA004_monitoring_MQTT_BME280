#define FCY 10000000UL
#include <P24FJ64GA004.h>
#include <libpic30.h>
#include "BME280.h"
#include "SPI.h"

signed long int t_fine; 


void BME280_init(void)
{   
    while(SPI2STATbits.SRXMPT == 0);
    LATCbits.LATC2=0;
    LATCbits.LATC1=1;
    writeSPI(CTRL_HUM, 0x01); // Humidity oversampling = 1
    writeSPI(CONTROL, 0x25); // Forced mode, Temp/Press oversampling = 1   
    LATCbits.LATC2=1;
    LATCbits.LATC1=0;
}


int readTemp(void){
    
    unsigned long int dig_T1 = readSPI16bit_u_LE(dig_T1_REG); 
    signed long int dig_T2 = readSPI16bit_s_LE(dig_T2_REG);
    signed long int dig_T3 = readSPI16bit_s_LE(dig_T3_REG);
    
    // Temperature Raw ADC:
    unsigned long int adc_T = readSPI16bit(TEMP_REG);
    adc_T <<= 8; // move in XLSB register
    adc_T |= readSPI8bit(TEMP_REG + 2);
    adc_T >>= 4; // Only uses top 4 bits of XLSB register 

    // From BME280 data sheet: 
    signed long int var1  = ((((adc_T>>3) - (dig_T1 <<1))) *
	   (dig_T2)) >> 11;
  
    signed long int var2  = (((((adc_T>>4) - (dig_T1)) *
	     ((adc_T>>4) - (dig_T1))) >> 12) *
	     (dig_T3)) >> 14;

    t_fine = var1 + var2;
 
    float T = (t_fine * 5 + 128) >> 8;
    
    return T/100;
}

int readHumidity(void){
    
    
    // Calibration Coefficients:
    unsigned int dig_H1 = readSPI8bit(dig_H1_REG);
    signed long int dig_H2 = readSPI16bit_s_LE(dig_H2_REG);
    unsigned int dig_H3 = readSPI8bit(dig_H3_REG);
    signed long int dig_H4 = (readSPI8bit(dig_H4_REG) << 4) | (readSPI8bit(dig_H4_REG+1) & 0xF);
    signed long int dig_H5 = (readSPI8bit(dig_H5_REG+1) << 4) | (readSPI8bit(dig_H5_REG) >> 4);
    signed int dig_H6 = (signed int) readSPI8bit(dig_H6_REG);
    
    // Humidity raw ADC:
    unsigned long int adc_H = readSPI16bit(HUM_REG);
    
    // from BME280 data sheet:
    unsigned long int v_x1_u32r;
    
    v_x1_u32r = t_fine - 76800;
    
    v_x1_u32r = (((((adc_H << 14) - ((dig_H4) << 20) - ((dig_H5) * v_x1_u32r))
            + (16384)) >> 15) * (((((((v_x1_u32r * (dig_H6)) >> 10) *
		    (((v_x1_u32r * (dig_H3)) >> 11) + (32768))) >> 10) +
		  (2097152)) * (dig_H2) + 8192) >> 14));
    
    v_x1_u32r = (v_x1_u32r - (((((v_x1_u32r >> 15) * (v_x1_u32r >> 15)) >> 7) *
			     (dig_H1)) >> 4));
    
    v_x1_u32r = (v_x1_u32r < 0) ? 0 : v_x1_u32r;
    v_x1_u32r = (v_x1_u32r > 419430400) ? 419430400 : v_x1_u32r;
    float humidity = (v_x1_u32r>>12);
   
    return  humidity / 1024.0;
}

int readPressure(void){

    
    // Calibration Coefficients
    unsigned long int dig_P1 = readSPI16bit_u_LE(dig_P1_REG);
    signed long int dig_P2 = readSPI16bit_s_LE(dig_P2_REG);
    signed long int dig_P3 = readSPI16bit_s_LE(dig_P3_REG);
    signed long int dig_P4 = readSPI16bit_s_LE(dig_P4_REG);
    signed long int dig_P5 = readSPI16bit_s_LE(dig_P5_REG);
    signed long int dig_P6 = readSPI16bit_s_LE(dig_P6_REG);
    signed long int dig_P7 = readSPI16bit_s_LE(dig_P7_REG);
    signed long int dig_P8 = readSPI16bit_s_LE(dig_P8_REG);
    signed long int dig_P9 = readSPI16bit_s_LE(dig_P9_REG);

    // Pressure Raw ADC:
    unsigned long int adc_P = readSPI16bit(PRESS_REG);
    adc_P <<= 8; // move in XLSB register
    adc_P |= readSPI8bit(PRESS_REG + 2);
    adc_P >>= 4; // Only uses top 4 bits of XLSB register 
    
    // from BME280 datasheet 
    signed long int var1 = ((signed long int)t_fine >> 1);
    var1 = var1 - (signed long int)64000;
    signed long int var2 = (((var1>>2) * (var1>>2)) >> 11 ) * ((signed long int)dig_P6);
    var2 = var2 + ((var1*((signed long int)dig_P5))<<1);
    var2 = (var2>>2)+(((signed long int)dig_P4)<<16);
    var1 = (((dig_P3 * (((var1>>2) * (var1>>2)) >> 13 )) >> 3) + ((((signed long int)dig_P2) * var1)>>1))>>18;
    var1 =((((32768+var1))*((signed long int)dig_P1))>>15);
    if (var1 == 0){
        return 0; // avoid exception caused by division by zero
    }
    unsigned long int p = (((unsigned long int)(((signed long int)1048576)-adc_P)-(var2>>12)))*3125;
    if (p < 0x80000000){
        p = (p << 1) / ((unsigned long int)var1);
    }
    else
    {
        p = (p / (unsigned long int)var1) * 2;
    }
    var1 = (((signed long int)dig_P9) * ((signed long int)(((p>>3) * (p>>3))>>13)))>>12;
    var2 = (((signed long int)(p>>2)) * ((signed long int)dig_P8))>>13;
    p = (unsigned long int)((signed long int)p + ((var1 + var2 + dig_P7) >> 4));
    int pressure = p/133;
    
    return pressure;
}