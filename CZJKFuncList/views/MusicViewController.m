//
//  MusicViewController.m
//  CZJKFuncList
//
//  Created by qf on 16/10/12.
//  Copyright © 2016年 Keeprapid. All rights reserved.
//

#import "MusicViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface MusicViewController ()<UITableViewDelegate,UITableViewDataSource,AVAudioPlayerDelegate>
@property(nonatomic, strong)UITableView* tableview;
@property(nonatomic, strong)NSMutableArray* resultlist;
@property (nonatomic, strong) MPMusicPlayerController * musicplayer;

@end

@implementation MusicViewController
-(void)viewWillAppear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onRecvMusicControl:) name:notify_key_did_recv_music_control object:nil];
}

-(void)viewWillDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    self.musicplayer = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.resultlist = [[NSMutableArray alloc] init];
    self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-65) style:UITableViewStylePlain];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.view addSubview:self.tableview];
    if(self.musicplayer == nil){
        self.musicplayer = [MPMusicPlayerController systemMusicPlayer];
        self.musicplayer.repeatMode = MPMusicRepeatModeAll;
        [self.musicplayer beginGeneratingPlaybackNotifications];
        NSUInteger p = [self.musicplayer indexOfNowPlayingItem];
        if (p == NSNotFound) {
            MPMediaQuery* query = [MPMediaQuery songsQuery];
            [self.musicplayer setQueueWithQuery:query];
        }
        
    }


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
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

-(void)onRecvMusicControl:(NSNotification*)notify{
    NSDictionary* dict = notify.userInfo;
    int control = [[dict objectForKey:NOTIFY_KEY_MUSIC_CONTROL] intValue];
    if (control == MUSIC_CONTROL_PLAY) {
        [self music_play];
        [self.resultlist addObject:[NSString stringWithFormat:@"recv MUSIC_CONTROL_PLAY"]];
    }else if (control == MUSIC_CONTROL_NEXT){
        [self music_next];
        [self.resultlist addObject:[NSString stringWithFormat:@"recv MUSIC_CONTROL_NEXT"]];
    }else if (control == MUSIC_CONTROL_PREV){
        [self music_back];
        [self.resultlist addObject:[NSString stringWithFormat:@"recv MUSIC_CONTROL_PREV"]];
    }
    [self.tableview reloadData];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)music_play{
    
    MPMusicPlaybackState playbackState = [self.musicplayer playbackState];
    NSLog(@"playbackstate = %ld",(long)playbackState);
    if (playbackState == MPMusicPlaybackStateStopped || playbackState == MPMusicPlaybackStatePaused || playbackState == MPMusicPlaybackStateInterrupted) {
        
        [self.musicplayer play];
    } else if (playbackState == MPMusicPlaybackStatePlaying) {
        [self.musicplayer pause];
    }
    
}

-(void)music_next{
    MPMusicPlaybackState playbackState = [self.musicplayer playbackState];
    NSLog(@"playbackstate = %ld",(long)playbackState);
    if (playbackState == MPMusicPlaybackStatePlaying){
        [self.musicplayer endSeeking];
        [self.musicplayer skipToNextItem];
        [self.musicplayer play];
    }
    
}

-(void)music_back{
    MPMusicPlaybackState playbackState = [self.musicplayer playbackState];
    NSLog(@"playbackstate = %ld",(long)playbackState);
    if (playbackState == MPMusicPlaybackStatePlaying){
        [self.musicplayer endSeeking];
        [self.musicplayer skipToPreviousItem];
        [self.musicplayer play];
    }    
    
}

@end
