//
//  BottomControlXPreferencesListController.m
//  BottomControlXPreferences
//
//  Created by XCXiao on 29.04.2018.
//  Copyright (c) 2018 XCXiao. All rights reserved.
//

#import <Preferences/Preferences.h>
#import <SettingsKit/SKListControllerProtocol.h>
#import <SettingsKit/SKTintedListController.h>
#include <spawn.h>
#import <CommonCrypto/CommonDigest.h>

void execCommand (const char* execPath, const char* args[]) {
    pid_t pid;
    int status;
    posix_spawn(&pid, execPath, NULL, NULL, (char* const*)args, NULL);
    waitpid(pid, &status, WEXITED);
}

void respring() {
    execCommand("/usr/bin/killall", (const char*[]){"killall", "-9", "SpringBoard", "backboardd", NULL});
}

NSString* getPreferredLanguage() {
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSArray * allLanguages = [defaults objectForKey:@"AppleLanguages"];
    NSString * preferredLang = [allLanguages objectAtIndex:0];
    return preferredLang;
}

@interface SBGestureSettingsListController : SKTintedListController<SKListControllerProtocol>
@end

@interface LockGestureSettingsListController : SKTintedListController<SKListControllerProtocol>
@end

@interface AppGestureSettingsListController : SKTintedListController<SKListControllerProtocol>
@end

@implementation SBGestureSettingsListController
-(NSString*) customTitle      { return @"SpringBoard Gestures"; }
-(BOOL) showHeartImage        { return NO; }
-(NSArray *) customSpecifiers {
  return @[
  @{
      @"cell": @"PSLinkListCell",
      @"default": @1,
      @"defaults": @"com.xcxiao.bottomcontrolxpreferences",
      @"detail": @"PSListItemsController",
      @"key": @"bottomLeftGesture",
      @"label": @"Bottom Left",
      @"PostNotification": @"com.xcxiao.BCCX/reloadSettings",
      @"validTitles": [NSArray arrayWithObjects:@"Home Gesture", @"ControlCenter", @"Lock Device", @"Cover Sheet", @"Take Screenshot", @"No Action", nil],
      @"validValues": [NSArray arrayWithObjects:@1, @2, @3, @9, @5, @10, nil]
   },
   @{
       @"cell": @"PSLinkListCell",
       @"default": @1,
       @"defaults": @"com.xcxiao.bottomcontrolxpreferences",
       @"detail": @"PSListItemsController",
       @"key": @"bottomCenterGesture",
       @"label": @"Bottom Center",
       @"PostNotification": @"com.xcxiao.BCCX/reloadSettings",
       @"validTitles": [NSArray arrayWithObjects:@"Home Gesture", @"ControlCenter", @"Lock Device", @"Cover Sheet", @"Take Screenshot", @"No Action", nil],
       @"validValues": [NSArray arrayWithObjects:@1, @2, @3, @9, @5, @10, nil]
    },
    @{
        @"cell": @"PSLinkListCell",
        @"default": @1,
        @"defaults": @"com.xcxiao.bottomcontrolxpreferences",
        @"detail": @"PSListItemsController",
        @"key": @"bottomRightGesture",
        @"label": @"Bottom Right",
        @"PostNotification": @"com.xcxiao.BCCX/reloadSettings",
        @"validTitles": [NSArray arrayWithObjects:@"Home Gesture", @"ControlCenter", @"Lock Device", @"Cover Sheet", @"Take Screenshot", @"No Action", nil],
        @"validValues": [NSArray arrayWithObjects:@1, @2, @3, @9, @5, @10, nil]
     }
  ];
}
@end

