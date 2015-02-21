//
//  TourLanchViewController.h
//  TIMES
//
//  Created by Sami Shamsan on 1/16/15.
//  Copyright (c) 2015 com.Sami.Times. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
@interface TourLanchViewController : UIViewController
@property (nonatomic,strong) IBOutlet UILabel *mylabl;

@property(nonatomic,strong) MPMoviePlayerController *mymoviePlayerController;
@end
