//
//  FirstCircleSettingViewController.h
//  TIMES
//
//  Created by Sami Shamsan on 1/11/15.
//  Copyright (c) 2015 com.Sami.Times. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstCircleSettingViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *btnFirstGroup;
@property (weak, nonatomic) IBOutlet UILabel *lblSectionName;

// Navigate to the Alarm
- (IBAction)AlarmSetting:(id)sender;

- (IBAction)WakeUpALarm:(id)sender;


@property (readwrite) IBOutlet UINavigationItem *Navitem;

@property (weak, nonatomic) IBOutlet UISwitch *swSleepAndWakeUp;
- (IBAction)SwSleepAndWakeUp:(id)sender;



@property (weak, nonatomic) IBOutlet UISwitch *swSnoozeSmoth;
- (IBAction)SwSnoozeSmooth:(id)sender;
//Other UIAction Controllers


- (IBAction)Done:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *lblAlarmDate;
@property (strong,nonatomic) NSString *WeekDay;

@property (weak, nonatomic) IBOutlet UILabel *lblsleepAlarm;

@property (weak, nonatomic) IBOutlet UILabel *lblWakeUpAlarm;

- (IBAction)AllWakeUpAndSleepAlarmAlarms:(id)sender;

//Public Methods
@end
