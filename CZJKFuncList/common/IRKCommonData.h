//
//  IRKCommonData.h
//  IntelligentRingKing
//
//  Created by qf on 14-5-30.
//  Copyright (c) 2014年 JAGA. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "CommonDefine.h"
#import "sys/utsname.h"
#import <AVFoundation/AVFoundation.h>
@interface IRKCommonData : NSObject

+(IRKCommonData*)SharedInstance;
@property (nonatomic,strong)dispatch_queue_t savequeue;
@property (nonatomic, assign) BOOL is_enable_antilost;
@property (nonatomic, assign) BOOL is_enable_takephoto;
@property (nonatomic, assign) BOOL is_enable_mailnotify;
@property (nonatomic, assign) BOOL is_enable_smsnotify;
@property (nonatomic, assign) BOOL is_enable_devicecall;
@property (nonatomic, assign) BOOL is_enable_bongcontrolmusic;
@property (nonatomic, assign) BOOL is_enable_incomingcall;
@property (nonatomic, assign) BOOL is_enable_whatsapp;
@property (nonatomic, assign) BOOL is_enable_qqnotify;
@property (nonatomic, assign) BOOL is_enable_wechatnotify;
@property (nonatomic, assign) BOOL is_enable_longsitalarm;
@property (nonatomic, assign) BOOL is_enable_lowbatteryalarm;
@property (nonatomic, assign) BOOL is_enable_bringtScreen;
@property (nonatomic, assign) BOOL is_enable_shock;
@property (nonatomic, assign) NSInteger target_steps;
@property (nonatomic, assign) NSInteger target_runsteps;
@property (nonatomic, assign) float target_distance;
@property (nonatomic, assign) NSInteger target_activity;
@property (nonatomic, assign) float target_calorie;
@property (nonatomic, assign) double target_sleeptime;

@property (nonatomic, assign) NSInteger measureunit;


@property (nonatomic, copy) NSString* nickname;
@property (nonatomic, assign) NSInteger   male;
@property (nonatomic, assign) float height;
@property (nonatomic, assign) float weight;
@property (nonatomic, assign) float stride;
@property (nonatomic, copy) NSString* bloodtype;
@property (nonatomic, copy) NSString* birthyear;
@property (nonatomic, assign) NSInteger screentime;



@property (nonatomic, copy) NSString* gear_subtype;
@property (nonatomic, copy) NSString* sub_geartype;


-(void)saveconfig;
-(void)loadconfig;


-(BOOL)validateEmail:(NSString *)email;


@end

