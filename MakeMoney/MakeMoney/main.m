//
//  main.m
//  MakeMoney
//
//  Created by Pellet Mo on 15/10/28.
//  Copyright (c) 2015年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MoneyHandle.h"
int main (int argc, const char * argv[])
{

    @autoreleasepool
    {	
        [[MoneyHandle sharedInstance] setUp];
        
        [[NSRunLoop currentRunLoop]run];
//        [NSDate distantFuture]
   
    }
	return 0;
}

