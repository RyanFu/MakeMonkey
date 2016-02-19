//
//  WebSocketHelper.m
//  MakeMoney
//
//  Created by Pellet Mo on 15/11/10.
//
//

#import "WebSocketHelper.h"
#import "socketIO/SocketIOPacket.h"
#import "socketIO/SocketIOJSONSerialization.h"

@implementation WebSocketHelper


+ (id) sharedInstance {
    static WebSocketHelper* instance;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    return instance;
}
- (id) init {
    self = [super init];
    if (self) {
        socketIO = [[SocketIO alloc] initWithDelegate:self];
        [socketIO connectToHost:@"mopellet.local" onPort:8120];
    }
    return self;
}

-(void)sendMessage{
    
    [self sendMessageToWebSocket:@"abc"];
}

-(void)sendMessageToWebSocket:(NSString *)str
{
    SocketIOCallback cb = ^(id argsData) {
        NSDictionary *response = argsData;
        // do something with response
        NSLog(@"ack arrived: %@", response);
    };
    [socketIO sendMessage:str withAcknowledge:cb];
}

- (void) socketIO:(SocketIO *)socket didReceiveEvent:(SocketIOPacket *)packet
{
    NSLog(@"didReceiveEvent()");
    NSString *receiveData=packet.data;
    NSData *utf8Data = [receiveData dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dictemp=(NSDictionary *)[SocketIOJSONSerialization objectFromJSONData:utf8Data error:nil];
    NSLog(@"查看消息 :%@",dictemp);
}

- (void) socketIO:(SocketIO *)socket failedToConnectWithError:(NSError *)error
{
    NSLog(@"failedToConnectWithError() %@", error);
}

@end
