//
//  MoneyHandle.m
//  MakeMoney
//
//  Created by Pellet Mo on 15/10/28.
//
//

#import "MoneyHandle.h"
#import "NetHandle.h"
#import "BaseParameter.h"
#import "dlfcn.h"
#import "JSNetworkHelper.h"
#import "OpenUDID.h"
#import "JSLogManager.h"
#import "CustomRequestManager.h"
#import "WebSocketHelper.h"
//#import <Preferences/PSViewController.h>
@interface MoneyHandle()
@property (nonatomic,strong)BaseParameter *baseParameter;
@property (nonatomic ,strong)CustomRequestManager *manager;
@end
@implementation MoneyHandle
+ (id) sharedInstance {
    static MoneyHandle* instance;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        baseParameter = [BaseParameter sharedInstance];
        manager = [CustomRequestManager sharedInstance];
    }
    return self;
}
@synthesize baseParameter;
@synthesize manager;


//app	qk_key_1_18-33
//bundleid	com.ou.app
//channel	1
//idfa	9C901799-0FDB-4612-9F6C-6E21420F340A
//uuid	472F4D78-537A-4C97-9DD7-892D93F08FBB
//version	2.0
-(void)settingPhp{
    
    NSDictionary *para = @{@"app":@"qk_key_1_18-33",@"bundleid":@"com.ou.app",@"channel":@"1",@"idfa":baseParameter.idfa,@"uuid":baseParameter.uuid,@"version":@"2.0"};
    VLog(para);
    [manager GET:@"http://api.guo7.com/setting.php" parameters:para success:^(AFHTTPRequestOperation * operation, id responseObject) {
        NSLog(@"settingPhp:%@",responseObject);
        
    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
        NSLog(@"error2:%@",error);
    }];
    
    //    NSURLRequest requestWithURL:<#(NSURL *)#>
//    NSURLRequest
}


-(void)sendMessage{
    [[WebSocketHelper sharedInstance] sendMessage];
}
-(void)setPPcookies{
    //    Hm_lpvt_10dbb09946d5f51563df6644ffaae30a	1448261095
    //    Hm_lvt_10dbb09946d5f51563df6644ffaae30a	1447916915,1447918041,1448092001,1448243416
    //    openInfo	%7B%223598%22%3A1448244141719%7D
    //    ppport	10091
    //    scheme	cn.qm.sleepmusic
    //    1c6abf7a3ce9f84965344760d015a2ae	1
    //    PHPSESSID	a8qk7ais1j4teuj34ar4ltijt4
    NSDictionary *para = @{@"Hm_lpvt_10dbb09946d5f51563df6644ffaae30a":@"",
                           @"Hm_lvt_10dbb09946d5f51563df6644ffaae30a":@"",
                           @"openInfo":@"",
                           @"ppport":@"",
                           @"scheme":@"",
                           @"1c6abf7a3ce9f84965344760d015a2ae":@"",
                           @"PHPSESSID":@""};
    //    NSValue *value = [N]
    NSString *str = [NSString stringWithFormat:@"%@",para];
    [manager.requestSerializer setValue:str forHTTPHeaderField:@"Cookie"];
}
//#import "MobileGestalt.h"
-(int)setUp{
    
    NSLog(@"start run");
    dlopen("/usr/bin/QiankaKey.dylib", RTLD_NOW);
    
    [self queryDeviceId];
    //    [self sendMessage];
    //        [self getuser];
    //    [self settingPhp];
    //    NSLog(@"进程信息：%@",[NetHandle runningProcesses]);
    //    [self getdayjournals];
    //    [self getuseruuid];
    //    [self setting];
    //    [self getCookies];
    NSLog(@"start end");
    
    //    [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask][0];
    
    return 0;
}


