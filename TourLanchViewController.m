//
//  TourLanchViewController.m
//  TIMES
//
//  Created by Sami Shamsan on 1/16/15.
//  Copyright (c) 2015 com.Sami.Times. All rights reserved.
//

#import "TourLanchViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVAudioPlayer.h>
@interface TourLanchViewController ()
{
    AVAudioPlayer *AudioPlayer;

}
@end

@implementation TourLanchViewController
@synthesize mymoviePlayerController;
- (void)viewDidLoad {
    [super viewDidLoad];

    self.mylabl.text=@"hello world";
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"APDD-Tutorial_beta-TimesApp" ofType:@"mp4"];
    
    
    NSURL    *fileURL    =   [NSURL fileURLWithPath:filepath];
    mymoviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
    
    mymoviePlayerController.fullscreen = YES;
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlaybackComplete:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:self.mymoviePlayerController];


    self.mymoviePlayerController.view.frame=self.view.bounds;

    [self.view addSubview:mymoviePlayerController.view];
    [mymoviePlayerController play];
    
    //Play audio
    AudioPlayer=[self setupAudioPlayerWithFile:@"APDD-TimesApp-WakeUpAlarm-Creation" type:@"wav"];
    [AudioPlayer play];
    
}


//Play Audio Method
- (AVAudioPlayer *)setupAudioPlayerWithFile:(NSString *)file type:(NSString *)type
{
    // 1
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:type];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    // 2
    NSError *error;
    
    // 3
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    
    // 4
    if (!audioPlayer) {
        NSLog(@"%@",[error description]);
    }
    
    // 5
    return audioPlayer;
}






- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}
-(void)viewDidAppear:(BOOL)animated
{

    
}
-
(void)moviePlaybackComplete:(NSNotification *)notification
{
    MPMoviePlayerController *moviePlayerController = [notification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:moviePlayerController];
    
    [moviePlayerController.view removeFromSuperview];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
