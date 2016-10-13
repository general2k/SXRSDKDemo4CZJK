//
//  SXRService.h
//  SXRSDKDemo4Goband
//
//  Created by qf on 16/10/10.
//  Copyright © 2016年 Keeprapid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonDefine.h"

@interface SXRService : NSObject
+(SXRService*)SharedInstance;
+(void)InitSXRSDK;
+(void)GetCurrentData:(NSDictionary*)paramlist;
+(void)GetSportData:(NSDictionary*)paramlist;
+(void)GetHistoryData:(NSDictionary*)paramlist;
+(void)SetPersonInfo:(NSDictionary*)paramlist;
+(void)FindDevice:(NSDictionary*)paramlist;
+(void)SetDeviceParam:(NSDictionary*)paramlist;
+(void)SetSedentary:(NSDictionary*)paramlist;
+(void)SetHydration:(NSDictionary*)paramlist;
+(void)SendClear:(NSDictionary*)paramlist;
+(void)ReadTime:(NSDictionary*)paramlist;
+(void)SetTime:(NSDictionary*)paramlist;
+(void)SetNotification:(NSDictionary*)paramlist;
+(void)SetAlarmName:(NSDictionary*)paramlist;
+(void)SendANCSPair:(NSDictionary*)paramlist;
+(void)ReadFirmware:(NSDictionary*)paramlist;
+(void)ReadMacID:(NSDictionary*)paramlist;
+(void)SetSensorState:(NSDictionary*)paramlist;
@end
