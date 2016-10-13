//
//  SetAlarmViewController.m
//  CZJKFuncList
//
//  Created by qf on 16/10/12.
//  Copyright © 2016年 Keeprapid. All rights reserved.
//

#import "SetAlarmViewController.h"
#import "SXRService.h"

@interface SetAlarmViewController ()
@property(nonatomic, strong)UILabel* infolabel;
@property(nonatomic, assign)int alarm1hour;
@property(nonatomic, assign)int alarm2hour;
@property(nonatomic, assign)int alarm1minute;
@property(nonatomic, assign)int alarm2minute;

@end

@implementation SetAlarmViewController
-(void)viewWillAppear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onCmdFinish:) name:notify_key_did_finish_send_cmd object:nil];

}
-(void)viewWillDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTranslucent:NO];
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame)-200)/2.0, 10, 200, 30)];
    [btn setTitle:NSLocalizedString(@"Sync", nil) forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor darkGrayColor]];
    [btn addTarget:self action:@selector(onClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

    self.infolabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(btn.frame)+10, CGRectGetWidth(self.view.frame), 300)];
    self.infolabel.textColor = [UIColor blackColor];
    self.infolabel.numberOfLines = 0;
    self.infolabel.adjustsFontSizeToFitWidth = YES;
    self.infolabel.minimumScaleFactor = 0.5;
    self.infolabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:self.infolabel];
    NSDate* date = [NSDate date];
    NSCalendar* calender = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSDate* alarm1date = [date dateByAddingTimeInterval:10*60];
    NSDate* alarm2date = [date dateByAddingTimeInterval:20*60];
    NSDateComponents* comp = [calender components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute fromDate:alarm1date];
    self.alarm1hour = comp.hour;
    self.alarm1minute = comp.minute;
    
    
    comp = [calender components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute fromDate:alarm2date];
    self.alarm2hour = comp.hour;
    self.alarm2minute = comp.minute;
    
    
    
    NSString* labelstr = [NSString stringWithFormat:@"Person info:\nHeight:%f\nWeight:%f\nStride:%f\nUnit:Matrix(%d)\nBirth:%@\nTarget Step:%d\n\nAlarm Info:\nAlarm1:ON\nAlarm1Hour:%d\nAlarm1Minute:%d\nAlarm1Snooze:%d\nAlarm1Weekly:AllDay(%d)\nAlarm2:ON\nAlarm2Hour:%d\nAlarm2Minute:%d\nAlarm2Snooze:%d\nAlarm2Weekly:AllDay(%d)",DEMO_HEIGHT,DEMO_WEIGHT,DEMO_STRIDE,DEMO_UNIT,DEMO_BIRTH,DEMO_TARGET_STEP,self.alarm1hour,self.alarm1minute,DEMO_ALARM_SNOOZE,DEMO_ALARM_WEEKLY,self.alarm2hour,self.alarm2minute,DEMO_ALARM_SNOOZE,DEMO_ALARM_WEEKLY];
    self.infolabel.text = labelstr;
    
    
   // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)onClickBtn:(id)sender{
    NSDictionary* paramlist = @{CZJK_PARAM_GENDER:[NSNumber numberWithInt:DEMO_GENDER],
                                CZJK_PARAM_HEIGHT:[NSNumber numberWithFloat:DEMO_HEIGHT],
                                CZJK_PARAM_WEIGHT:[NSNumber numberWithFloat:DEMO_WEIGHT],
                                CZJK_PARAM_STRIDE:[NSNumber numberWithFloat:DEMO_STRIDE],
                                CZJK_PARAM_UNIT:[NSNumber numberWithInt:DEMO_UNIT],
                                CZJK_PARAM_TARGETSTEP:[NSNumber numberWithInt:DEMO_TARGET_STEP],
                                CZJK_PARAM_ALARMLIST:@[
                                        @{CZJK_PARAM_ALARM_ENABLE:[NSNumber numberWithInt:DEMO_ALARM_ENABLE],
                                          CZJK_PARAM_HOUR:[NSNumber numberWithInt:self.alarm1hour],
                                          CZJK_PARAM_MINUTE:[NSNumber numberWithInt:self.alarm1minute],
                                          CZJK_PARAM_SNOOZE:[NSNumber numberWithInt:DEMO_ALARM_SNOOZE],
                                          CZJK_PARAM_WEEKLY:[NSNumber numberWithInt:DEMO_ALARM_WEEKLY]},
                                        @{CZJK_PARAM_ALARM_ENABLE:[NSNumber numberWithInt:DEMO_ALARM_ENABLE],
                                          CZJK_PARAM_HOUR:[NSNumber numberWithInt:self.alarm2hour],
                                          CZJK_PARAM_MINUTE:[NSNumber numberWithInt:self.alarm2minute],
                                          CZJK_PARAM_SNOOZE:[NSNumber numberWithInt:DEMO_ALARM_SNOOZE],
                                          CZJK_PARAM_WEEKLY:[NSNumber numberWithInt:DEMO_ALARM_WEEKLY]}]
                                };
    [SXRService SetPersonInfo:paramlist];
    
}

-(void)onCmdFinish:(NSNotification*)notify{
    NSDictionary* dict = notify.userInfo;
    int substate = [[dict objectForKey:NOTIFY_KEY_SUBSTATE] intValue];
    bool isok = [[dict objectForKey:NOTIFY_KEY_ISOK] boolValue];
    switch (substate) {
        case SUB_STATE_CZJK_WAIT_SETPERSONINFO_RSP:
            if (isok) {
                UIAlertController* ac = [UIAlertController alertControllerWithTitle:nil message:NSLocalizedString(@"Set PersonInfo and Alarm OK", nil) preferredStyle:UIAlertControllerStyleAlert];
                [ac addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                    
                }]];
                [self presentViewController:ac animated:YES completion:nil];
                
            }else{
                UIAlertController* ac = [UIAlertController alertControllerWithTitle:nil message:NSLocalizedString(@"Set PersonInfo and Alarm Error", nil) preferredStyle:UIAlertControllerStyleAlert];
                [ac addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                    
                }]];
                [self presentViewController:ac animated:YES completion:nil];
                
            }
            break;
        default:
        break;
    }
}

@end
