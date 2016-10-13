//
//  SXRService.m
//  SXRSDKDemo4Goband
//
//  Created by qf on 16/10/10.
//  Copyright © 2016年 Keeprapid. All rights reserved.
//

#import "SXRService.h"
#import <SXRSDK/SXRSDK.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface SXRService()
@end

@implementation SXRService
+(SXRService *)SharedInstance
{
    static SXRService *service = nil;
    if (service == nil) {
        service = [[SXRService alloc] init];
    }
    return service;
}

-(id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

+(void)InitSXRSDK{
    [SXR initializeWithProtocolType:SXRSDKProtoclType_Goband andAppID:DEMO_APPID andSecret:DEMO_SECRET andVid:DEMO_VID];
    NSLog(@"%d",[SXR shareInstance].protocolType);
    [SXR shareInstance].bleNameFilter = ^(CBPeripheral *peripheral, NSDictionary *advertisementData, NSNumber *RSSI){
        NSLog(@"sxrblenamefilter, %@",peripheral.name);
        if ([peripheral.name hasPrefix:GEAR_BLE_NAME_B108]||
            [peripheral.name hasPrefix:GEAR_BLE_NAME_BLOX]||
            [peripheral.name hasPrefix:GEAR_BLE_NAME_LEWO]||
            [peripheral.name hasPrefix:GEAR_BLE_NAME_SMART]||
            [peripheral.name hasPrefix:GEAR_BLE_NAME_EIROGA]||
            [peripheral.name hasPrefix:GEAR_BLE_NAME_GETFIT]||
            [peripheral.name hasPrefix:GEAR_BLE_NAME_PUZZLE]||
            [peripheral.name hasPrefix:GEAR_BLE_NAME_FITRIST]||
            [peripheral.name hasPrefix:GEAR_BLE_NAME_AKTIFITE]||
            [peripheral.name hasPrefix:GEAR_BLE_NAME_FIT_BAND]||
            [peripheral.name hasPrefix:GEAR_BLE_NAME_MOVISTAR]||
            [peripheral.name hasPrefix:GEAR_BLE_NAME_SPRINFIT]
            ) {
            return YES;
        }
        return NO;
    };
    [SXR shareInstance].deviceReady = testDeviceReady;
    
    
    
}
void testDeviceReady(){
    NSLog(@"testDeviceReady");
    NSMutableDictionary* bi = [SXRSDKUtils getDeviceInformation:[SXRSDKConfig getCurrentDeviceUUID]];
    NSString* macid = @"";
    if (bi){
        NSString* tmpid = [bi objectForKey:BONGINFO_KEY_BLEADDR];
        if(tmpid && ![tmpid isEqualToString:@""]){
            macid = tmpid;
        }
    }
    if ([macid isEqualToString:@""]) {
        [[SXR shareInstance] AddCommand:CMD_CZJK_GETMAC withParam:nil toCharacteristicKey:CH_UUID_CZJK_WRITE HighPriority:NO waitResponse:YES];
    }
    [[SXR shareInstance] AddCommand:CMD_CZJK_GETFW withParam:nil toCharacteristicKey:CH_UUID_CZJK_WRITE HighPriority:NO waitResponse:YES];
    [[SXR shareInstance] AddCommand:CMD_CZJK_READTIME withParam:nil toCharacteristicKey:CH_UUID_CZJK_WRITE HighPriority:NO waitResponse:YES];
    NSDictionary* paramlist = @{CZJK_PARAM_PROTOCOL_VERSION:CZJK_PROTOCOL_VERSION_PUZZLE,
                                CZJK_PARAM_UNIT:[NSNumber numberWithInt:DEMO_UNIT],
                                BONGINFO_KEY_SCREEN_TIME:[NSNumber numberWithInt:10],
                                BONGINFO_KEY_CZJK_LOWBATTERYALARM:[NSNumber numberWithBool:YES]};
    [[SXR shareInstance] AddCommand:CMD_CZJK_SETDEVICEPARAM withParam:paramlist toCharacteristicKey:CH_UUID_CZJK_WRITE HighPriority:NO waitResponse:YES];
    [[SXR shareInstance] AddCommand:CMD_CZJK_ANCSPAIR withParam:nil toCharacteristicKey:CH_UUID_CZJK_WRITE HighPriority:NO waitResponse:NO];

}


+(void)GetCurrentData:(NSDictionary*)paramlist{
    if ([[SXR shareInstance] isConnect]) {
        [[SXR shareInstance] AddCommand:CMD_CZJK_GETCURRENTDATA withParam:nil toCharacteristicKey:nil HighPriority:NO waitResponse:YES];
    }
}
+(void)GetSportData:(NSDictionary*)paramlist{
    if ([[SXR shareInstance] isConnect]) {
        [[SXR shareInstance] AddCommand:CMD_CZJK_GETSPORTDATA withParam:nil toCharacteristicKey:nil HighPriority:NO waitResponse:YES];
    }
   
}
+(void)GetHistoryData:(NSDictionary*)paramlist{
    if ([[SXR shareInstance] isConnect]) {
        [[SXR shareInstance] AddCommand:CMD_CZJK_GETHISTORYDATA withParam:nil toCharacteristicKey:nil HighPriority:NO waitResponse:YES];
    }

}
+(void)SetPersonInfo:(NSDictionary*)paramlist{
    if ([[SXR shareInstance] isConnect]) {
        [[SXR shareInstance] AddCommand:CMD_CZJK_SETPERSON withParam:paramlist toCharacteristicKey:nil HighPriority:NO waitResponse:YES];
    }
 
}
+(void)FindDevice:(NSDictionary*)paramlist{
    if ([[SXR shareInstance] isConnect]) {
        [[SXR shareInstance] AddCommand:CMD_CZJK_ANTILOST withParam:paramlist toCharacteristicKey:nil HighPriority:NO waitResponse:NO];
    }
    
}
+(void)SetDeviceParam:(NSDictionary*)paramlist{
    if ([[SXR shareInstance] isConnect]) {
        [[SXR shareInstance] AddCommand:CMD_CZJK_SETDEVICEPARAM withParam:paramlist toCharacteristicKey:nil HighPriority:NO waitResponse:YES];
    }
    
}
+(void)SetSedentary:(NSDictionary*)paramlist{
    if ([[SXR shareInstance] isConnect]) {
        [[SXR shareInstance] AddCommand:CMD_CZJK_SETSEDENTARYALARM withParam:paramlist toCharacteristicKey:nil HighPriority:NO waitResponse:YES];
    }
    
}
+(void)SetHydration:(NSDictionary*)paramlist{
    if ([[SXR shareInstance] isConnect]) {
        [[SXR shareInstance] AddCommand:CMD_CZJK_SETHYDRATIONALARM withParam:paramlist toCharacteristicKey:nil HighPriority:NO waitResponse:YES];
    }
    
}
+(void)SendClear:(NSDictionary*)paramlist{
    if ([[SXR shareInstance] isConnect]) {
        [[SXR shareInstance] AddCommand:CMD_CZJK_CLEAR withParam:paramlist toCharacteristicKey:nil HighPriority:NO waitResponse:YES];
    }
    
}
+(void)ReadTime:(NSDictionary*)paramlist{
    if ([[SXR shareInstance] isConnect]) {
        [[SXR shareInstance] AddCommand:CMD_CZJK_READTIME withParam:paramlist toCharacteristicKey:nil HighPriority:NO waitResponse:YES];
    }
    
}
+(void)SetTime:(NSDictionary*)paramlist{
    if ([[SXR shareInstance] isConnect]) {
        [[SXR shareInstance] AddCommand:CMD_CZJK_SETTIME withParam:paramlist toCharacteristicKey:nil HighPriority:NO waitResponse:YES];
    }
    
}

+(void)SetNotification:(NSDictionary*)paramlist{
    if ([[SXR shareInstance] isConnect]) {
        [[SXR shareInstance] AddCommand:CMD_CZJK_SETNOTIFICATION withParam:paramlist toCharacteristicKey:nil HighPriority:NO waitResponse:YES];
    }
   
}

+(void)SetAlarmName:(NSDictionary*)paramlist{
    if ([[SXR shareInstance] isConnect]) {
        [[SXR shareInstance] AddCommand:CMD_CZJK_SETALARMNAME withParam:paramlist toCharacteristicKey:nil HighPriority:NO waitResponse:YES];
    }
   
}
+(void)SendANCSPair:(NSDictionary*)paramlist{
    if ([[SXR shareInstance] isConnect]) {
        [[SXR shareInstance] AddCommand:CMD_CZJK_ANCSPAIR withParam:paramlist toCharacteristicKey:nil HighPriority:NO waitResponse:NO];
    }
   
}
+(void)ReadFirmware:(NSDictionary*)paramlist{
    if ([[SXR shareInstance] isConnect]) {
        [[SXR shareInstance] AddCommand:CMD_CZJK_GETFW withParam:paramlist toCharacteristicKey:nil HighPriority:NO waitResponse:YES];
    }
 
}
+(void)ReadMacID:(NSDictionary*)paramlist{
    if ([[SXR shareInstance] isConnect]) {
        [[SXR shareInstance] AddCommand:CMD_CZJK_GETMAC withParam:paramlist toCharacteristicKey:nil HighPriority:NO waitResponse:YES];
    }
  
}
+(void)SetSensorState:(NSDictionary*)paramlist{
    if ([[SXR shareInstance] isConnect]) {
        [[SXR shareInstance] AddCommand:CMD_CZJK_SENSOR_CHANGE withParam:paramlist toCharacteristicKey:nil HighPriority:NO waitResponse:YES];
    }
    
}
@end
