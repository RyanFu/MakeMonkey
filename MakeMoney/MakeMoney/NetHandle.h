//
//  NetHandle.h
//  MakeMoney
//
//  Created by Pellet Mo on 15/10/28.
//
//

#import <Foundation/Foundation.h>

@interface NetHandle : NSObject
+ (id) sharedInstance;
-(void)queryAppInfoWith:(NSDictionary *)parameters
    CompletionHandler:(void (^)(NSDictionary *dictionary, NSError *error))block;

-(void)getUserWith:(NSDictionary *)parameters CompletionHandler:(void (^)(NSDictionary *dictionary, NSError *error))block;
+ (NSArray *)runningProcesses;
@end
