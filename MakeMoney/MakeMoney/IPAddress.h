//
//  IPAddress.h
//  MakeMoney
//
//  Created by Pellet Mo on 15/10/29.
//
//

#ifndef __MakeMoney__IPAddress__
#define __MakeMoney__IPAddress__

#include <stdio.h>
#define MAXADDRS 32
extern char *if_names[MAXADDRS];
extern char *ip_names[MAXADDRS];
extern char *hw_addrs[MAXADDRS];
extern unsigned long ip_addrs[MAXADDRS];
void InitAddresses();
void FreeAddresses();
void GetIPAddresses();
void GetHWAddresses();
#endif /* defined(__MakeMoney__IPAddress__) */
