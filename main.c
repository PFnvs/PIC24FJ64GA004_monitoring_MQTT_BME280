

#define FCY 10000000UL

#pragma config POSCMOD = HS    //Primary Oscillator Select->HS Oscillator mode selected
#pragma config I2C1SEL = PRI    //I2C1 Pin Location Select->Use default SCL1/SDA1 pins
#pragma config IOL1WAY = ON    //IOLOCK Protection->Once IOLOCK is set, cannot be changed
#pragma config OSCIOFNC = OFF    //Primary Oscillator Output Function->OSC2/CLKO/RC15 functions as CLKO (FOSC/2)
#pragma config FCKSM = CSECMD    //Clock Switching and Monitor->Clock switching is enabled, Fail-Safe Clock Monitor is disabled
#pragma config FNOSC = PRI    //Oscillator Select->Primary Oscillator (XT, HS, EC)
#pragma config SOSCSEL = SOSC    //Sec Oscillator Select->Default Secondary Oscillator (SOSC)
#pragma config WUTSEL = LEG    //Wake-up timer Select->Legacy Wake-up Timer
#pragma config IESO = OFF    //Internal External Switch Over Mode->IESO mode (Two-Speed Start-up) disabled

// CONFIG1
#pragma config WDTPS = PS32768    //Watchdog Timer Postscaler->1:32768
#pragma config FWPSA = PR128    //WDT Prescaler->Prescaler ratio of 1:128
#pragma config WINDIS = ON    //Watchdog Timer Window->Standard Watchdog Timer enabled,(Windowed-mode is disabled)
#pragma config FWDTEN = OFF    //Watchdog Timer Enable->Watchdog Timer is disabled
#pragma config ICS = PGx1    //Comm Channel Select->Emulator EMUC1/EMUD1 pins are shared with PGC1/PGD1
#pragma config BKBUG = OFF    //Background Debug->Device resets into Operational mode
#pragma config GWRP = OFF    //General Code Segment Write Protect->Writes to program memory are allowed
#pragma config GCP = OFF    //General Code Segment Code Protect->Code protection is disabled
#pragma config JTAGEN = OFF    //JTAG Port Enable->JTAG port is disabled



#include <P24FJ64GA004.h>
#include <libpic30.h>
#include <stdint.h>

#include "INIT.h"
#include "PMP_LCD.h"
#include "BME280.h"
#include "SPI.h"

#include "socket.h"
#include "wizchip_conf.h"
#include "w5500.h"
#include <string.h>
#include <ctype.h>

#include "MQTTClient.h"




//--------------------------------webServer_start_---------------------------------------------------



#define DATA_BUF_SIZE 1024
#define MAX_HTTPSOCK 4
uint8_t RX_BUF[DATA_BUF_SIZE], TX_BUF[DATA_BUF_SIZE];
uint8_t socknumlist[] = { 1, 2, 3, 4};

//--------------------------------webServer_END_---------------------------------------------------

//---------------------------------MQTT------------------------------------------------------------

#define TCP_SOCKET        0 
#define targetPort        00000 // mqtt server/broker port,your_data_port 
#define Token_Ubidots1     "your_data_user"
#define Token_Ubidots2     "your_data_pass"
uint8_t targetIP[] = {0,0,0,0}; //your_data_ip_brocker

uint8_t tempBuffer[DATA_BUF_SIZE] = {}; // Receive Buffer
uint8_t licznik = 1 ;
volatile uint16_t SoftTimer1 , SoftTimer2 ;

void messageArrived(MessageData* md);
void PublishTopic_t(unsigned int t );
void PublishTopic_p(unsigned int p );
void PublishTopic_h(unsigned int h );

void SubscribeTopic(void);

 struct opts_struct
{
	char* clientid;
	int nodelimiter;
	char* delimiter;
	enum QoS qos;
	char* username;
	char* password;
	char* host;
	int port;
	int showtopics;
} opts ={ (char*)"stdout-subscriber", 0, (char*)"\n", QOS0, (char*)Token_Ubidots1, (char*)Token_Ubidots2, targetIP, targetPort, 1 };  

Network n;
MQTTClient c;


void messageArrived(MessageData* md)
{
	uint8_t messageBuffer[100];
    	
    MQTTMessage* message = md->message;
    
	if (opts.showtopics)
	{
		memcpy(messageBuffer,(char*)message->payload,(int)message->payloadlen);
		                		
	}

	if (opts.nodelimiter)
        printf("\r\n%.*s\r\n", (int)message->payloadlen, (char*)message->payload);
    
	else 
        printf("\r\n%.*s%s\r\n", (int)message->payloadlen, (char*)message->payload, opts.delimiter);
      
    if(messageBuffer[0] == '0') 
    {
        Clear_LCD ();
        Puts_LCD( "message 0");
        __delay_ms(2000);
    };
    if(messageBuffer[0] == '1')
    {
        Clear_LCD ();
        Puts_LCD( "message 1");
        __delay_ms(2000);
    };
        
}
 
