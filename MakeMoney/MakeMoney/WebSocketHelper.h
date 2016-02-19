//
//  WebSocketHelper.h
//  MakeMoney
//
//  Created by Pellet Mo on 15/11/10.
//
//

#import <Foundation/Foundation.h>
#import "socketIO/SocketIO.h"
@interface WebSocketHelper : NSObject<SocketIODelegate>
{
    SocketIO * socketIO;
}
+ (id) sharedInstance;

-(void)sendMessage;
@end
