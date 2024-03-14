#ifndef __MQTT_INTERFACE_H_
#define __MQTT_INTERFACE_H_

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif


/*
 * @brief MQTT MilliTimer handler
 * @note MUST BE register to your system 1m Tick timer handler
 */
void MilliTimer_Handler(void);

/*
 * @brief Timer structure
 */
typedef struct Timer Timer;
struct Timer {
	unsigned long systick_period;
	unsigned long end_time;
};

/*
 * @brief Network structure
 */
typedef struct Network Network;
struct Network
{
	int my_socket;
	int (*mqttread) (Network*, unsigned char*, int, long);
	int (*mqttwrite) (Network*, unsigned char*, int, long);
	void (*disconnect) (Network*);
};

/*
 * @brief Timer function
 */
void TimerInit(Timer*);
char TimerIsExpired(Timer*);
void TimerCountdownMS(Timer*, unsigned int);
void TimerCountdown(Timer*, unsigned int);
int TimerLeftMS(Timer*);

/*
 * @brief Network interface porting
 */
int w5x00_read(Network*, unsigned char*, int, long);
int w5x00_write(Network*, unsigned char*, int, long);
void w5x00_disconnect(Network*);
void NewNetwork(Network* n, int sn);
uint8_t ConnectNetwork(Network* n, uint8_t* ip, uint16_t port);

#ifdef __cplusplus
}
#endif

#endif //__MQTT_INTERFACE_H_