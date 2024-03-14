#ifndef p24FJ64GA004_H
#define	p24FJ64GA004_H
#include <p24FJ64GA004.h>

#endif	/* XC_HEADER_TEMPLATE_H */

#ifndef	_DNS_H_
#define	_DNS_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
/*
 * @brief Define it for Debug & Monitor DNS processing.
 * @note If defined, it dependens on <stdio.h>
 */
//#define _DNS_DEBUG_

#define	MAX_DNS_BUF_SIZE	256		///< maximum size of DNS buffer. */
/*
 * @brief Maxium length of your queried Domain name 
 * @todo SHOULD BE defined it equal as or greater than your Domain name lenght + null character(1)
 * @note SHOULD BE careful to stack overflow because it is allocated 1.5 times as MAX_DOMAIN_NAME in stack.
 */
#define  MAX_DOMAIN_NAME   128       // for example "www.google.com"

#define	MAX_DNS_RETRY     2        ///< Requery Count
#define	DNS_WAIT_TIME     3        ///< Wait response time. unit 1s.

#define	IPPORT_DOMAIN     53       ///< DNS server port number

#define DNS_MSG_ID         0x1122   ///< ID for DNS message. You can be modifyed it any number
/*
 * @brief DNS process initialize
 * @param s   : Socket number for DNS
 * @param buf : Buffer for DNS message
 */
void DNS_init(uint8_t s, uint8_t * buf);

/*
 * @brief DNS process
 * @details Send DNS query and receive DNS response
 * @param dns_ip        : DNS server ip
 * @param name          : Domain name to be queryed
 * @param ip_from_dns   : IP address from DNS server
 * @return  -1 : failed. @ref MAX_DOMIN_NAME is too small \n
 *           0 : failed  (Timeout or Parse error)\n
 *           1 : success
 * @note This funtion blocks until success or fail. max time = @ref MAX_DNS_RETRY * @ref DNS_WAIT_TIME
 */
int8_t DNS_run(uint8_t * dns_ip, uint8_t * name, uint8_t * ip_from_dns);

/*
 * @brief DNS 1s Tick Timer handler
 * @note SHOULD BE register to your system 1s Tick timer handler 
 */
void DNS_time_handler(void);

#ifdef __cplusplus
}
#endif

#endif	/* _DNS_H_ */


