//
//  UIDevice+QianKa.h
//  MakeMoney
//
//  Created by Pellet Mo on 15/10/30.
//
//

#import <UIKit/UIKit.h>

@interface UIDevice (QianKa)
-(double)QK_systemOpenTime;
-(char)QK_isBatteryPluggedIn;
-(char)QK_isBatteryCharging;
-(unsigned long long)QK_networkStatus;

- (double)QK_batteryCapacityLeft;
- (id)QK_bssid;
- (id)QK_description;
- (void)QK_enableMonitoringBattery;
- (id)QK_freeDiskspace;

- (_Bool)QK_isJailBreak;
- (id)QK_localIP;
- (id)QK_localMAC;
- (double)QK_screenBrightness;
- (id)QK_ssid;
- (double)QK_systemOpenTime;
- (double)QK_systemRunningTime;
- (id)QK_totalDiskspace;
- (id)__QK_localMAC;
- (id)fetchSSIDInfo;


- (id) modelName;
@end
