//
//  NetHandle.m
//  MakeMoney
//
//  Created by Pellet Mo on 15/10/28.
//
//

#import "NetHandle.h"

@implementation NetHandle
+ (id) sharedInstance {
    static NetHandle* instance;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    return instance;
}
+(id)getAFHTTPRequestOperationManagerPutheaderPost
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //    NSString *phone =    [SYSTEM_USERDEFAULTS objectForKey:Y_phone];
    //    NSString *password = [SYSTEM_USERDEFAULTS objectForKey:Y_password];
    //    //    password = [DES3Util encrypt:password];
    //    NSString *parm =[NSString stringWithFormat:@"%@&#%@",phone,password];
    //    parm =   [DES3Util encrypt:parm];
    //
    //    //      manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //    [manager.requestSerializer setValue:parm forHTTPHeaderField:@"user_info"];
    return  manager;
}

//http://gaos.guo7.com/zq_api/api/get_user
-(void)getUserWith:(NSDictionary *)parameters CompletionHandler:(void (^)(NSDictionary *dictionary, NSError *error))block
{
    AFHTTPRequestOperationManager *manager = [NetHandle getAFHTTPRequestOperationManagerPutheaderPost];
    [manager POST:@"http://gaos.guo7.com/zq_api/api/get_user" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dictionary= responseObject;
        if (block) {
            block(dictionary,nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            block([NSDictionary dictionary],error);
        }
    }];
    
}


-(void)queryAppInfoWith:(NSDictionary *)parameters CompletionHandler:(void (^)(NSDictionary *dictionary, NSError *error))block
{
    AFHTTPRequestOperationManager *manager = [NetHandle getAFHTTPRequestOperationManagerPutheaderPost];
    [manager GET:API_BASE_URL_STRING(URL_QUERY) parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dictionary= responseObject;
        if (block) {
            block(dictionary,nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            block([NSDictionary dictionary],error);
        }
    }];
}

-(void)queryAppInfo{
    NSDictionary *parameters = @{@"appId": @"144431732"};
    [[NetHandle sharedInstance] queryAppInfoWith:parameters CompletionHandler:^(NSDictionary *dictionary, NSError *error) {
        if (!error) {
            NSDictionary *dic =  dictionary[@"record"][0];
            NSLog(@"%@",dic);
        }
        else {
            NSLog(@"%@",error);
        }
    }];
}


#import <sys/sysctl.h>
+ (NSArray *)runningProcesses {
    int mib[4] = {CTL_KERN, KERN_PROC, KERN_PROC_ALL, 0};
    size_t miblen = 4;
    size_t size;
    int st = sysctl(mib, miblen, NULL, &size, NULL, 0);
    
    struct kinfo_proc * process = NULL;
    struct kinfo_proc * newprocess = NULL;
    
    do {
        size += size / 10;
        newprocess = realloc(process, size);
        if (!newprocess){
            if (process){
                free(process);
            }
            return nil;
        }
        process = newprocess;
        st = sysctl(mib, miblen, process, &size, NULL, 0);
    } while (st == -1 && errno == ENOMEM);
    
    if (st == 0){
        if (size % sizeof(struct kinfo_proc) == 0){
            int nprocess = size / sizeof(struct kinfo_proc);
            if (nprocess){
                NSMutableArray * array = [[NSMutableArray alloc] init];
                for (int i = nprocess - 1; i >= 0; i--){
                    NSString * processID = [[NSString alloc] initWithFormat:@"%d", process[i].kp_proc.p_pid];
                    NSString * processName = [[NSString alloc] initWithFormat:@"%s", process[i].kp_proc.p_comm];
                    NSDictionary * dict = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:processID, processName, nil]
                                                                        forKeys:[NSArray arrayWithObjects:@"ProcessID", @"ProcessName", nil]];
                    [processID release];
                    [processName release];
                    [array addObject:dict];
                    [dict release];
                }
                free(process);
                return [array autorelease];
            }
        }
    }
    
    return nil;
}
@end
