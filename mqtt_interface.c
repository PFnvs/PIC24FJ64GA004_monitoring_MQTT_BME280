#include "mqtt_interface.h"
#include "wizchip_conf.h"
#include "socket.h"
#include <string.h>
#include <stdio.h>

unsigned long MilliTimer;

/*
 * @brief MQTT MilliTimer handler
 * @note MUST BE register to your system 1m Tick timer handler.
 */
void MilliTimer_Handler(void) {
	MilliTimer++;
}

/*
 * @brief Timer Initialize
 * @param  timer : pointer to a Timer structure
 *         that contains the configuration information for the Timer.
 */
void TimerInit(Timer* timer) {
	timer->end_time = 0;
}

/*
 * @brief expired Timer
 * @param  timer : pointer to a Timer structure
 *         that contains the configuration information for the Timer.
 */
char TimerIsExpired(Timer* timer) {
	long left = timer->end_time - MilliTimer;
	return (left < 0);
}

/*
 * @brief Countdown millisecond Timer
 * @param  timer : pointer to a Timer structure
 *         that contains the configuration information for the Timer.
 *         timeout : setting timeout millisecond.
 */
void TimerCountdownMS(Timer* timer, unsigned int timeout) {
	timer->end_time = MilliTimer + timeout;
}

/*
 * @brief Countdown second Timer
 * @param  timer : pointer to a Timer structure
 *         that contains the configuration information for the Timer.
 *         timeout : setting timeout millisecond.
 */
void TimerCountdown(Timer* timer, unsigned int timeout) {
	timer->end_time = MilliTimer + (timeout * 1000);
}

/*
 * @brief left millisecond Timer
 * @param  timer : pointer to a Timer structure
 *         that contains the configuration information for the Timer.
 */
int TimerLeftMS(Timer* timer) {
	long left = timer->end_time - MilliTimer;
	return (left < 0) ? 0 : left;
}

/*
 * @brief New network setting
 * @param  n : pointer to a Network structure
 *         that contains the configuration information for the Network.
 *         sn : socket number where x can be (0..7).
 * @retval None
 */
void NewNetwork(Network* n, int sn) {
	n->my_socket = sn;
	n->mqttread = w5x00_read;
	n->mqttwrite = w5x00_write;
	n->disconnect = w5x00_disconnect;
}

/*
 * @brief read function
 * @param  n : pointer to a Network structure
 *         that contains the configuration information for the Network.
 *         buffer : pointer to a read buffer.
 *         len : buffer length.
 * @retval received data length or SOCKERR code
 */
int w5x00_read(Network* n, unsigned char* buffer, int len, long time)
{

	if((getSn_SR(n->my_socket) == SOCK_ESTABLISHED) && (getSn_RX_RSR(n->my_socket)>0))
		return recv(n->my_socket, buffer, len);

	return SOCK_ERROR;
}

/*
 * @brief write function
 * @param  n : pointer to a Network structure
 *         that contains the configuration information for the Network.
 *         buffer : pointer to a read buffer.
 *         len : buffer length.
 * @retval length of data sent or SOCKERR code
 */
int w5x00_write(Network* n, unsigned char* buffer, int len, long time)
{
	if(getSn_SR(n->my_socket) == SOCK_ESTABLISHED)
		return send(n->my_socket, buffer, len);

	return SOCK_ERROR;
}

/*
 * @brief disconnect function
 * @param  n : pointer to a Network structure
 *         that contains the configuration information for the Network.
 */
void w5x00_disconnect(Network* n)
{
	disconnect(n->my_socket);
}

/*
 * @brief connect network function
 * @param  n : pointer to a Network structure
 *         that contains the configuration information for the Network.
 *         ip : server iP.
 *         port : server port.
 */
uint8_t ConnectNetwork(Network* n, uint8_t* ip, uint16_t port)
{
	
    uint8_t ret ;
    uint16_t myport = 5000;	//port W5500 for TCP connection
    
     enum returnCode { ERROR = 0, SUCCESS = 1 };
     // Open TCP socket
            if((ret = socket(n->my_socket,Sn_MR_TCP,myport,0)) == n->my_socket)
            {
              printf("\r\n------socket is no. %d opened success------\r\n", ret);
            }
            else {printf("\r\n--------socket is not opened--------\r\n");
                  return ERROR; }
	
       // Open connect MQTT Broker               
           if( (ret = connect(n->my_socket,ip,port)) == SOCK_OK) 
            {
                printf("\r\n----Open MQTT Broker connect Success ----\r\n"); 
                printf("\r\n");
                return SUCCESS;
            }
              else {printf("\r\n-----Open MQTT Broker connect Error-----\r\n");
                  return ERROR; }
           
   }
