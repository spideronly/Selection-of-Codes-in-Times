//
//  TodayViewController.m
//  Water widget
//
//  Created by Sami Shamsan on 1/1/15.
//  Copyright (c) 2015 com.Sami.Times. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import <QuartzCore/QuartzCore.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController
@synthesize drinkImageView,lblDrinkWaterMessage;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.preferredContentSize = CGSizeMake(0, 100);
    [self startImageViewAnimation];
    [self LoadLable];

    
    // Do any additional setup after loading the view from its nib.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // making up an IBOutlet called someLabel
    // making up a model method (description) that returns a string representing your model
    
    [self LoadLable];

}
-(void)LoadLable
{
    
    NSUserDefaults *defaults = [[NSUserDefaults alloc]initWithSuiteName:@"group.appadeedoo.Times"];
    NSString *DrinkTimeCounter= [NSString stringWithFormat:@"%@", [defaults stringForKey:@"save"]];
    if(!DrinkTimeCounter)
    DrinkTimeCounter=@"Drink Water ";
    
    lblDrinkWaterMessage.text=DrinkTimeCounter;
    

}
/*
-(UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets
{
    return UIEdgeInsetsZero;
    
}
*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)startImageViewAnimation
{
    
    //Array of image names. They are inside the XCode project folder
    NSArray *imageNames = @[@"water1.png", @"water2.png", @"water3.png", @"water4.png", @"water5.png", @"water6.png"];
    
    //Create Array of UIImage
    NSMutableArray *images = [NSMutableArray new];
    
    
    for (int i = 0; i < imageNames.count; i++)
    {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    /*
    //Now animate the UIImages with a single UIImageView
   UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(272, 0, 47, 100)]; //set here your frame
   animationImageView.animationImages = images;
    animationImageView.animationDuration = 1;
    
    //Add the UIImageView into the view
    [self.view addSubview:animationImageView];
    
    //Start animation
    [animationImageView startAnimating];

    */
    drinkImageView.animationImages=images;
    drinkImageView.animationDuration = 3;
    [drinkImageView startAnimating];

   }



- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData
    completionHandler(NCUpdateResultNewData);
}

@end
