//
//  IRKCommonData.m
//  IntelligentRingKing
//
//  Created by qf on 14-5-30.
//  Copyright (c) 2014年 JAGA. All rights reserved.
//

#import "IRKCommonData.h"

@implementation IRKCommonData

+(IRKCommonData *)SharedInstance
{
    static IRKCommonData *irkcommondata = nil;
    if (irkcommondata == nil) {
        irkcommondata = [[IRKCommonData alloc] init];
    }
    return irkcommondata;
}

-(id)init
{
    self = [super init];
    if (self) {
        self.savequeue = dispatch_queue_create("com.keeprapid.save", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

-(void)loadconfig{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    BOOL first = [ud boolForKey:CONFIG_KEY_FIRST_RUN];
    if (!first) {
        [ud setBool:YES forKey:CONFIG_KEY_FIRST_RUN];
        //初次运行，赋予默认值
        
        self.is_enable_antilost            = YES;
        self.is_enable_takephoto           = YES;
        self.is_enable_bringtScreen        = YES;
    
        self.is_enable_incomingcall    = YES;
        
        self.is_enable_whatsapp            = YES;
        self.is_enable_qqnotify            = YES;
        self.is_enable_wechatnotify        = YES;
        self.is_enable_mailnotify          = YES;
        self.is_enable_bongcontrolmusic    = YES;
        
        self.is_enable_devicecall          = YES;
        self.is_enable_smsnotify           = YES;
        self.is_enable_lowbatteryalarm     = YES;
        self.is_enable_longsitalarm        = YES;
        self.target_steps                  = 10000;
        self.target_distance               = self.target_steps * 0.75/1000;
        self.target_calorie                = self.target_steps * 0.0395;
        self.male                          = 1;
        self.target_sleeptime              = 60*60*8;
        self.height                        = DEMO_HEIGHT;
        self.weight                        = DEMO_WEIGHT;
        self.birthyear                     = DEMO_BIRTH;
        self.stride                        = DEMO_STRIDE;
        self.measureunit                   = MEASURE_UNIT_METRIX;
        self.nickname                      = @"";
        self.target_activity               = 30;
        self.is_enable_shock               = YES;
        self.bloodtype                     = DEMO_BLOODTYPE;
        self.gear_subtype                  = @"";
        self.screentime                    = 10;
        [self saveconfig];
        
    }else{
        //初次运行，赋予默认值
        self.is_enable_antilost            = [ud boolForKey:CONFIG_KEY_ENABLE_ANTILOST];
        self.is_enable_bringtScreen        = [ud boolForKey:CONFIG_KEY_ENABLE_BRIGHTSCREEN];
        self.is_enable_takephoto           = [ud boolForKey:CONFIG_KEY_ENABLE_TAKEPHOTO];
        self.is_enable_whatsapp            = [ud boolForKey:CONFIG_KEY_ENABLE_WHATSAPP];
        self.is_enable_qqnotify            = [ud boolForKey:CONFIG_KEY_ENABLE_QQ];
        self.is_enable_wechatnotify        = [ud boolForKey:CONFIG_KEY_ENABLE_WECHAT];
        self.is_enable_mailnotify          = [ud boolForKey:CONFIG_KEY_ENABLE_MAILALERT];
        self.is_enable_bongcontrolmusic    = [ud boolForKey:CONFIG_KEY_ENABLE_BONGCONTROLMUSIC];   //现在还没做，暂时默认NO
        self.is_enable_incomingcall        = [ud boolForKey:CONFIG_KEY_ENABLE_INCOMING_CALL];
        self.is_enable_smsnotify           = [ud boolForKey:CONFIG_KEY_ENABLE_SMS_NOTIFY];
        self.is_enable_devicecall          = [ud boolForKey:CONFIG_KEY_ENABLE_DEVICE_CALL];
        self.is_enable_longsitalarm        = [ud boolForKey:CONFIG_KEY_ENABLE_LONGSIT];
        self.is_enable_lowbatteryalarm     = [ud boolForKey:CONFIG_KEY_ENABLE_LOWBATTERY];
        self.target_steps                  = [ud integerForKey:CONFIG_KEY_TARGET_STEPS];
        self.target_runsteps               = [ud integerForKey:CONFIG_KEY_TARGET_RUNSTEPS];
        self.measureunit                   = [ud integerForKey:CONFIG_KEY_MEASUREUNIT];
        self.target_distance               = [ud floatForKey:CONFIG_KEY_TARGET_DISTANCE];
        self.target_calorie                = [ud floatForKey:CONFIG_KEY_TARGET_CAROLIE];
        self.target_sleeptime              = [ud doubleForKey:CONFIG_KEY_TARGET_SLEEPTIME];
        self.male                          = [ud integerForKey:CONFIG_KEY_PERSON_INFO_MALE];
        self.birthyear                     = [ud stringForKey:CONFIG_KEY_PERSON_INFO_BIRTHYEAR];
        self.height                        = [ud floatForKey:CONFIG_KEY_PERSON_INFO_HEIGHT];
        self.weight                        = [ud floatForKey:CONFIG_KEY_PERSON_INFO_WEIGHT];
        self.stride                        = [ud floatForKey:CONFIG_KEY_PERSON_INFO_STRIDE];
        self.target_activity               = [ud integerForKey:CONFIG_KEY_TARGET_ACTIVITY];
        
        self.nickname                      = [ud stringForKey:CONFIG_KEY_NICKNAME];
        self.is_enable_shock               = [ud boolForKey:CONFIG_KEY_ENABLE_SHOCK];
        self.bloodtype                     = [ud objectForKey:CONFIG_KEY_PERSON_INFO_BLOODTYPE];
        self.gear_subtype                  = [ud objectForKey:CONFIG_KEY_GEARSUBTYPE];
        self.screentime                    = [ud integerForKey:CONFIG_KEY_SCREENTIME];
        if (self.screentime == 0) {
            self.screentime = 10;
        }
        
 
    }

}
-(void)saveconfig{
    dispatch_sync(self.savequeue, ^{
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setBool:self.is_enable_antilost forKey:CONFIG_KEY_ENABLE_ANTILOST];
        [ud setBool:self.is_enable_bringtScreen forKey:CONFIG_KEY_ENABLE_BRIGHTSCREEN];
        [ud setBool:self.is_enable_takephoto forKey:CONFIG_KEY_ENABLE_TAKEPHOTO];
        [ud setBool:self.is_enable_whatsapp forKey:CONFIG_KEY_ENABLE_WHATSAPP];
        [ud setBool:self.is_enable_qqnotify forKey:CONFIG_KEY_ENABLE_QQ];
        [ud setBool:self.is_enable_wechatnotify forKey:CONFIG_KEY_ENABLE_WECHAT];
        [ud setBool:self.is_enable_mailnotify forKey:CONFIG_KEY_ENABLE_MAILALERT];
        [ud setBool:self.is_enable_bongcontrolmusic forKey:CONFIG_KEY_ENABLE_BONGCONTROLMUSIC];
        [ud setBool:self.is_enable_incomingcall forKey:CONFIG_KEY_ENABLE_INCOMING_CALL];
        [ud setBool:self.is_enable_smsnotify forKey:CONFIG_KEY_ENABLE_SMS_NOTIFY];
        [ud setBool:self.is_enable_devicecall forKey:CONFIG_KEY_ENABLE_DEVICE_CALL];
        [ud setInteger:self.target_steps forKey:CONFIG_KEY_TARGET_STEPS];
        [ud setInteger:self.target_runsteps forKey:CONFIG_KEY_TARGET_RUNSTEPS];
        [ud setInteger:self.measureunit forKey:CONFIG_KEY_MEASUREUNIT];
        [ud setFloat:self.target_distance forKey:CONFIG_KEY_TARGET_DISTANCE];
        [ud setFloat:self.target_calorie forKey:CONFIG_KEY_TARGET_CAROLIE];
        [ud setDouble:self.target_sleeptime forKey:CONFIG_KEY_TARGET_SLEEPTIME];
        [ud setInteger:self.male forKey:CONFIG_KEY_PERSON_INFO_MALE];
        [ud setFloat:self.stride forKey:CONFIG_KEY_PERSON_INFO_STRIDE];
        [ud setObject:self.birthyear forKey:CONFIG_KEY_PERSON_INFO_BIRTHYEAR];
        [ud setFloat:self.height forKey:CONFIG_KEY_PERSON_INFO_HEIGHT];
        [ud setFloat:self.weight forKey:CONFIG_KEY_PERSON_INFO_WEIGHT];
        [ud setObject:self.nickname forKey:CONFIG_KEY_NICKNAME];
        [ud setBool:self.is_enable_longsitalarm forKey:CONFIG_KEY_ENABLE_LONGSIT];
        [ud setBool:self.is_enable_lowbatteryalarm forKey:CONFIG_KEY_ENABLE_LOWBATTERY];
        [ud setBool:self.is_enable_shock forKey:CONFIG_KEY_ENABLE_SHOCK];
        [ud setObject:self.bloodtype forKey:CONFIG_KEY_PERSON_INFO_BLOODTYPE];
        [ud setObject:self.gear_subtype forKey:CONFIG_KEY_GEARSUBTYPE];
        [ud setInteger:self.screentime forKey:CONFIG_KEY_SCREENTIME];
        [ud setInteger:self.target_activity forKey:CONFIG_KEY_TARGET_ACTIVITY];
        
    //    NSLog(@"saveconfig::%@,%@,%@",self.BongServiceUUID,self.BongNotifyCharacterUUID,self.BongWriteCharacterUUID);
        [ud synchronize];
    });
}
-(void)saveconfig:(id)obj forkey:(NSString*)key{
    dispatch_sync(self.savequeue, ^{
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setObject:obj forKey:key];
        [ud synchronize];
        
    });
}


@end