@implementation LockGestureSettingsListController
-(NSString*) customTitle      { return @"LockScreen Gestures"; }
-(BOOL) showHeartImage        { return NO; }
-(NSArray *) customSpecifiers {
  return @[
  @{
      @"cell": @"PSLinkListCell",
      @"default": @1,
      @"defaults": @"com.xcxiao.bottomcontrolxpreferences",
      @"detail": @"PSListItemsController",
      @"key": @"LBottomLeftGesture",
      @"label": @"Bottom Left",
      @"PostNotification": @"com.xcxiao.BCCX/reloadSettings",
      @"validTitles": [NSArray arrayWithObjects:@"Home Gesture", @"ControlCenter", @"Lock Device", @"Take Screenshot", nil],
      @"validValues": [NSArray arrayWithObjects:@1, @2, @3, @5, nil]
   },
   @{
       @"cell": @"PSLinkListCell",
       @"default": @1,
       @"defaults": @"com.xcxiao.bottomcontrolxpreferences",
       @"detail": @"PSListItemsController",
       @"key": @"LBottomCenterGesture",
       @"label": @"Bottom Center",
       @"PostNotification": @"com.xcxiao.BCCX/reloadSettings",
       @"validTitles": [NSArray arrayWithObjects:@"Home Gesture", @"ControlCenter", @"Lock Device", @"Take Screenshot", nil],
       @"validValues": [NSArray arrayWithObjects:@1, @2, @3, @5, nil]
    },
    @{
        @"cell": @"PSLinkListCell",
        @"default": @1,
        @"defaults": @"com.xcxiao.bottomcontrolxpreferences",
        @"detail": @"PSListItemsController",
        @"key": @"LBottomRightGesture",
        @"label": @"Bottom Right",
        @"PostNotification": @"com.xcxiao.BCCX/reloadSettings",
        @"validTitles": [NSArray arrayWithObjects:@"Home Gesture", @"ControlCenter", @"Lock Device", @"Take Screenshot", nil],
        @"validValues": [NSArray arrayWithObjects:@1, @2, @3, @5, nil]
     }
  ];
}
@end

@implementation AppGestureSettingsListController
-(NSString*) customTitle      { return @"In Apps Gestures"; }
-(BOOL) showHeartImage        { return NO; }
-(NSArray *) customSpecifiers {
    return @[
        @{
            @"cell": @"PSLinkListCell",
            @"default": @1,
            @"defaults": @"com.xcxiao.bottomcontrolxpreferences",
            @"detail": @"PSListItemsController",
            @"key": @"AppBottomLeftGesture",
            @"label": @"Bottom Left",
            @"PostNotification": @"com.xcxiao.BCCX/reloadSettings",
            @"validTitles": [NSArray arrayWithObjects:@"Home Gesture", @"ControlCenter", @"Lock Device", @"Cover Sheet", @"Take Screenshot", @"No Action", nil],
            @"validValues": [NSArray arrayWithObjects:@1, @2, @3, @9, @5, @10, nil]
        },
        @{
            @"cell": @"PSLinkListCell",
            @"default": @1,
            @"defaults": @"com.xcxiao.bottomcontrolxpreferences",
            @"detail": @"PSListItemsController",
            @"key": @"AppBottomCenterGesture",
            @"label": @"Bottom Center",
            @"PostNotification": @"com.xcxiao.BCCX/reloadSettings",
            @"validTitles": [NSArray arrayWithObjects:@"Home Gesture", @"ControlCenter", @"Lock Device", @"Cover Sheet", @"Take Screenshot", @"No Action", nil],
            @"validValues": [NSArray arrayWithObjects:@1, @2, @3, @9, @5, @10, nil]
        },
        @{
            @"cell": @"PSLinkListCell",
            @"default": @1,
            @"defaults": @"com.xcxiao.bottomcontrolxpreferences",
            @"detail": @"PSListItemsController",
            @"key": @"AppBottomRightGesture",
            @"label": @"Bottom Right",
            @"PostNotification": @"com.xcxiao.BCCX/reloadSettings",
            @"validTitles": [NSArray arrayWithObjects:@"Home Gesture", @"ControlCenter", @"Lock Device", @"Cover Sheet", @"Take Screenshot", @"No Action", nil],
            @"validValues": [NSArray arrayWithObjects:@1, @2, @3, @9, @5, @10, nil]
        }
    ];
}
@end


@interface BottomControlXPreferencesListController: SKTintedListController<SKListControllerProtocol>
@end

@implementation BottomControlXPreferencesListController

-(NSString*) headerText {

    float v = [UIDevice currentDevice].systemVersion.floatValue;
    NSString *str = v >= 13.0 ? @"BottomControlXIII"
                              : v >= 12.0 ? @"BottomControlXII"
                                          : @"BottomControlX";
    return str;
}

-(NSString *)headerTextFont     { return @"PingFangSC-Thin"; }
-(int)headerTextFontSize        { return 35; }
-(NSString *)headerSubTextFont  { return @"PingFangSC-Thin"; }
-(int)headerSubTextFontSize     { return 16; }
-(NSString*) customTitle        { return @"BottomControlX"; }
-(BOOL) showHeartImage          { return NO; }
-(UIColor*) switchTintColor     { return [UIColor colorWithRed:30.0f/255.0f green:144.0f/255.0f blue:255.0f/255.0f alpha:1.0]; }//[UIColor orangeColor]; }