void PublishTopic_t(unsigned int t)
    {
    
    uint8_t dataPublish[100] ;
    MQTTMessage message_temp ;
    sprintf(dataPublish,"{\"temperatura\": %d}", t);    
    message_temp.payload = (char*)dataPublish;
    message_temp.payloadlen = strlen(dataPublish);
    message_temp.qos = 0;
    message_temp.retained = 0;
    message_temp.dup = 0;
    MQTTPublish(&c, "/system_your_monitoring/t:", &message_temp);
    
}

void PublishTopic_p (unsigned int p)
    {
    
    uint8_t dataPublish[100] ;
    MQTTMessage message_pressure ;
    sprintf(dataPublish,"{\"pressure\": %d}", p);    
    message_pressure.payload = (char*)dataPublish;
    message_pressure.payloadlen = strlen(dataPublish);
    message_pressure.qos = 0;
    message_pressure.dup = 0;
    MQTTPublish(&c, "/system_your_monitoring/p:", &message_pressure);
    
}


void PublishTopic_h (unsigned int h)
    {
    
    uint8_t dataPublish[100] ;
    MQTTMessage message_humidity ;
    sprintf(dataPublish,"{\"humidity\": %d}", h);    
    message_humidity.payload = (char*)dataPublish;
    message_humidity.payloadlen = strlen(dataPublish);
    message_humidity.qos = 0;
    message_humidity.dup = 0;
    MQTTPublish(&c, "/system_your_monitoring/p:", &message_humidity);
    
}


void SubscribeTopic(void){
    int8_t rc ;
    rc = MQTTSubscribe(&c, "/system_your_monitoring/i", opts.qos, messageArrived);
	if(rc == 0) {
        Clear_LCD ();
        Puts_LCD( "Subscribed Sucess:");
        Position_LCD(1, 0);
        Puts_LCD( "system_your_monitoring/i");

    }
    else {
    
         Clear_LCD ();
         Puts_LCD( "Subscribed Error:");
         }
}


//---------------------------------END_MQTT--------------------------------------------------------


int temperature = 789;
int humidity = 0;
int pressure = 0;

uint8_t s_humidity[5];
uint8_t s_preasure[5];
uint8_t s_tmp[5];


uint8_t read_buffer[DATA_BUF_SIZE] ;

uint8_t write_buffer_len = 0;
uint8_t write_buffer[DATA_BUF_SIZE] ;

#define IP_STATE_NO_SOCKET	0
#define IP_STATE_SOCKET		1
#define IP_STATE_LISTEN     2
#define IP_STATE_CLOSE		3
#define IP_STATE_ECHO		4
#define IP_STATE_GREETING   5
#define IP_STATE_DATA		IP_STATE_ECHO

uint8_t sock_state=IP_STATE_NO_SOCKET;



    wiz_NetInfo netInfo = { .mac = {0x00, 0x08, 0xdc, 0xab, 0xcd, 0xef}, 
    .ip = {192, 168, 12, 106}, 
    .sn = {255, 255, 255, 0}, 
    .gw = {192, 168, 12, 1}}; 
    
    
    


void cs_sel() {
    
	LATCbits.LATC1=0;
	LATCbits.LATC2=1;
}

void cs_desel() {
	LATCbits.LATC1=1;
	LATCbits.LATC2=0;
}

uint8_t spi_rb(void) {

    unsigned char trash;
    while(SPI2STATbits.SRXMPT == 0);
    SPI2BUF = 0;
    while(SPI2STATbits.SRXMPT == 1 );
    trash = SPI2BUF; // clear BF flag
    return trash; 
}

void spi_wb(uint8_t b) {
    
    unsigned char trash;
    while(SPI2STATbits.SRXMPT == 0);
    SPI2BUF = b;
    while(SPI2STATbits.SRXMPT == 1 );
    trash = SPI2BUF;
    return; 

}




void ip_init(void){
    cs_desel();
    __delay_ms(1);
    cs_sel();
    __delay_ms(1);
    reg_wizchip_cs_cbfunc(cs_sel, cs_desel);
   	reg_wizchip_spi_cbfunc(spi_rb, spi_wb);
    //reg_wizchip_spiburst_cbfunc(w5500_read_burst, w5500_write_burst);


    
    __delay_ms(10);
    wizphy_reset();
    __delay_ms(10);
    //wizchip_init(bufSize, bufSize);
    __delay_ms(10);
    wizchip_setnetinfo(&netInfo);
    __delay_ms(10);
    wizchip_getnetinfo(&netInfo);
    __delay_ms(10);

	sock_state=IP_STATE_NO_SOCKET;
}


