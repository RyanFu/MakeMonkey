//
//  MoneyHandle.h
//  MakeMoney
//
//  Created by Pellet Mo on 15/10/28.
//
//

#import <Foundation/Foundation.h>

@interface MoneyHandle : NSObject
+ (id) sharedInstance;
- (int)setUp;
@end
