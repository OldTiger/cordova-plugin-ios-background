#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>
#import <Cordova/CDVPlugin.h>
#import "BackgroundTask.h"
/*
 @property(nonatomic,copy) NSDate *fireDate; 指定通知发送的时间
 @property(nonatomic,copy) NSTimeZone *timeZone; 指定发送通知的时区
 
 @property(nonatomic) NSCalendarUnit repeatInterval;  重复的周期, 枚举
 @property(nonatomic,copy) NSCalendar *repeatCalendar; 重复的周期  , 2014.12.12
 @property(nonatomic,copy) NSString *alertBody;      通知内容
 @property(nonatomic) BOOL hasAction;                是否需要华东事件
 @property(nonatomic,copy) NSString *alertAction;    锁屏状态的标题
 @property(nonatomic,copy) NSString *alertLaunchImage;   点击通知之后的启动图片
 @property(nonatomic,copy) NSString *soundName;    收到通知播放的音乐
 @property(nonatomic) NSInteger applicationIconBadgeNumber;  图标提醒数字
 @property(nonatomic,copy) NSDictionary *userInfo;   额外的信息
 js: noti(alertBody, alertAction, userInfo)
 */
@implementation BackgroundTask
-(void) begin:(CDVInvokedUrlCommand*)command
{
    NSLog(@"%s", __func__);
    //1.创建本地通知对象
    UIBackgroundTaskIdentifier bgTask = 0;
    UIApplication *application = [UIApplication sharedApplication];
    bgTask = [application beginBackgroundTaskWithName:@"APPTask" expirationHandler:^{
        // Clean up any unfinished task business by marking where you
        // stopped or ending the task outright.
        [application endBackgroundTask:bgTask];
        __block UIBackgroundTaskIdentifier bgTask = UIBackgroundTaskInvalid;
    }];
    // Start the long-running task and return immediately.
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Do the work associated with the task, preferably in chunks.
        while (1) {
            //let webview js code do the finish task
        }
        [application endBackgroundTask:bgTask];
        __block UIBackgroundTaskIdentifier bgTask = UIBackgroundTaskInvalid;
    });
}
@end