//
//  AntilostViewController.m
//  CZJKFuncList
//
//  Created by qf on 16/10/12.
//  Copyright © 2016年 Keeprapid. All rights reserved.
//

#import "AntilostViewController.h"
#import "SXRService.h"


@interface AntilostViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)UITableView* tableview;
@property(nonatomic, strong)NSMutableArray* resultlist;
@property(nonatomic, assign)int calltype;
@end

@implementation AntilostViewController
-(void)viewWillAppear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onRecvAntiLost:) name:notify_key_did_recv_device_find_phone object:nil];
}

-(void)viewWillDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.resultlist = [[NSMutableArray alloc] init];
    self.calltype = CZJK_PARAM_VALUE_FIND_DEVICE_STOP;
    self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-65) style:UITableViewStylePlain];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.view addSubview:self.tableview];
    self.tableview.tableHeaderView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 80)];
        view.backgroundColor = [UIColor colorWithRed:222/255.0 green:222/255.0 blue:222/255.0 alpha:1.0];
        UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame)-300)/2.0, 10, 300,50)];
        [btn setTitle:NSLocalizedString(@"Find Device Start/Stop", nil) forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor darkGrayColor]];
        [btn addTarget:self action:@selector(onClickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
         view;
    });

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
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.resultlist.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [self.tableview dequeueReusableCellWithIdentifier:@"simplecell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"simplecell"];
    }
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.text = [self.resultlist objectAtIndex:indexPath.row];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    cell.textLabel.minimumScaleFactor = 0.5;
    return cell;
    
}

-(void)onRecvAntiLost:(NSNotification*)notify{
    NSDictionary* dict = notify.userInfo;
    int action = [[dict objectForKey:NOTIFY_KEY_FINDPHONE_ONOFF] intValue];
    if (action == FIND_PHONE_START) {
//        UILocalNotification *notification=[[UILocalNotification alloc] init];
//        if (notification!=nil) {
//            NSDate *now=[NSDate new];
//            notification.fireDate=[NSDate date];//10秒后通知
//            notification.repeatInterval=0;//循环次数，kCFCalendarUnitWeekday一周一次
//            notification.timeZone=[NSTimeZone defaultTimeZone];
//            notification.applicationIconBadgeNumber=0; //应用的红色数字
//            notification.soundName= @"alarm.caf";
//            [[UIApplication sharedApplication] scheduleLocalNotification:notification];
//        }
        [self.resultlist insertObject:@"RECV FIND_PHONE_START" atIndex:0];
    }else{
        [self.resultlist insertObject:@"RECV FIND_PHONE_STOP" atIndex:0];
    }
    [self.tableview reloadData];
}

-(void)onClickBtn:(id)sender{
    if (self.calltype == CZJK_PARAM_VALUE_FIND_DEVICE_STOP) {
        [SXRService FindDevice:@{CZJK_PARAM_ANTILOST_TYPE:[NSNumber numberWithInt:CZJK_PARAM_VALUE_FIND_DEVICE_START]}];
        self.calltype = CZJK_PARAM_VALUE_FIND_DEVICE_START;
    }else{
        [SXRService FindDevice:@{CZJK_PARAM_ANTILOST_TYPE:[NSNumber numberWithInt:CZJK_PARAM_VALUE_FIND_DEVICE_STOP]}];
        self.calltype = CZJK_PARAM_VALUE_FIND_DEVICE_STOP;
    }
  
}
@end
