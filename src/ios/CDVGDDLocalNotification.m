#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>
#import <Cordova/CDVPlugin.h>
#import "CDVGDDLocalNotification.h"
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
@implementation CDVGDDLocalNotification
-(void) noti:(CDVInvokedUrlCommand*)command
{
    NSLog(@"%s", __func__);
    //1.创建本地通知对象
    id alertBody = [command argumentAtIndex:0];
    id alertAction = [command argumentAtIndex:1];
    id userInfo = [command argumentAtIndex:2];
    UILocalNotification *note = [[UILocalNotification alloc]init];
    note.fireDate = [NSDate dateWithTimeIntervalSinceNow:0];
    note.timeZone = [NSTimeZone defaultTimeZone];
    note.alertBody = alertBody;
    note.alertAction  = alertAction;
    note.alertLaunchImage =  @"Default";
    note.soundName =  @"Default";
    //note.userInfo = userInfo;
    
    UIUserNotificationType type = UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type categories:nil];
    // 注册通知类型
    
    UIApplication *app =  [UIApplication sharedApplication];
    [app registerUserNotificationSettings:settings];

    // 每次调用添加方法都会将通知添加到scheduledLocalNotifications数组中
    [app scheduleLocalNotification:note];
}
@end