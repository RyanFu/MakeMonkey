//
//  BaseParameter.m
//  MakeMoney
//
//  Created by Pellet Mo on 15/10/28.
//
//

#import "BaseParameter.h"
#import <IOKit/IOPowerSources.h>
#import <IOKit/IOPSKeys.h>
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import "IPAddress.h"
#import <AdSupport/AdSupport.h>
#import "SSKeychain.h"
#import "UIDevice+QianKa.h"
#import "OpenUDID.h"
@implementation BaseParameter

+ (id) sharedInstance {
    static BaseParameter* instance;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    return instance;
}
- (id) init {
    self = [super init];
    if (self) {
        self.localIP =    [self deviceIPAddress];
        self.bundleid = @"com.ou.app";
        self.version = @"2.0.2015092801";
    }
    return self;
}


-(NSString *)openudid{
    NSString *udid =  [NSClassFromString(@"OpenUDID") value];
    return udid;
}
-(NSString *)push{
    return @"1";
}
-(NSString *)localMAC{
    //  return   [[UIDevice currentDevice] QK_localMAC];
    return @"02:00:00:00:00:00";
}
-(NSString *)networkStatus{
    
    //  NSNumber *result =  [NSNumber numberWithUnsignedInteger:[[UIDevice currentDevice]QK_networkStatus]];
    //    NSString *res = [NSString stringWithFormat:@"%@",result];
    return @"5";
}

-(NSString *)isBatteryCharging{
    NSNumber *result =   [NSNumber numberWithBool:[[UIDevice currentDevice] QK_isBatteryCharging]];
    NSString *res = [NSString stringWithFormat:@"%@",result];
    return  res;
}

-(NSString *)isBatteryPluggedIn{
    NSNumber *result =  [NSNumber numberWithBool:[[UIDevice currentDevice] QK_isBatteryPluggedIn]];
    NSString *res = [NSString stringWithFormat:@"%@",result];
    return res;
}

-(NSString *)systemOpenTime{
    double result = [[NSClassFromString(@"UIDevice") currentDevice] QK_systemOpenTime];
    return   [NSString stringWithFormat:@"%.0f",result];
}
-(NSString *)deviceID{
    NSString * result = [[NSClassFromString(@"JSBusinessManager") sharedInstance] deviceID];
    NSLog(@"result:%@",result);
    //   NSString * result =  [[[UIDevice currentDevice] identifierForVendor]UUIDString];
    return result;
}
-(NSString *)uuid{
    NSError *error = nil;
    NSString *password = [SSKeychain passwordForService:@"com.ou.app" account:@"uuid" error:&error];
    NSLog(@"password:%@",password);
    if ([error code] == SSKeychainErrorNotFound) {
        NSLog(@"Password not found");
        NSLog(@"error:%@",error);
    }
    return password;
}
-(NSString *)freeDiskspace{
    //    NSString *result = [NSString stringWithFormat:@"%@",[[UIDevice currentDevice ] QK_freeDiskspace]];
    //    NSLog(@"freeDiskspace:%@",result);
    //    return result;
    NSDictionary *systemAttributes = [[NSFileManager defaultManager] fileSystemAttributesAtPath:NSHomeDirectory()];
    NSString *diskFreeSize = [systemAttributes objectForKey:@"NSFileSystemFreeSize"];
    //    NSLog(@"可用空间：%.0f MB", [diskFreeSize floatValue]/1024/1024);
    NSString *str = [NSString stringWithFormat:@"%.0f",[diskFreeSize floatValue]/1024/1024];
    return str;
}

-(NSString *)totalDiskspace{
    //
    //    NSString *result = [NSString stringWithFormat:@"%@",[[UIDevice currentDevice ] QK_totalDiskspace]];
    //    NSLog(@"totalDiskspace:%@",result);
    //    return result;
    NSDictionary *systemAttributes = [[NSFileManager defaultManager] fileSystemAttributesAtPath:NSHomeDirectory()];
    NSString *diskTotalSize = [systemAttributes objectForKey:@"NSFileSystemSize"];
    //    NSLog(@"磁盘大小：%.0f MB", [diskTotalSize floatValue]/1024/1024);
    NSString *str = [NSString stringWithFormat:@"%.0f",[diskTotalSize floatValue]/1024/1024];
    return str;
}
-(NSString *)model{
    return  [[NSClassFromString(@"UIDevice") currentDevice] modelName];
}
-(NSString *)device{
    return  [[NSClassFromString(@"UIDevice") currentDevice] modelName];
}

