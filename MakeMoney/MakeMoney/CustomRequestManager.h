//
//  CustomRequestManager.h
//  MakeMoney
//
//  Created by Pellet Mo on 15/11/2.
//
//

#import "AFHTTPRequestOperationManager.h"

@interface CustomRequestManager : AFHTTPRequestOperationManager
+ (id) sharedInstance;

@end