-(NSString *)headerSubText {
    return @"Control your iPhone X\nby XCXiao";
}

-(NSArray*) customSpecifiers
{
    return @[
                @{
                    @"cell": @"PSGroupCell",
                    @"label": @"BottomControlX",
                    @"footerText": @"Make it easier to control the iPhone X."
                },
                @{
                    @"cell": @"PSSwitchCell",
                    @"default": @NO,
                    @"defaults": @"com.xcxiao.bottomcontrolxpreferences",
                    @"key": @"EnabledBCCX",
                    @"label": @"Enabled",
                    @"PostNotification": @"com.XCXiaoBCCXreloadSettings",
                    @"cellClass": @"SKTintedSwitchCell"
                 },
                 @{
                     @"cell": @"PSGroupCell",
                     @"label": @"Custom Gesture",
                     @"footerText": @"Custom the swipe up gesture from left/center/right bottom of the screen."
                 },
                 @{
                      @"cell": @"PSLinkCell",
                      @"isController": @YES,
                      @"detail": @"SBGestureSettingsListController",
                      @"label": @"SpringBoard"
                 },
                 @{
                      @"cell": @"PSLinkListCell",
                      @"isController": @YES,
                      @"detail": @"LockGestureSettingsListController",
                      @"label": @"LockScreen"
                 },
                 @{
                      @"cell": @"PSLinkCell",
                      @"isController": @YES,
                      @"detail": @"AppGestureSettingsListController",
                      @"label": @"In Apps"
                 },
                 @{
                      @"cell": @"PSGroupCell",
                      @"label": @"Custom Center Gesture Area Width.",
                      @"footerText": @"Custom Center Gesture area's width."
                 },
                 @{
                    @"cell": @"PSSliderCell",
                    @"min": @1,
                    @"max": [NSString stringWithFormat:@"%.3f", [UIScreen mainScreen].bounds.size.width],
                    @"showValue": @YES,
                    @"isContinuous": @YES,
                    @"PostNotification": @"com.XCXiaoBCCXreloadSettings",
                    @"defaults": @"com.xcxiao.bottomcontrolxpreferences",
                    @"default": [NSString stringWithFormat:@"%.3f", ([UIScreen mainScreen].bounds.size.width)/3],
                    @"key": @"centerValue"
                 },
                 @{
                     @"cell": @"PSGroupCell",
                     @"footerText": @"Custom the velocity value which is needed to trigger BottomControlX gesture when you have lower gesture sensibility enabled."
                 },
                 @{
                    @"cell": @"PSSwitchCell",
                    @"default": @NO,
                    @"defaults": @"com.xcxiao.bottomcontrolxpreferences",
                    @"key": @"lowerSensibility",
                    @"label": @"Lower gesture sensibility",
                    @"PostNotification": @"com.XCXiaoBCCXreloadSettings",
                    @"cellClass": @"SKTintedSwitchCell"
                 },
                 @{
                    @"cell": @"PSSliderCell",
                    @"min": @100,
                    @"max": @500,
                    @"showValue": @YES,
                    @"isContinuous": @YES,
                    @"PostNotification": @"com.XCXiaoBCCXreloadSettings",
                    @"defaults": @"com.xcxiao.bottomcontrolxpreferences",
                    @"default": @350,
                    @"key": @"velocityValue"
                 },
                 @{
                     @"cell": @"PSGroupCell"
                 },
                 @{
                    @"cell": @"PSButtonCell",
                    @"action": @"respringDevice",
                    @"label": @"Respring",
                 },
                 @{
                    @"cell": @"PSButtonCell",
                    @"action": @"openPaypal",
                    @"label": @"Donate via PayPal",
                    @"icon": @"ppp.png"
                 },
                 @{
                    @"cell": @"PSButtonCell",
                    @"action": @"donateWeChat",
                    @"label": @"Donate via WeChat",
                    @"icon": @"wc.png"
                 },
                 @{
                     @"cell": @"PSGroupCell",
                     @"footerText": @"Fuck all Chinese repo."
                 },
                 @{
                     @"cell": @"PSGroupCell",
                     @"footerText": @"BottomControlX, by XCXiao."
                 }
             ];
}

-(void)respringDevice {
  respring();
}

-(void)openPaypal {
  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.paypal.me/Akat5uki"]];
}

- (void)donateWeChat {
    NSLog(@"Lazy.");
}

@end
