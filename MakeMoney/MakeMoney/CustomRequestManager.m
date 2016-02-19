//
//  CustomRequestManager.m
//  MakeMoney
//
//  Created by Pellet Mo on 15/11/2.
//
//

#import "CustomRequestManager.h"

@implementation CustomRequestManager
+ (id) sharedInstance {
    static CustomRequestManager* instance;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [super manager];
        UIWebView* web = [UIWebView new];
        NSString* safari_agent = [web stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
        [instance.requestSerializer setValue:safari_agent forHTTPHeaderField:@"User-Agent"];
        
    });
    return instance;
}




@end