-(void) queryDeviceId{
    void* handle =   dlopen("/usr/lib/libMobileGestalt.dylib", 9);
    id (*fun)(id) =  dlsym(handle, "MGCopyAnswer");
    //    void * fun =  dlsym(handle, "MGCopyAnswer");
    id DieId  = fun(@"DieId");
    NSString *DieIds =  [NSString stringWithFormat:@"%@",DieId];
    NSLog(@"DieIds:%@",DieIds);
}

-(void)test{
    /**
     AFNetworkReachabilityStatusUnknown          = -1,  // 未知
     AFNetworkReachabilityStatusNotReachable     = 0,   // 无连接
     AFNetworkReachabilityStatusReachableViaWWAN = 1,   // 3G 花钱
     AFNetworkReachabilityStatusReachableViaWiFi = 2,   // 局域网络,不花钱
     */
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    // 检测网络连接的单例,网络变化时的回调方法
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"网络状态%d", status);
    }];
}


//http://m.qianka.com/api/h5/home/index

-(void)getHomeIndex{
    [manager GET:@"http://m.qianka.com/api/h5/home/index" parameters:nil success:^(AFHTTPRequestOperation * operation, id responseObject) {
        NSLog(@"getHomeIndex:%@",responseObject);
        
    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
        NSLog(@"error2:%@",error);
    }];
}

//http://m.qianka.com/api/h5/qiankakey/disable
-(void)postDisable{
    //        "bid": "com.ou.app",
    //        "version": "2.0.2015092801"
    NSDictionary *para = @{@"bid":@"com.ou.app",@"version":@"2.0.2015092801"};
    
    [manager POST:@"http://m.qianka.com/api/h5/qiankakey/disable" parameters:para success:^(AFHTTPRequestOperation * operation, id responseObject) {
        NSLog(@"postDisable:%@",responseObject);
        
    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
        NSLog(@"error2:%@",error);
    }];
}


//http://m.qianka.com/api/h5/subtask/get?task_id=117480
-(void)getTask{
    NSNumber *num = [NSNumber numberWithInt:117480];
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:
                       num,@"task_id", nil];
    NSLog(@"getTask:%@",dic);
    [manager GET:@"http://m.qianka.com/api/h5/subtask/get" parameters:dic success:^(AFHTTPRequestOperation * operation, id responseObject) {
        NSLog(@"getTask:%@",responseObject);
        
    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
        NSLog(@"error2:%@",error);
    }];
}



//http://m.qianka.com/api/h5/subtask/start
-(void)taskStart{
    NSNumber *num = [NSNumber numberWithInt:117480];
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:
                       num,@"task_id", nil];
    NSLog(@"taskStartDic:%@",dic);
    [manager POST:@"http://m.qianka.com/api/h5/subtask/start" parameters:dic success:^(AFHTTPRequestOperation * operation, id responseObject) {
        NSLog(@"taskStart:%@",responseObject);
    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
        NSLog(@"error2:%@",error);
    }];
}

//http://gaos.guo7.com/zq_api/api/getoneself_info
-(void)getoneselfinfo{
    NSNumber *num = [NSNumber numberWithInt:117427];
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:
                       num,@"task_id", nil];
    NSLog(@"getoneselfinfoDIC:%@",dic);
    id sig =  [NSClassFromString(@"JSNetworkHelper") sigParameters:dic key:MD5KEY];
    [manager POST:@"http://gaos.guo7.com/zq_api/api/getoneself_info" parameters:sig success:^(AFHTTPRequestOperation * operation, id responseObject) {
        NSLog(@"getoneselfinfo:%@",responseObject);
        
    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
        NSLog(@"error2:%@",error);
    }];
}


//http://m.qianka.com/api/h5/subtask/fetch
/**
 *  获取任务数据
 */
-(void)fetch{
    
    
    [manager GET:@"http://m.qianka.com/api/h5/subtask/fetch" parameters:nil success:^(AFHTTPRequestOperation * operation, id responseObject) {
        NSLog(@"fetch:%@",responseObject);
        
    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
        NSLog(@"error2:%@",error);
    }];
}

