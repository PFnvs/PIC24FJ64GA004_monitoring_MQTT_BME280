#ifndef p24FJ64GA004_H
#define	p24FJ64GA004_H
#include <p24FJ64GA004.h>

#endif	/* XC_HEADER_TEMPLATE_H */


#ifndef _DHCP_H_
#define _DHCP_H_

#ifdef __cplusplus
extern "C" {
#endif

/*
 * @brief 
 * @details If you want to display debug & processing message, Define _DHCP_DEBUG_ 
 * @note    If defined, it depends on <stdio.h>
 */
//#define _DHCP_DEBUG_


/* Retry to processing DHCP */
#define	MAX_DHCP_RETRY          2        ///< Maximum retry count
#define	DHCP_WAIT_TIME          10       ///< Wait Time 10s


/* UDP port numbers for DHCP */
#define DHCP_SERVER_PORT      	67	      ///< DHCP server port number
#define DHCP_CLIENT_PORT         68	      ///< DHCP client port number


#define MAGIC_COOKIE             0x63825363  ///< You should not modify it number.

#define DCHP_HOST_NAME           "WIZnet\0"

/* 
 * @brief return value of @ref DHCP_run()
 */
enum
{
   DHCP_FAILED = 0,  ///< Processing Fail
   DHCP_RUNNING,     ///< Processing DHCP protocol
   DHCP_IP_ASSIGN,   ///< First Occupy IP from DHPC server      (if cbfunc == null, act as default default_ip_assign)
   DHCP_IP_CHANGED,  ///< Change IP address by new ip from DHCP (if cbfunc == null, act as default default_ip_update)
   DHCP_IP_LEASED,   ///< Stand by 
   DHCP_STOPPED      ///< Stop processing DHCP protocol
};

/*
 * @brief DHCP client initialization (outside of the main loop)
 * @param s   - socket number
 * @param buf - buffer for processing DHCP message
 */
void DHCP_init(uint8_t s, uint8_t * buf);

/*
 * @brief DHCP 1s Tick Timer handler
 * @note SHOULD BE register to your system 1s Tick timer handler 
 */
void DHCP_time_handler(void);

/* 
 * @brief Register call back function 
 * @param ip_assign   - callback func when IP is assigned from DHCP server first
 * @param ip_update   - callback func when IP is changed
 * @param ip_conflict - callback func when the assigned IP is conflict with others.
 */
void reg_dhcp_cbfunc(void(*ip_assign)(void), void(*ip_update)(void), void(*ip_conflict)(void));

/*
 * @brief DHCP client in the main loop
 * @return    The value is as the follow \n
 *            @ref DHCP_FAILED     \n
 *            @ref DHCP_RUNNING    \n
 *            @ref DHCP_IP_ASSIGN  \n
 *            @ref DHCP_IP_CHANGED \n
 * 			  @ref DHCP_IP_LEASED  \n
 *            @ref DHCP_STOPPED    \n
 *
 * @note This function is always called by you main task.
 */ 
uint8_t DHCP_run(void);

/*
 * @brief Stop DHCP processing
 * @note If you want to restart. call DHCP_init() and DHCP_run()
 */ 
void    DHCP_stop(void);

/* Get Network information assigned from DHCP server */
/*
 * @brief Get IP address
 * @param ip  - IP address to be returned
 */
void getIPfromDHCP(uint8_t* ip);
/*
 * @brief Get Gateway address
 * @param ip  - Gateway address to be returned
 */
void getGWfromDHCP(uint8_t* ip);
/*
 * @brief Get Subnet mask value
 * @param ip  - Subnet mask to be returned
 */
void getSNfromDHCP(uint8_t* ip);
/*
 * @brief Get DNS address
 * @param ip  - DNS address to be returned
 */
void getDNSfromDHCP(uint8_t* ip);

/*
 * @brief Get the leased time by DHCP sever
 * @return unit 1s
 */
uint32_t getDHCPLeasetime(void);

#ifdef __cplusplus
}
#endif

#endif	/* _DHCP_H_ */
