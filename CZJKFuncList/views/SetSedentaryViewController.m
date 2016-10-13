//
//  SetSedentaryViewController.m
//  CZJKFuncList
//
//  Created by qf on 16/10/12.
//  Copyright © 2016年 Keeprapid. All rights reserved.
//

#import "SetSedentaryViewController.h"
#import "SXRService.h"

@interface SetSedentaryViewController ()
@property(nonatomic, strong)UILabel* infolabel;

@end

@implementation SetSedentaryViewController
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
    NSString* labelstr = [NSString stringWithFormat:@"Sedentary Alarm Info:\nAlarmEnable:ON\nStartHour:1\nEndHour:2\nSnooze:1\nWeekly:AllDay(%d)",DEMO_ALARM_WEEKLY];
    self.infolabel.text = labelstr;

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
    NSDictionary* paramlist = @{CZJK_PARAM_ALARM_ENABLE:[NSNumber numberWithInt:DEMO_ALARM_ENABLE],
                                CZJK_PARAM_START_HOUR:[NSNumber numberWithInt:1],
                                CZJK_PARAM_END_HOUR:[NSNumber numberWithInt:2],
                                CZJK_PARAM_SNOOZE:[NSNumber numberWithInt:1],
                                CZJK_PARAM_WEEKLY:[NSNumber numberWithInt:DEMO_ALARM_WEEKLY]};
    [SXRService SetSedentary:paramlist];
    
}

-(void)onCmdFinish:(NSNotification*)notify{
    NSDictionary* dict = notify.userInfo;
    int substate = [[dict objectForKey:NOTIFY_KEY_SUBSTATE] intValue];
    bool isok = [[dict objectForKey:NOTIFY_KEY_ISOK] boolValue];
    switch (substate) {
        case SUB_STATE_CZJK_WAIT_SETSEDETARYALARM_RSP:
            if (isok) {
                UIAlertController* ac = [UIAlertController alertControllerWithTitle:nil message:NSLocalizedString(@"Set Sedentary Alarm OK", nil) preferredStyle:UIAlertControllerStyleAlert];
                [ac addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                    
                }]];
                [self presentViewController:ac animated:YES completion:nil];
                
            }else{
                UIAlertController* ac = [UIAlertController alertControllerWithTitle:nil message:NSLocalizedString(@"Set Sedentary Alarm Error", nil) preferredStyle:UIAlertControllerStyleAlert];
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