//http://m.qianka.com/api/h5/qiankakey/setting
/**
 *
 */
-(void)settingCompletionHandler:(void (^)(NSDictionary *dictionary, NSError *error))block
{
    [manager GET:@"http://m.qianka.com/api/h5/qiankakey/setting" parameters:nil success:^(AFHTTPRequestOperation * operation, id responseObject) {
        NSDictionary *dictionary= responseObject;
        if (block) {
            block(dictionary,nil);
        }
    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
        if (block) {
            block([NSDictionary dictionary],error);
        }
    }];
}

/**
 * getdayjournals
 */
-(void)getdayjournals{
    long long open_num  = [[NSClassFromString(@"JSLogManager") sharedInstance] countOfDaysHasBeenOpened];
    NSNumber * nub = [NSNumber numberWithInteger:open_num];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                         @"com.ou.app",@"bundleid",
                         baseParameter.device,@"device",
                         baseParameter.idfa,@"idfa",
                         nub,@"open_num",
                         baseParameter.openudid,@"openudid",
                         baseParameter.system,@"operating_system",
                         @"640x1136" ,@"resolution_ratio",
                         baseParameter.uuid,@"uuid",
                         @"2.0.2015092801", @"version",
                         nil];
    NSLog(@"dayDict:%@",dic);
    id sig2 =[NSClassFromString(@"JSNetworkHelper") sigParameters:dic key:MD5KEY];
    [manager POST:@"http://gaos.guo7.com/zq_api/api/day_journals" parameters:sig2 success:^(AFHTTPRequestOperation * operation, id responseObject) {
        NSLog(@"sig2----responseObject:%@",responseObject);
        
    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
        NSLog(@"error2:%@",error);
    }];
}

//http://x.qianka.com/assistant/weixin/login
/**
 *  登陆
 */
-(void)loginWith:(id)sig CompletionHandler:(void (^)(NSDictionary *dictionary, NSError *error))block{
    
    [manager POST:@"http://x.qianka.com/assistant/weixin/login" parameters:sig success:^(AFHTTPRequestOperation * operation, id responseObject) {
        NSLog(@"wxlogin :%@",responseObject);
        NSDictionary *dictionary= responseObject;
        if (block) {
            block(dictionary,nil);
        }
    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
        if (block) {
            block([NSDictionary dictionary],error);
        }
    }];
}

/**
 *
 */
-(void)getuser{
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:
                       baseParameter.uuid,@"uuid",
                       baseParameter.idfa,@"idfa",
                       baseParameter.device,@"device", nil];
    id sig =  [NSClassFromString(@"JSNetworkHelper") sigParameters:dic key:MD5KEY];
    NSLog(@"id:%@",sig);
    
    //获取根据设备信息获取用户信息
    [manager POST:@"http://gaos.guo7.com/zq_api/api/get_user" parameters:sig success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"responseObject:%@",responseObject);
        NSDictionary *dic = responseObject;
        NSNumber *user_id=[NSNumber numberWithInteger:[[dic objectForKey:@"id"] integerValue]];
        NSLog(@"%@",user_id);
        //获取session_id；
        [self settingCompletionHandler:^(NSDictionary *dictionary, NSError *error) {
            if (!error) {
                NSLog(@"settingCompletionHandler：%@",dictionary);
                NSDictionary *dataDict =   [dictionary objectForKey:@"data"];
                NSString *session_id=    [dataDict objectForKey:@"session_id"];
                if (session_id.length) {
                    NSDictionary *loginDic = [NSDictionary dictionaryWithObjectsAndKeys:baseParameter.bundleid,@"bundle_id",
                                              @"",@"openid",
                                              session_id,@"session_id",
                                              user_id,@"user_id",
                                              nil];
                    NSLog(@"loginDic:%@",loginDic);
                    id sig =[NSClassFromString(@"JSNetworkHelper") sigParameters:loginDic key:MD5KEY];
                    [sig setObject:baseParameter.idfa forKey:@"idfa"];
                    [sig setObject:baseParameter.uuid forKey:@"uuid"];
                    NSLog(@"sigLogin:%@",sig);
                    [self loginWith:sig CompletionHandler:^(NSDictionary *dictionary, NSError *error) {
                        if (!error) {
                            //                            [self fetch];
                            // [self getuseruuid];
                            [self getoneselfinfo];
                        }
                    }];
                }
            }
        }];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:%@",error);
    }];
}

