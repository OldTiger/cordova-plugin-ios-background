#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>
#import <Cordova/CDVPlugin.h>

@interface CDVGDDLocalNotification : CDVPlugin
-(void) noti:(CDVInvokedUrlCommand*)command;
@end