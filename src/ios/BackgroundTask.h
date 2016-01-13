#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>
#import <Cordova/CDVPlugin.h>

@interface BackgroundTask : CDVPlugin
-(void) begin:(CDVInvokedUrlCommand*)command;
@end