/**
 * 设置cookies
 */
-(void)setCookies{
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    if (cookies) {
        [manager.requestSerializer setValue:[NSString stringWithFormat:@"%@",cookies] forHTTPHeaderField:@"Cookie"];
    }
}



///**
// *  1.获取登陆请求成功后保存的cookies:
// */
//+ (NSString *)cookieValueWithKey:(NSString *)key
//{
//    NSHTTPCookieStorage *sharedHTTPCookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
//
//    if ([sharedHTTPCookieStorage cookieAcceptPolicy] != NSHTTPCookieAcceptPolicyAlways) {
//        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookieAcceptPolicy:NSHTTPCookieAcceptPolicyAlways];
//    }
//    NSArray         *cookies = [sharedHTTPCookieStorage cookiesForURL:[NSURL URLWithString:@"http://x.qianka.com/assistant/weixin/login"]];
//    NSEnumerator    *enumerator = [cookies objectEnumerator];
//    NSHTTPCookie    *cookie;
//    while (cookie = [enumerator nextObject]) {
//        if ([[cookie name] isEqualToString:key]) {
//            return [NSString stringWithString:[[cookie value] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
//        }
//    }
//    return nil;
//}
//
///**
// *  2.删除cookies (key所对应的cookies)
// */ ///因为cookies保存在NSHTTPCookieStorage.cookies中.这里删除它里边的元素即可.
//+ (void)deleteCookieWithKey:(NSString *)key
//{
//    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
//
//    NSArray *cookies = [NSArray arrayWithArray:[cookieJar cookies]];
//
//    for (NSHTTPCookie *cookie in cookies) {
//        if ([[cookie name] isEqualToString:key]) {
//            [cookieJar deleteCookie:cookie];
//        }
//    }
//}
//


-(void)getCookies{
    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    //    NSArray *cookieAry = [cookieJar cookiesForURL: [NSURL URLWithString: @"http://m.qkcdn.com"]];
    //    VLog(cookieAry);
    NSArray *cookieAry = [NSArray arrayWithArray:[cookieJar cookies]];
    //    VLog(cookieAry);
    for (id cookie in cookieAry) {
        NSLog(@"cookie:%@", cookie);
        [cookieJar deleteCookie: cookie];
    }
    
    
    
    
    //    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}
//
//- (void)saveCookies{
//    NSData *cookiesData = [NSKeyedArchiver archivedDataWithRootObject: [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]];
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setObject: cookiesData forKey: @"sessionCookies"];
//    [defaults synchronize];
//
//}
//- (void)loadCookies{
//    NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData: [[NSUserDefaults standardUserDefaults] objectForKey: @"sessionCookies"]];
//    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
//
//    for (NSHTTPCookie *cookie in cookies){
//        [cookieStorage setCookie: cookie];
//    }
//}
//



-(void)getuseruuid{
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:
                       baseParameter.idfa,@"idfa",
                       nil];
    
    id sig =  [NSClassFromString(@"JSNetworkHelper") sigParameters:dic key:MD5KEY];
    NSLog(@"id:%@",sig);
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager POST:@"http://gaos.guo7.com/zq_api/api/get_uuid" parameters:sig success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"getuseruuid:%@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:%@",error);
    }];
    
}



@end