const char http_200_header[] =
        "HTTP/1.0 200 OK\r\n"
        "Content-Type: text/html; charset=windows-1251\r\n"
        "Server: k46_P24\r\n"
        "\r\n";


const char http_404_header[] =
        "HTTP/1.0 404 Not Found\r\n"
        "Content-Type: text/html;"
        "Server: k46_P24\r\n"
        "\r\n"
        "<pre>Page not found\r\n\r\n";

int32_t loopback_tcps(uint8_t sn, uint8_t* buf, uint16_t port)
{
   int32_t ret;
   uint16_t size = 0, sentsize=0;
   uint8_t *url;
   

   

   switch(getSn_SR(sn))
   {
      case SOCK_ESTABLISHED :
         if(getSn_IR(sn) & Sn_IR_CON)
         {
            printf("%d:Connected\r\n",sn);
            setSn_IR(sn,Sn_IR_CON);
         }
         if((size = getSn_RX_RSR(sn)) > 0)
         {
            if(size > DATA_BUF_SIZE) size = DATA_BUF_SIZE;
            ret = recv(sn,buf,size);

            if(ret <= 0)
            return ret;

            sentsize = 0;



          
            if(memcmp(buf, "GET ", 4)==0)
            {
             
             url = buf + 4;

               
               if(memcmp(url, "/test", 5)==0)
                  {
               strcpy(buf,http_200_header);
               strcat(buf,"<h3 style=\"text-align:center;\"> System  K46_WEB <h3>");
               strcat(buf,"<hr color=#000080>\r\n");
               strcat(buf,"<h3 style=\"text-align:center;\"> Temp: ");
               strcat(buf,s_tmp);
               strcat(buf,"C<h3>\r\n");
               
               strcat(buf,"<h3 style=\"text-align:center;\"> Preasure: ");
               strcat(buf,s_preasure);
               strcat(buf,"mmHg<h3>\r\n");
               
               strcat(buf,"<h3 style=\"text-align:center;\"> Humidity: ");
               strcat(buf,s_humidity);
               strcat(buf,"%<h3>\r\n");
               
               strcat(buf,"<hr color=#000080>\r\n");
              }
              else
              {
               strcpy(buf,http_404_header);
              }
              size=strlen(buf);
          
            //??? ?????? 


              //sending answer
              while(size != sentsize)
             {
              ret = send(sn,buf+sentsize,size-sentsize);
               if(ret < 0)
               {
                close(sn);
                return ret;
               }
               sentsize += ret; // Don't care SOCKERR_BUSY, because it is zero.
             }
            }

            //??? ? ???????????? ???? ??????????
            //ending
            disconnect(sn);

         }
         break;
      case SOCK_CLOSE_WAIT :
         printf("%d:CloseWait\r\n",sn);
         if((ret=disconnect(sn)) != SOCK_OK) return ret;
         printf("%d:Closed\r\n",sn);
         break;
      case SOCK_INIT :
          printf("%d:Listen, port [%d]\r\n",sn, port);
         if( (ret = listen(sn)) != SOCK_OK) return ret;
         break;
      case SOCK_CLOSED:
         printf("%d:LBTStart\r\n",sn);
         if((ret=socket(sn,Sn_MR_TCP,port,0x00)) != sn)
            return ret;
         printf("%d:Opened\r\n",sn);
         break;
      default:
         break;
   }
   return 1;
}

