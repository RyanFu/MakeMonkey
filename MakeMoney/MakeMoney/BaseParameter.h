//
//  BaseParameter.h
//  MakeMoney
//
//  Created by Pellet Mo on 15/10/28.
//
//

#import <Foundation/Foundation.h>

@interface BaseParameter : NSObject
@property (nonatomic, copy) NSString * batteryCapacityLeft;
@property (nonatomic, copy) NSString * bssid;
@property (nonatomic, copy) NSString * bundleid;
@property (nonatomic, copy) NSString * carrier;
@property (nonatomic, copy) NSString * device;
@property (nonatomic, copy) NSString * deviceID;
@property (nonatomic, copy) NSString * freeDiskspace;
@property (nonatomic, copy) NSString * idfa;
@property (nonatomic, copy) NSString * isBatteryCharging;
@property (nonatomic, copy) NSString * isBatteryPluggedIn;
@property (nonatomic, copy) NSString * jailbroken;
@property (nonatomic, copy) NSString * localIP;
@property (nonatomic, copy) NSString * localMAC;
@property (nonatomic, copy) NSString * model;
@property (nonatomic, copy) NSString * networkStatus;
@property (nonatomic, copy) NSString * openudid;
@property (nonatomic, copy) NSString * push;
@property (nonatomic, copy) NSString * screenBrightness;
@property (nonatomic, copy) NSString * sig;
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, copy) NSString * system;
@property (nonatomic, copy) NSString * systemOpenTime;
@property (nonatomic, copy) NSString * systemRunningTime;
@property (nonatomic, copy) NSString * timestamp;
@property (nonatomic, copy) NSString * totalDiskspace;
@property (nonatomic, copy) NSString * uuid;
@property (nonatomic, copy) NSString * version;

+ (id) sharedInstance;
-(NSString *)getQKConfig;
-(NSString *)getQianKapath;
@end