-(NSString *)idfa{
    return  [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
}
-(NSString *)system{
    
    NSString *sy =[NSString stringWithFormat:@"%f",[[[UIDevice currentDevice] systemVersion] floatValue]];
    NSString * outNumber = [NSString stringWithFormat:@"%@",@(sy.floatValue)];
    
    return outNumber;
}

-(NSString *)deviceIPAddress{
    InitAddresses();
    GetIPAddresses();
    GetHWAddresses();
    //    NSLog(@"地址：%@", [NSString stringWithFormat:@"%s",ip_names[1]]);
    return [NSString stringWithFormat:@"%s",ip_names[1]];
}


- (id)fetchSSIDInfo {
    NSArray *ifs = ( id)CNCopySupportedInterfaces();
    //    NSLog(@"Supported interfaces: %@", ifs);
    id info = nil;
    for (NSString *ifnam in ifs) {
        info = ( id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        //        NSLog(@"%@ => %@", ifnam, info);
        if (info && [info count]) { break; }
    }
    return info;
}

-(NSString *)bssid{
    NSDictionary *ifs = [self fetchSSIDInfo];
    NSString *bssid = [ifs objectForKey:@"BSSID"];
    return bssid;
}
-(NSString *)ssid{
    NSDictionary *ifs = [self fetchSSIDInfo];
    NSString *ssid = [ifs objectForKey:@"SSID"];
    return ssid;
}

-(NSString *)carrier{
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [info subscriberCellularProvider];
    NSString *mCarrier = [NSString stringWithFormat:@"%@",[carrier carrierName]];
    return mCarrier;
}

-(NSString *)batteryCapacityLeft{
    NSString *left = [NSString stringWithFormat:@"%d",(int)[self getCurrentBatteryLevel]];
    return left;
}
//LJR1AmH5ZwRjBQtjZTWxMt==

-(NSString *)systemRunningTime{
    //    NSProcessInfo *info = [NSProcessInfo processInfo];
    //    NSString *runTime = [NSString stringWithFormat:@"%@",  [NSNumber numberWithDouble:info.systemUptime/3600.0]];
    double sys = [[UIDevice currentDevice] QK_systemRunningTime];
    NSString *runTime = [NSString stringWithFormat:@"%@",[NSNumber numberWithDouble:sys]];
    NSLog(@"systemRunningTime:%@",runTime);
    return runTime;
}

-(NSString *)screenBrightness{
    //    NSString *screen = [NSString stringWithFormat:@"%@",  [NSNumber numberWithDouble:[[UIScreen mainScreen] brightness]]];
    
    double val = ((double)arc4random() / 0x100000000);
    NSString *screen =   [NSString stringWithFormat:@"%@",[NSNumber numberWithDouble:val]];
    return screen;
}
-(NSString *)jailbroken{
    bool b =   [[UIDevice currentDevice] QK_isJailBreak];
    return  [NSString stringWithFormat:@"%d",b ];
}

-(NSString *)timestamp{
    NSTimeInterval recordTime = [[NSDate date] timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%f", recordTime];
    return timeString;
}

-(NSDictionary *)getQKConfig{
    NSString *QKConfigPath = [[self getQianKapath] stringByAppendingString:@"/QKConfig.plist"];
    //    VLog(QKConfigPath);
    NSDictionary *QKConfig = [NSDictionary dictionaryWithContentsOfFile:QKConfigPath];
    
    return QKConfig;
}

-(NSString *)getQianKapath{
    NSDictionary *applicationState= [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/BackBoard/applicationState.plist"];
    NSString *bundlePath= [[[applicationState objectForKey:@"com.ou.app"]objectForKey:@"compatibilityInfo"]objectForKey:@"bundlePath"];
    
    VLog(bundlePath);
    return bundlePath;
}

-(double)getCurrentBatteryLevel
{
    
    //Returns a blob of Power Source information in an opaque CFTypeRef.
    CFTypeRef blob = IOPSCopyPowerSourcesInfo();
    
    //Returns a CFArray of Power Source handles, each of type CFTypeRef.
    CFArrayRef sources = IOPSCopyPowerSourcesList(blob);
    
    CFDictionaryRef pSource = NULL;
    const void *psValue;
    
    //Returns the number of values currently in an array.
    int numOfSources = CFArrayGetCount(sources);
    
    //Error in CFArrayGetCount
    if (numOfSources == 0)
    {
        NSLog(@"Error in CFArrayGetCount");
        return -1.0f;
    }
    
    //Calculating the remaining energy
    for (int i = 0 ; i < numOfSources ; i++)
    {
        //Returns a CFDictionary with readable information about the specific power source.
        pSource = IOPSGetPowerSourceDescription(blob, CFArrayGetValueAtIndex(sources, i));
        if (!pSource)
        {
            NSLog(@"Error in IOPSGetPowerSourceDescription");
            return -1.0f;
        }
        psValue = (CFStringRef)CFDictionaryGetValue(pSource, CFSTR(kIOPSNameKey));
        
        int curCapacity = 0;
        int maxCapacity = 0;
        double percent;
        
        psValue = CFDictionaryGetValue(pSource, CFSTR(kIOPSCurrentCapacityKey));
        CFNumberGetValue((CFNumberRef)psValue, kCFNumberSInt32Type, &curCapacity);
        
        psValue = CFDictionaryGetValue(pSource, CFSTR(kIOPSMaxCapacityKey));
        CFNumberGetValue((CFNumberRef)psValue, kCFNumberSInt32Type, &maxCapacity);
        
        percent = ((double)curCapacity/(double)maxCapacity * 100.0f);
        
        return percent;
    }
    return -1.0f;
}
@end