int main(void)
{           
           
            unsigned char tmp_var;
            
            PIN_MANAGER_Initialize();
            CLOCK_Initialize();
            SPI2_Initialize();
            LCD_init();
            Puts_LCD( "TEST_PMP_MODE 1602");
            __delay_ms(100);
            Position_LCD(1,4);
            Puts_LCD( "NEW LIB_PMP");
            __delay_ms(1000);
            

            
            ip_init();

            wizchip_setnetinfo(&netInfo);
            wizchip_getnetinfo(&netInfo);
            
            
            //----------------------------MQTT_init-------------------------------
                
                int8_t rc = 0;
                uint8_t buf[1024];
                
                
                while(!ConnectNetwork(&n, targetIP, targetPort));
                NewNetwork(&n, TCP_SOCKET);
                MQTTClientInit(&c,&n,1000,buf,sizeof(buf),tempBuffer,2048);
    
                MQTTPacket_connectData data = MQTTPacket_connectData_initializer;
                data.willFlag = 0;
                data.MQTTVersion = 3;
                data.clientID.cstring = opts.clientid;
                data.username.cstring = opts.username;
                data.password.cstring = opts.password;

                data.keepAliveInterval = 60;
                data.cleansession = 1;
                /*MQTT Connect - send an MQTT connect packet down the network and wait for a Connack*/
                rc = MQTTConnect(&c, &data);
    
                SubscribeTopic();
    
                //----------------------END_MQTT_init------------------------------
    
            
                unsigned char time_tick1=0;
                unsigned char time_tick2=0;
                
    while (1)
            {   

                    
                     
                     BME280_init();
                     temperature = readTemp();
                     __delay_ms(10);
                     humidity = readHumidity();
                     __delay_ms(10);
                     pressure = readPressure();
                     
                    sprintf(s_preasure, "%d", pressure);
                    sprintf(s_tmp, "%d", temperature);
                    sprintf(s_humidity, "%d", humidity);
                    
                    
                    
                     

                     //Clear_LCD ();
                     //wizchip_getnetinfo(&netInfo);
                     //LCD_write( SEND_PMP_DATA,(netInfo.ip[0]/100)%10+0x30);
                     //LCD_write( SEND_PMP_DATA,(netInfo.ip[0]/10)%10+0x30);
                     //LCD_write( SEND_PMP_DATA,netInfo.ip[0]%10+0x30);
                     //LCD_write( SEND_PMP_DATA, 0x2C);
                     //LCD_write( SEND_PMP_DATA,(netInfo.ip[1]/100)%10+0x30);
                     //LCD_write( SEND_PMP_DATA,(netInfo.ip[1]/10)%10+0x30);
                     //LCD_write( SEND_PMP_DATA,netInfo.ip[1]%10+0x30);
                     //LCD_write( SEND_PMP_DATA, 0x2C);
                     //LCD_write( SEND_PMP_DATA,(netInfo.ip[2]/100)%10+0x30);
                     //LCD_write( SEND_PMP_DATA,(netInfo.ip[2]/10)%10+0x30);
                     //LCD_write( SEND_PMP_DATA,netInfo.ip[2]%10+0x30);
                     //LCD_write( SEND_PMP_DATA, 0x2C);
                     //LCD_write( SEND_PMP_DATA,(netInfo.ip[3]/100)%10+0x30);
                     //LCD_write( SEND_PMP_DATA,(netInfo.ip[3]/10)%10+0x30);
                     //LCD_write( SEND_PMP_DATA,netInfo.ip[3]%10+0x30);
                     //__delay_ms(300);
                     

                    loopback_tcps(1, read_buffer, 80);
                    
                    
                    
                    //-----------------------------------------------
                    
                    time_tick1++;
                    time_tick2++;
                    MQTTYield(&c, data.keepAliveInterval);
                    
                    if(time_tick1>100) 
                    {
                        time_tick1=0;
                        
                        PublishTopic_t(temperature); 
                        __delay_ms(50);
                        PublishTopic_p(pressure);
                        __delay_ms(50);
                        PublishTopic_h(humidity);
                    }
                    
                    
                    
                    if(time_tick2>25) 
                    {
                     time_tick2=0;
                     Clear_LCD ();
                     Puts_LCD( "T->");
    
                     tmp_var = (temperature/100)%10;
                     if(tmp_var>0) LCD_write( SEND_PMP_DATA, tmp_var + 0x30);
                     tmp_var = (temperature/10)%10;
                     if(tmp_var>0) LCD_write( SEND_PMP_DATA, tmp_var + 0x30);
                     LCD_write( SEND_PMP_DATA, ((temperature%10))+0x30);
                     LCD_write( SEND_PMP_DATA, 0xB2);
                     LCD_write( SEND_PMP_DATA, 0x43);
                     LCD_write( SEND_PMP_DATA, 0x2C);
                     
                     
                     Position_LCD(0,9);
                     Puts_LCD( "H->");
                     
                     tmp_var = (humidity/100)%10;
                     if(tmp_var>0) LCD_write( SEND_PMP_DATA, tmp_var + 0x30);
                     tmp_var = (humidity/10)%10;
                     if(tmp_var>0) LCD_write( SEND_PMP_DATA, tmp_var + 0x30);
                     LCD_write( SEND_PMP_DATA, ((humidity%10))+0x30);
                     LCD_write( SEND_PMP_DATA, 0x25);
                     
                     Position_LCD(1, 0);
                     Puts_LCD( "P->");
                     
                     tmp_var = (pressure/1000)%10;
                     if(tmp_var>0) LCD_write( SEND_PMP_DATA, tmp_var + 0x30);
                     tmp_var = (pressure/100)%10;
                     if(tmp_var>0) LCD_write( SEND_PMP_DATA, tmp_var + 0x30);
                     tmp_var = (pressure/10)%10;
                     if(tmp_var>0) LCD_write( SEND_PMP_DATA, tmp_var + 0x30);
                     LCD_write( SEND_PMP_DATA, ((pressure%10))+0x30);
                     
                     Puts_LCD( " mmHg");
                        
                        
                        
                        
                    }
                    
                    
                    
                    //-----------------------------------------------
                     


    }

    return 1;
}

