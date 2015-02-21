//
//  FirstCircleSettingViewController.m
//  TIMES
//
//  Created by Sami Shamsan on 1/11/15.
//  Copyright (c) 2015 com.Sami.Times. All rights reserved.
//

#import "FirstCircleSettingViewController.h"

#import "SWRevealViewController.h"




@interface FirstCircleSettingViewController ()
@end
@implementation FirstCircleSettingViewController
@synthesize lblAlarmDate,WeekDay;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self LoadData];
    [self SetDates:NO SwipUp:NO];
   
  //  NSString *WakeUpTimeInstiation = [[NSUserDefaults standardUserDefaults] objectForKey:@"WakeUpTimeInstiation"];
  
  //  self.lblsleepAlarm.text=WakeUpTimeInstiation;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return NO;
}

// Swipe Gesture with the whole four direction


-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer
{
    
    

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController  *vc =[storyboard instantiateViewControllerWithIdentifier:@"SecondCircleSettingViewController"];
    
    [self presentViewController:vc animated:NO completion:nil];

}

-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer
{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController  *vc =[storyboard instantiateViewControllerWithIdentifier:@"ThirdCircleSettingViewController"];
    
    [self presentViewController:vc animated:NO completion:nil];
    //
}
-(void)swipeUp:(UISwipeGestureRecognizer*)gestureRecognizer
{    [self.view setNeedsDisplay];

    
    //Not Working
    [self SetDates:NO SwipUp:YES];
    [self LoadData];
}

-(void)swipeDown:(UISwipeGestureRecognizer*)gestureRecognizer
{
    
    
}
-(void)LoadTheGestureSwipType
{
    UISwipeGestureRecognizer * swipeleft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeleft:)];
    swipeleft.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeleft];
    
    UISwipeGestureRecognizer * swiperight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperight:)];
    swiperight.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swiperight];
    
    UISwipeGestureRecognizer * swipeUp=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeUp:)];
    swipeUp.direction=UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeUp];
    
    UISwipeGestureRecognizer * swipeDown=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeDown:)];
    swipeDown.direction=UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipeDown];
    
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // making up an IBOutlet called someLabel
    // making up a model method (description) that returns a string representing your model
    [self LoadDisplay];

}
-(void)LoadData
{
    
    [self LoadTheGestureSwipType];
    [self LoadShapAndColors];
    [self LoadText];
   // [self LoadHoursValues];
    [self LoadSwitchsCase];
     [self LoadDisplay];

    NSData *WeekDaysData = [[NSUserDefaults standardUserDefaults] objectForKey:@"WeekDayPublicLable"];
    NSString *WeekDays = [NSKeyedUnarchiver unarchiveObjectWithData:WeekDaysData];
    [self LoadHoursValues:WeekDays ];
    


}
-(void)LoadDisplay
{
      [self SleepTimeDisplay];
    
      [self WakeUpTimeDisplay];
}

-(void)SleepTimeDisplay
{
    
    [self.view setNeedsDisplay];
    [_lblsleepAlarm setNeedsDisplay];
    NSData *WeekDaysData = [[NSUserDefaults standardUserDefaults] objectForKey:@"WeekDayPublicLable"];
    NSString *WeekDays = [NSKeyedUnarchiver unarchiveObjectWithData:WeekDaysData];

    if([WeekDays isEqualToString:@"0"])
    {
    if([self GetNotificationDateFromID:@"SleepNotificationIDMonday"])
    {
        // Format the date
       
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"HH:mm a"];
            NSString *stringFromDate = [formatter stringFromDate:[self GetNotificationDateFromID:@"SleepNotificationIDMonday"]];
            
            //unless ARC is active
            [self.lblsleepAlarm setText:stringFromDate];
        
              NSLog(@" w0 %@",[self GetNotificationDateFromID:@"SleepNotificationIDMonday"]);

    }
    }
    else if([WeekDays isEqualToString:@"1"])
    {
        if([self GetNotificationDateFromID:@"SleepNotificationIDTuesday"])
        {
            
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"HH:mm a"];
            NSString *stringFromDate = [formatter stringFromDate:[self GetNotificationDateFromID:@"SleepNotificationIDTuesday"]];
            
            //unless ARC is active
            [self.lblsleepAlarm setText:stringFromDate];
        }

        NSLog(@" w1 %@",[self GetNotificationDateFromID:@"SleepNotificationIDTuesday"]);

        
    }
    else if([WeekDays isEqualToString:@"2"])
    {
        if([self GetNotificationDateFromID:@"SleepNotificationIDWednesday"])
        {
           
            // Format the date
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"HH:mm a"];
            NSString *stringFromDate = [formatter stringFromDate:[self GetNotificationDateFromID:@"SleepNotificationIDWednesday"]];
            
            [self.lblsleepAlarm setText:stringFromDate];
        }
        NSLog(@" w2 %@",[self GetNotificationDateFromID:@"SleepNotificationIDWednesday"]);

        
    }
   else if([WeekDays isEqualToString:@"3"])
    {
        if([self GetNotificationDateFromID:@"SleepNotificationIDThursday"])
        {
            // Format the date
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"HH:mm a"];
            NSString *stringFromDate = [formatter stringFromDate:[self GetNotificationDateFromID:@"SleepNotificationIDThursday"]];
            [self.lblsleepAlarm setText:stringFromDate];

        }
        NSLog(@" w3 %@",[self GetNotificationDateFromID:@"SleepNotificationIDThursday"]);

        
    }
   else if([WeekDays isEqualToString:@"4"])
   {
       
       if([self GetNotificationDateFromID:@"SleepNotificationIDFriday"])
       {
           // Format the date
           NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
           [formatter setDateFormat:@"HH:mm a"];
           NSString *stringFromDate = [formatter stringFromDate:[self GetNotificationDateFromID:@"SleepNotificationIDFriday"]];
           [self.lblsleepAlarm setText:stringFromDate];
           

       }
       NSLog(@" w4 %@",[self GetNotificationDateFromID:@"SleepNotificationIDFriday"]);

   }

   else if([WeekDays isEqualToString:@"5"])
   {
       
       if([self GetNotificationDateFromID:@"SleepNotificationIDSaturday"])
       {
           // Format the date
           NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
           [formatter setDateFormat:@"hh:mm a"];
           NSString *stringFromDate = [formatter stringFromDate:[self GetNotificationDateFromID:@"SleepNotificationIDSaturday"]];
           [self.lblsleepAlarm setText:stringFromDate];
       }
       NSLog(@" w5 %@",[self GetNotificationDateFromID:@"SleepNotificationIDSaturday"]);

   }
   else if([WeekDays isEqualToString:@"6"])
   {
       
       if([self GetNotificationDateFromID:@"SleepNotificationIDSunday"])
       {
           // Format the date
           NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
           [formatter setDateFormat:@"HH:mm a"];
           NSString *stringFromDate = [formatter stringFromDate:[self GetNotificationDateFromID:@"SleepNotificationIDSunday"]];
           [self.lblsleepAlarm setText:stringFromDate];
       }
       NSLog(@" w6 %@",[self GetNotificationDateFromID:@"SleepNotificationIDSunday"]);

   }
else
{
    if([self GetNotificationDateFromID:@"SleepNotificationIDSunday"])
    {
        // Format the date
        // Format the date
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"HH:mm a"];
        NSString *stringFromDate = [formatter stringFromDate:[self GetNotificationDateFromID:@"SleepNotificationIDSunday"]];
        [self.lblsleepAlarm setText:stringFromDate];

    }


}
    
    
  }
-(void)WakeUpTimeDisplay
{
    

    
    
    NSData *WeekDaysData = [[NSUserDefaults standardUserDefaults] objectForKey:@"WeekDayPublicLable"];
    NSString *WeekDays = [NSKeyedUnarchiver unarchiveObjectWithData:WeekDaysData];
    
    if([WeekDays isEqualToString:@"0"])
    {
        if([self GetNotificationDateFromID:@"WakupNotificationIDMonday"])
        {
            // Format the date
            
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"HH:mm a"];
            NSString *stringFromDate;
            if(![[NSUserDefaults standardUserDefaults] boolForKey:@"isSmoothActive"])
            {
                stringFromDate = [formatter stringFromDate:[self GetNotificationDateFromIDWithAdd:@"WakupNotificationIDMonday"]];
            }
            else
            {
                stringFromDate = [formatter stringFromDate:[self GetNotificationDateFromID:@"WakupNotificationIDMonday"]];
                
                
            }
            //unless ARC is active
            
            self.lblWakeUpAlarm.text=stringFromDate;
            
            //            [self.lblWakeUpAlarm setText:stringFromDate];
            
            NSLog(@" w0 %@",[self GetNotificationDateFromID:@"WakupNotificationIDMonday"]);
            
        }
    }
    else if([WeekDays isEqualToString:@"1"])
    {
        if([self GetNotificationDateFromID:@"WakupNotificationIDTuesday"])
        {
            
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"HH:mm a"];
            NSString *stringFromDate;
            if(![[NSUserDefaults standardUserDefaults] boolForKey:@"isSmoothActive"])
            {
                stringFromDate = [formatter stringFromDate:[self GetNotificationDateFromIDWithAdd:@"WakupNotificationIDTuesday"]];
            }
            else
            {
                stringFromDate = [formatter stringFromDate:[self GetNotificationDateFromID:@"WakupNotificationIDTuesday"]];
                
            }
            
            //unless ARC is active
            self.lblWakeUpAlarm.text=stringFromDate;
            
            //[self.lblWakeUpAlarm setText:stringFromDate];
        }
        
        NSLog(@" w1 %@",[self GetNotificationDateFromID:@"WakupNotificationIDTuesday"]);
        
        
    }
    else if([WeekDays isEqualToString:@"2"])
    {
        if([self GetNotificationDateFromID:@"WakupNotificationIDWednesday"])
        {
            // Format the date
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"HH:mm a"];
            NSString *stringFromDate;
            if(![[NSUserDefaults standardUserDefaults] boolForKey:@"isSmoothActive"])
            {
                stringFromDate = [formatter stringFromDate:[self GetNotificationDateFromIDWithAdd:@"WakupNotificationIDWednesday"]];
            }
            else
            {
                stringFromDate = [formatter stringFromDate:[self GetNotificationDateFromID:@"WakupNotificationIDWednesday"]];
                
            }
            
            self.lblWakeUpAlarm.text=stringFromDate;
            
            //[self.lblWakeUpAlarm setText:stringFromDate];
        }
        NSLog(@" w2 %@",[self GetNotificationDateFromID:@"WakupNotificationIDWednesday"]);
        
        
    }
    else if([WeekDays isEqualToString:@"3"])
    {
        if([self GetNotificationDateFromID:@"WakupNotificationIDThursday"])
        {
            
            
            // Format the date
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"HH:mm a"];
            NSString *stringFromDate;
            
            if(![[NSUserDefaults standardUserDefaults] boolForKey:@"isSmoothActive"])
            {
                stringFromDate = [formatter stringFromDate:[self GetNotificationDateFromIDWithAdd:@"WakupNotificationIDThursday"]];
            }
            else
            {
                stringFromDate = [formatter stringFromDate:[self GetNotificationDateFromID:@"WakupNotificationIDThursday"]];
                
            }
            self.lblWakeUpAlarm.text=stringFromDate;
            
            // [self.lblWakeUpAlarm setText:stringFromDate];
            
        }
        NSLog(@" w3 %@",[self GetNotificationDateFromID:@"WakupNotificationIDThursday"]);
        
        
    }
    else if([WeekDays isEqualToString:@"4"])
    {
        
        if([self GetNotificationDateFromID:@"WakupNotificationIDFriday"])
        {
            
            // Format the date
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"HH:mm a"];
            NSString *stringFromDate;
            
            if(![[NSUserDefaults standardUserDefaults] boolForKey:@"isSmoothActive"])
            {
                stringFromDate = [formatter stringFromDate:[self GetNotificationDateFromIDWithAdd:@"WakupNotificationIDFriday"]];
            }
            else
            {
                stringFromDate = [formatter stringFromDate:[self GetNotificationDateFromID:@"WakupNotificationIDFriday"]];
                
            }
            
            
            self.lblWakeUpAlarm.text=stringFromDate;
            
            //[self.lblWakeUpAlarm setText:stringFromDate];
            
            
        }
        NSLog(@" w4 %@",[self GetNotificationDateFromID:@"WakupNotificationIDFriday"]);
        
    }
    
    else if([WeekDays isEqualToString:@"5"])
    {
        
        if([self GetNotificationDateFromID:@"WakupNotificationIDSaturday"])
        {
            
            
            // Format the date
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"hh:mm a"];
            NSString *stringFromDate;
            
            if(![[NSUserDefaults standardUserDefaults] boolForKey:@"isSmoothActive"])
            {
                stringFromDate = [formatter stringFromDate:[self GetNotificationDateFromIDWithAdd:@"WakupNotificationIDSaturday"]];
            }
            else
            {
                stringFromDate = [formatter stringFromDate:[self GetNotificationDateFromID:@"WakupNotificationIDSaturday"]];
                
            }
            
            self.lblWakeUpAlarm.text=stringFromDate;
            
            //[self.lblWakeUpAlarm setText:stringFromDate];
        }
        NSLog(@" w5 %@",[self GetNotificationDateFromID:@"WakupNotificationIDSaturday"]);
        
    }
    else if([WeekDays isEqualToString:@"6"])
    {
        
        if([self GetNotificationDateFromID:@"WakupNotificationIDSunday"])
        {
            // Format the date
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"HH:mm a"];
            NSString *stringFromDate;
            
            if(![[NSUserDefaults standardUserDefaults] boolForKey:@"isSmoothActive"])
            {
                stringFromDate = [formatter stringFromDate:[self GetNotificationDateFromIDWithAdd:@"WakupNotificationIDSunday"]];
            }
            else
            {
                stringFromDate = [formatter stringFromDate:[self GetNotificationDateFromID:@"WakupNotificationIDSunday"]];
                
            }
            //[self.lblWakeUpAlarm setText:stringFromDate];
            self.lblWakeUpAlarm.text=stringFromDate;
            
            
        }
        NSLog(@" w6 %@",[self GetNotificationDateFromID:@"WakupNotificationIDSunday"]);
        
    }
    else
    {
        if([self GetNotificationDateFromID:@"WakupNotificationIDSunday"])
        {
            // Format the date
            // Format the date
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"HH:mm a"];
            NSString *stringFromDate;
            
            if(![[NSUserDefaults standardUserDefaults] boolForKey:@"isSmoothActive"])
            {
                stringFromDate = [formatter stringFromDate:[self GetNotificationDateFromIDWithAdd:@"WakupNotificationIDSunday"]];
            }
            else
            {
                stringFromDate = [formatter stringFromDate:[self GetNotificationDateFromID:@"WakupNotificationIDSunday"]];
                
            }
            
            
            self.lblWakeUpAlarm.text=stringFromDate;
            
            //  [self.lblWakeUpAlarm setText:stringFromDate];
            
        }
        
        
    }
    

}
-(void)LoadSwitchsCase
{
  
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"SleepNotificationIDFlag"] || [[NSUserDefaults standardUserDefaults] boolForKey:@"WakeUpNotificationIDFlag"])
    {
        
        [_swSleepAndWakeUp setOn:YES animated:YES];
        if([[NSUserDefaults standardUserDefaults] boolForKey:@"SleepNotificationIDFlag"]){
            
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"SleepNotificationIDFlag"];
           // [self SetUpSleepBeeping];
        }
        if([[NSUserDefaults standardUserDefaults] boolForKey:@"WakeUpNotificationIDFlag"]){
            
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"WakeUpNotificationIDFlag"];
           // [self SetUpWakeupBeeping];
            
        }
        
        
    }
    else
    {
        
        
        [_swSleepAndWakeUp setOn:NO animated:YES];
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"SleepNotificationIDFlag"])
        {
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"SleepNotificationIDFlag"];
           // [self cancelSleepBeeping];
            
        }
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"WakeUpNotificationIDFlag"])
        {
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"WakeUpNotificationIDFlag"];
            
            //[self cancelWakeUpBeeping];
            
            
            
        }
        
        //=======
        
    }
    
    
    //==============================
    
    // Snooze Switch
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"isSmoothActive"])
    {
        // Snooze is Active
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isSmoothActive"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isSnoozeActive"];
                   [_swSnoozeSmoth setOn:NO animated:YES];
            
        
    }
    //Smooth switch
    else
    {
        
        //Set Up THe Outlet and triggers
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isSmoothActive"];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isSnoozeActive"];
        [_swSnoozeSmoth setOn:YES animated:YES];
        
        
        
    }

    
}

-(void)LoadText
{

    
    NSData *firstTextData = [[NSUserDefaults standardUserDefaults] objectForKey:@"firstSliderTextData"];
    NSString *firsttext = [NSKeyedUnarchiver unarchiveObjectWithData:firstTextData];
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstSliderTextDataChangeFlag"]) {
        firsttext=@"Sleep";
    }
    self.lblSectionName.text=firsttext;
    


    
}
-(void)LoadShapAndColors
{
    
    NSData *firstcolorData = [[NSUserDefaults standardUserDefaults] objectForKey:@"firstSliderColorData"];
    UIColor *firstdolor = [NSKeyedUnarchiver unarchiveObjectWithData:firstcolorData];
    
    //Setup The button Round and Border width
    _btnFirstGroup.layer.borderWidth = 12;
    _btnFirstGroup.layer.cornerRadius=_btnFirstGroup.layer.bounds.size.width/2;
    
    
    
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstSliderColorDataChangeFlag"]) {
        firstdolor=[UIColor blueColor];
    }
    
    
    
    [_btnFirstGroup setTitleColor:firstdolor forState:UIControlStateNormal];
    _btnFirstGroup.layer.borderColor =firstdolor.CGColor;
    //
    
    
    
    
}
-(void)LoadHoursValues:(NSString *)indexpath
{
    
    //
    NSData *firstValueData ;
    
    NSData *secondValueData ;
    
    NSData *thirdValueData ;
    
    NSString *firstValue;
    NSString *secondValue;
    NSString *thirdValue;
    
    //NSData *WeekDaysData = [[NSUserDefaults standardUserDefaults] objectForKey:@"WeekDayPublicLable"];
    //  NSString *WeekDays = [NSKeyedUnarchiver unarchiveObjectWithData:WeekDaysData];
    
    //Monday
    if([indexpath isEqualToString:@"0"])
    {
        firstValueData = [[NSUserDefaults standardUserDefaults] objectForKey:@"MondayfirstValueData"];
        secondValueData = [[NSUserDefaults standardUserDefaults] objectForKey:@"MondaysecondValueData"];
        thirdValueData = [[NSUserDefaults standardUserDefaults] objectForKey:@"MondaythirdValueData"];
        firstValue = [NSKeyedUnarchiver unarchiveObjectWithData:firstValueData];
        secondValue = [NSKeyedUnarchiver unarchiveObjectWithData:secondValueData];
        thirdValue = [NSKeyedUnarchiver unarchiveObjectWithData:thirdValueData];
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"MondayfirstValueDataChangeFlag"]) {
            firstValue=@"8";
        }
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"MondaysecondValueDataChangeFlag"]) {
            
            secondValue=@"8";
            
        }
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"MondaythirdValueDataChangeFlag"]) {
            thirdValue=@"8";
            
        }
        [_btnFirstGroup setTitle:firstValue forState:UIControlStateNormal];
        
        
    }
    else if ([indexpath isEqualToString:@"1"])
    {
        firstValueData = [[NSUserDefaults standardUserDefaults] objectForKey:@"TuesdayfirstValueData"];
        secondValueData = [[NSUserDefaults standardUserDefaults] objectForKey:@"TuesdaysecondValueData"];
        thirdValueData = [[NSUserDefaults standardUserDefaults] objectForKey:@"TuesdaythirdValueData"];
        firstValue = [NSKeyedUnarchiver unarchiveObjectWithData:firstValueData];
        secondValue = [NSKeyedUnarchiver unarchiveObjectWithData:secondValueData];
        thirdValue = [NSKeyedUnarchiver unarchiveObjectWithData:thirdValueData];
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"TuesdayfirstValueDataChangeFlag"]) {
            firstValue=@"8";
        }
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"TuesdaysecondValueDataChangeFlag"]) {
            
            secondValue=@"8";
            
        }
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"TuesdaythirdValueDataChangeFlag"]) {
            thirdValue=@"8";
            
        }
        [_btnFirstGroup setTitle:firstValue forState:UIControlStateNormal];
        
        
        
        
    }
    else if ([indexpath isEqualToString:@"2"])
    {
        firstValueData = [[NSUserDefaults standardUserDefaults] objectForKey:@"WendsadayfirstValueData"];
        secondValueData = [[NSUserDefaults standardUserDefaults] objectForKey:@"WendsadaysecondValueData"];
        thirdValueData = [[NSUserDefaults standardUserDefaults] objectForKey:@"WendsadaythirdValueData"];
        firstValue = [NSKeyedUnarchiver unarchiveObjectWithData:firstValueData];
        secondValue = [NSKeyedUnarchiver unarchiveObjectWithData:secondValueData];
        thirdValue = [NSKeyedUnarchiver unarchiveObjectWithData:thirdValueData];
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"WendsadayfirstValueDataChangeFlag"]) {
            firstValue=@"8";
        }
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"WendsadaysecondValueDataChangeFlag"]) {
            
            secondValue=@"8";
            
        }
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"WendsadaythirdValueDataChangeFlag"]) {
            thirdValue=@"8";
            
        }
        [_btnFirstGroup setTitle:firstValue forState:UIControlStateNormal];
        
        
        
        
    }
    
    else if ([indexpath isEqualToString:@"3"])
    {
        firstValueData = [[NSUserDefaults standardUserDefaults] objectForKey:@"ThursdayfirstValueData"];
        secondValueData = [[NSUserDefaults standardUserDefaults] objectForKey:@"ThursdaysecondValueData"];
        thirdValueData = [[NSUserDefaults standardUserDefaults] objectForKey:@"ThursdaythirdValueData"];
        firstValue = [NSKeyedUnarchiver unarchiveObjectWithData:firstValueData];
        secondValue = [NSKeyedUnarchiver unarchiveObjectWithData:secondValueData];
        thirdValue = [NSKeyedUnarchiver unarchiveObjectWithData:thirdValueData];
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"ThursdayfirstValueDataChangeFlag"]) {
            firstValue=@"8";
        }
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"ThursdaysecondValueDataChangeFlag"]) {
            
            secondValue=@"8";
            
        }
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"ThursdaythirdValueDataChangeFlag"]) {
            thirdValue=@"8";
            
        }
        [_btnFirstGroup setTitle:firstValue forState:UIControlStateNormal];
        
        
        
        
    }
    
    
    else if ([indexpath isEqualToString:@"4"])
    {
        firstValueData = [[NSUserDefaults standardUserDefaults] objectForKey:@"FridayfirstValueData"];
        secondValueData = [[NSUserDefaults standardUserDefaults] objectForKey:@"FridaysecondValueData"];
        thirdValueData = [[NSUserDefaults standardUserDefaults] objectForKey:@"FridaythirdValueData"];
        firstValue = [NSKeyedUnarchiver unarchiveObjectWithData:firstValueData];
        secondValue = [NSKeyedUnarchiver unarchiveObjectWithData:secondValueData];
        thirdValue = [NSKeyedUnarchiver unarchiveObjectWithData:thirdValueData];
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"FridayfirstValueDataChangeFlag"]) {
            firstValue=@"8";
        }
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"FridaysecondValueDataChangeFlag"]) {
            
            secondValue=@"8";
            
        }
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"FridaythirdValueDataChangeFlag"]) {
            thirdValue=@"8";
            
        }
        [_btnFirstGroup setTitle:firstValue forState:UIControlStateNormal];
        
        
        
        
    }
    
    else if ([indexpath isEqualToString:@"5"])
    {
        firstValueData = [[NSUserDefaults standardUserDefaults] objectForKey:@"SutardayfirstValueData"];
        secondValueData = [[NSUserDefaults standardUserDefaults] objectForKey:@"SutardaysecondValueData"];
        thirdValueData = [[NSUserDefaults standardUserDefaults] objectForKey:@"SutardaythirdValueData"];
        firstValue = [NSKeyedUnarchiver unarchiveObjectWithData:firstValueData];
        secondValue = [NSKeyedUnarchiver unarchiveObjectWithData:secondValueData];
        thirdValue = [NSKeyedUnarchiver unarchiveObjectWithData:thirdValueData];
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"SutardayfirstValueDataChangeFlag"]) {
            firstValue=@"8";
        }
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"SutardaysecondValueDataChangeFlag"]) {
            
            secondValue=@"8";
            
        }
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"SutardaythirdValueDataChangeFlag"]) {
            thirdValue=@"8";
            
        }
        [_btnFirstGroup setTitle:firstValue forState:UIControlStateNormal];
        
        
        
    }
    else if ([indexpath isEqualToString:@"6"])
    {
        firstValueData = [[NSUserDefaults standardUserDefaults] objectForKey:@"SundayfirstValueData"];
        secondValueData = [[NSUserDefaults standardUserDefaults] objectForKey:@"SundaysecondValueData"];
        thirdValueData = [[NSUserDefaults standardUserDefaults] objectForKey:@"SundaythirdValueData"];
        firstValue = [NSKeyedUnarchiver unarchiveObjectWithData:firstValueData];
        secondValue = [NSKeyedUnarchiver unarchiveObjectWithData:secondValueData];
        thirdValue = [NSKeyedUnarchiver unarchiveObjectWithData:thirdValueData];
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"SundayfirstValueDataChangeFlag"]) {
            firstValue=@"8";
        }
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"SundaysecondValueDataChangeFlag"]) {
            
            secondValue=@"8";
            
        }
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"SundaythirdValueDataChangeFlag"]) {
            thirdValue=@"8";
            
        }
        [_btnFirstGroup setTitle:firstValue forState:UIControlStateNormal];
        
        
        
        
    }
    
    else     {
        
        firstValueData = [[NSUserDefaults standardUserDefaults] objectForKey:@"firstValueData"];
        secondValueData = [[NSUserDefaults standardUserDefaults] objectForKey:@"SecondValueData"];
        thirdValueData = [[NSUserDefaults standardUserDefaults] objectForKey:@"ThirdValueData"];
        firstValue = [NSKeyedUnarchiver unarchiveObjectWithData:firstValueData];
        secondValue = [NSKeyedUnarchiver unarchiveObjectWithData:secondValueData];
        thirdValue = [NSKeyedUnarchiver unarchiveObjectWithData:thirdValueData];
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstValueDataChangeFlag"]) {
            firstValue=@"8";
        }
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"secondValueDataChangeFlag"]) {
            
            secondValue=@"8";
            
        }
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"thirdSValueDataChangeFlag"]) {
            thirdValue=@"8";
            
        }
        [_btnFirstGroup setTitle:firstValue forState:UIControlStateNormal];
        
        
        
        
    }
    
    
    
    
    
    
}

-(void)LoadHoursValues
{
    
    
    NSData *firstValueData = [[NSUserDefaults standardUserDefaults] objectForKey:@"firstValueData"];
    NSString *firstValue = [NSKeyedUnarchiver unarchiveObjectWithData:firstValueData];
    
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstValueDataChangeFlag"]) {
        firstValue=@"8";
    }
        [_btnFirstGroup setTitle:firstValue forState:UIControlStateNormal];
    
    
}
-(void)NavigateToSetting
{

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController  *vc =[storyboard instantiateViewControllerWithIdentifier:@"FGAlarmsViewController"];
    
    [self presentViewController:vc animated:YES completion:nil];
    
    

}


//========================================================================
#pragma mark -Setup Notification
//============================================================================


- (IBAction)AlarmSetting:(id)sender {
   
    [[NSUserDefaults standardUserDefaults] setObject:@"First" forKey:@"WhatPage"];
    [[NSUserDefaults standardUserDefaults] setObject:@"WakeUp" forKey:@"RecordFor"];
    [[NSUserDefaults standardUserDefaults] setObject:@"Sleep" forKey:@"WhatButton"];

    [self NavigateToSetting];
}

- (IBAction)WakeUpALarm:(id)sender {
    
    //
    [[NSUserDefaults standardUserDefaults] setObject:@"First" forKey:@"WhatPage"];
    [[NSUserDefaults standardUserDefaults] setObject:@"Sleep" forKey:@"RecordFor"];
    [[NSUserDefaults standardUserDefaults] setObject:@"WakeUp" forKey:@"WhatButton"];

   
      [self NavigateToSetting];

}
- (IBAction)SwSleepAndWakeUp:(id)sender {
    if (_swSleepAndWakeUp.isOn==YES) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"WakeUpNotificationIDFlag"];
         [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"SleepNotificationIDFlag"];
        //[self SetUpWakeupBeeping];
    }
    else
    {
        
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"WakeUpNotificationIDFlag"];
           [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"SleepNotificationIDFlag"];
        //[self cancelWakeUpBeeping];
    }

    
}
-(NSDate *)GetNotificationDateFromIDWithAdd:(NSString *)notificationID{
    
    NSDate *CurrentDate;
    NSDate *datePlusOneMinute;
    
    int minutesBefore;
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"isSmoothActive"])
    {
        // Snooze is Active
        
        if([[NSUserDefaults standardUserDefaults] boolForKey:@"isSnoozeActive"])
        {
            
            
            if( [[NSUserDefaults standardUserDefaults] boolForKey:@"isSnoozeFifteen"])
                
            {// Snooze for 3 times in 15 minutes
                minutesBefore=15;
                
            }
            else
                
            {// Snooze for 3 times in 15 minutes
                
                minutesBefore=30;
            }
            
        }
        
        
        
        // empsis thier status
        
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isSmoothActive"];
        
        
    }
    if(!minutesBefore)
    {
        minutesBefore=0;
        
    }
    //Smooth switch
    
    for (UILocalNotification *someNotification in [[UIApplication sharedApplication] scheduledLocalNotifications]) {
        if([[someNotification.userInfo objectForKey:@"notificationID"] isEqualToString:notificationID]) {
            
            CurrentDate =someNotification.fireDate;
            datePlusOneMinute = [CurrentDate dateByAddingTimeInterval:minutesBefore*60];;
        }
    }
    NSLog(@"%@",CurrentDate);
    return datePlusOneMinute;
    
}
//========================================================================
#pragma mark -    WakeUp Mode  ( Snooze - Somth System)
//============================================================================


-(void)FireUpWakeUpMode:(NSDate *)mydate WeekDay:(NSString *)myweekDay

{
    
    // reconizing which mode we are in and call the fuctions needed to excute the condition
    // Snooze Switch
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"isSmoothActive"])
    {
        // Snooze is Active
        
        if([[NSUserDefaults standardUserDefaults] boolForKey:@"isSnoozeActive"])
        {
            NSString *WakeUpToneFileName = [[NSUserDefaults standardUserDefaults] objectForKey:@"WakeUpSelectedToneFileNameData"];
            
            if (!WakeUpToneFileName) {
                // This is the 1st run of the app
                [[NSUserDefaults standardUserDefaults] setObject:@"APDD-TimesApp-WakeUpAlarm-Creation" forKey:@"WakeUpSelectedToneFileNameData"];
                
            }
            
            if( [[NSUserDefaults standardUserDefaults] boolForKey:@"isSnoozeFifteen"])
                
            {// Snooze for 3 times in 15 minutes
                
                [self SnoozeThreeInFifteen:WakeUpToneFileName inDate:mydate WeekDy:myweekDay];
                
            }
            else
                
            {// Snooze for 3 times in 15 minutes
                
                [self SnoozeThreeInThirty:WakeUpToneFileName inDate:mydate WeekDy:myweekDay];
                
            }
            
        }
        
        
        
        // empsis thier status
        
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isSmoothActive"];
        
        
    }
    //Smooth switch
    else
    {
        
        //Set Up THe Outlet and triggers
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isSmoothActive"];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isSnoozeActive"];
        
        
        
        
    }
    
}
//====================================================================================//==
-(void) scheduleNotificationForDate:(NSDate *)date AlertBody:(NSString *)alertBody ActionButtonTitle:(NSString *)actionButtonTitle NotificationID:(NSString *)notificationID CustomeSoundName:(NSString *)CustomeSound repeat:(int)hasRepeat InterVal:(int)minutesBefore{
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    NSLog(@"this is from inside the  schedual sami  %@",date);

    localNotification.fireDate = [date dateByAddingTimeInterval:minutesBefore*60];

    localNotification.timeZone = [NSTimeZone localTimeZone];
    localNotification.alertBody = alertBody;
    localNotification.alertAction = actionButtonTitle;
    localNotification.soundName = CustomeSound;
    if(hasRepeat==1)
        localNotification.repeatInterval=NSCalendarUnitHour;
    else if (hasRepeat==2)
        localNotification.repeatInterval=NSCalendarUnitDay;
    else
        localNotification.repeatInterval=0;
    
    
    
    NSDictionary *infoDict = [NSDictionary dictionaryWithObject:notificationID forKey:@"notificationID"];
    localNotification.userInfo = infoDict;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

- (void)SetNotificationForDate:(NSDate *)FireUpDate WeekDay:(NSString *)myWeekDay NotificationID:(NSString *)notificationID withSoundName:(NSString *)mysound isWakeUp:(BOOL)IsWakeUpNotify isSleep:(BOOL)IsSleepNotify InterVal:(int)minutesBefore{
    //loop through all scheduled notifications and cancel the one we're looking for
    if(IsWakeUpNotify)
    {
        NSString *wakeupTimeForWeekDate=[NSString stringWithFormat:@"WakeUpTimeInstiation%@",myWeekDay];
        [[NSUserDefaults standardUserDefaults] setObject:FireUpDate forKey:wakeupTimeForWeekDate];
        
        NSDateFormatter* df = [[NSDateFormatter alloc] init];
        NSDate *wakeupDateWithExactTime = [df dateFromString:wakeupTimeForWeekDate];
        //
        [self scheduleNotificationForDate:wakeupDateWithExactTime AlertBody:@"WakeUp Time" ActionButtonTitle:@"Ok" NotificationID:@"WakupNotificationID" CustomeSoundName:mysound  repeat:0 InterVal:minutesBefore ];
        NSLog(@"Wake Up Notification Id for current day is %@",wakeupTimeForWeekDate);

        //[[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"WakeUpTimeInstiationFlag"];
        
    }
    if(IsSleepNotify)
    {
        NSString *sleepDateForWeekDate=[NSString stringWithFormat:@"SleepTimeInstiation%@",myWeekDay];
        [[NSUserDefaults standardUserDefaults] setObject:FireUpDate forKey:sleepDateForWeekDate];
        NSDateFormatter* df = [[NSDateFormatter alloc] init];
        NSDate *sleepDateWithExactTime = [df dateFromString:sleepDateForWeekDate];
        //
        [self scheduleNotificationForDate:sleepDateWithExactTime AlertBody:@"sleep Time" ActionButtonTitle:@"Ok" NotificationID:@"SleepNotificationID" CustomeSoundName:mysound repeat:0 InterVal:minutesBefore];
        NSLog(@"Wake Up Notification Id for current day is %@",sleepDateForWeekDate);

    }
    
    
}

-(void)SnoozeThreeInFifteen:(NSString *)SnoozeSound inDate:(NSDate *)myDate WeekDy:(NSString *)myweekDay
{
    
    //SetUp Date interval 3 in Fifiteen minute
    //time1
    //time2
    //time3
    // interval in 5 minutes

    
    [self SetNotificationForDate:myDate WeekDay:myweekDay NotificationID:@"WakupNotificationID" withSoundName:SnoozeSound isWakeUp:YES isSleep:NO InterVal:5];

    [self SetNotificationForDate:myDate WeekDay:myweekDay NotificationID:@"WakupNotificationID" withSoundName:SnoozeSound isWakeUp:YES isSleep:NO InterVal:10];
    
    [self SetNotificationForDate:myDate WeekDay:myweekDay NotificationID:@"WakupNotificationID" withSoundName:SnoozeSound isWakeUp:YES isSleep:NO InterVal:15];
    


}
-(void)SnoozeThreeInThirty:(NSString *)SnoozeSound inDate:(NSDate *)myDate WeekDy:(NSString *)myweekDay
{
    //SetUp Date interval 3 in Fifiteen minute
    //time1
    //time2
    //time3
    // interval in 10 minutes
    
    
    [self SetNotificationForDate:myDate WeekDay:myweekDay NotificationID:@"WakupNotificationID" withSoundName:SnoozeSound isWakeUp:YES isSleep:NO InterVal:10];
    
    [self SetNotificationForDate:myDate WeekDay:myweekDay NotificationID:@"WakupNotificationID" withSoundName:SnoozeSound isWakeUp:YES isSleep:NO InterVal:20];
    
    [self SetNotificationForDate:myDate WeekDay:myweekDay NotificationID:@"WakupNotificationID" withSoundName:SnoozeSound isWakeUp:YES isSleep:NO InterVal:30];
    

    
}

- (IBAction)SwSnoozeSmooth:(id)sender {
    

    if (_swSnoozeSmoth.isOn==YES) {
       // Smooth Active
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isSmoothActive"];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isSnoozeActive"];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isSnoozeFifteen"];
        
        //
        
       // [_swSnoozeSmoth setOn:NO animated:YES];

    }
    else
    {
        // Snooze is Active
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isSmoothActive"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isSnoozeActive"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isSnoozeFifteen"];


        
    }

    // the SetDate method all ow the system to regnize if the mood is snooze or smooth for
    //Sing day indvisually and secudule diffrent sound system to : for instance , when its smooth the sound
    // will play ourt beatiful sound that made for this purpose
    //if the moode is snooze it will play what ever in the wakeup Tone File Name and will recognize the
    // if its its for 15 minute or 30 minute, the system here Set the 15 minutes as a defulte .
    // but still have the ability to to change it to 30 minute but it require you to set it up from within the nested allarm controller .
    [self SetDates:YES SwipUp:NO];
}
//========================================================================
#pragma mark - Date System
//============================================================================

-(NSString *)GetCurrentWeekDay:(int)Days
{
    NSDate *currentDate = [NSDate date];
    int DaysFromToday=Days;
    // or 60 :-)
    // set up date components
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    // Set Compnents
    NSDateComponents *Pluscomponent = [[NSDateComponents alloc] init];
    [Pluscomponent setDay:DaysFromToday];
    
    
    
    // create a calendar
    NSDate *dtTodayPlusDate = [gregorian dateByAddingComponents:Pluscomponent toDate:currentDate options:0];
    
    NSDateFormatter *FullDateFormat = [[NSDateFormatter alloc] init];
    [FullDateFormat setDateFormat:@"EEEE"];
    WeekDay= [FullDateFormat stringFromDate:dtTodayPlusDate];
    
    return WeekDay;
    
}
-(NSDate *)GetCurrentDate:(int)Days
{
    NSDate *currentDate = [NSDate date];
    int DaysFromToday=Days;
    // or 60 :-)
    // set up date components
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    // Set Compnents
    NSDateComponents *Pluscomponent = [[NSDateComponents alloc] init];
    [Pluscomponent setDay:DaysFromToday];
    
    
    /// Set Up the Time Zone
    
    
    NSDateFormatter *df = [NSDateFormatter new];
    [df setDateFormat:@"dd/MM/yyyy HH:mm"];
    
    NSString *stringFromDate = [df stringFromDate:currentDate];
    //Create the date assuming the given string is in GMT
    df.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    NSDate *date = [df dateFromString:stringFromDate];
    
    
    
    //Create a date string in the local timezone
    df.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:[NSTimeZone localTimeZone].secondsFromGMT];
    
    
    // My local timezone is: Europe/London (GMT+01:00) offset 3600 (Daylight)
    // prints out: date = 08/12/2013 22:01
    
    // create a calendar
    NSDate *dtTodayPlusDate = [gregorian dateByAddingComponents:Pluscomponent toDate:date options:0];
    
    NSLog(@"Tomorow------------------------------------------------------: %@", dtTodayPlusDate);
    
    return dtTodayPlusDate;
    
}



-(void)SetDates:(BOOL)HasNotification SwipUp:(BOOL)isSwipUp
{
    NSDate *TodayDate=[NSDate date];
    
    NSDateFormatter *FullDateFormat = [[NSDateFormatter alloc] init];
    [FullDateFormat setDateFormat:@"EEEE"];
    NSString *TodayDayName= [FullDateFormat stringFromDate:TodayDate];
    NSLog(@"Week Day From Formater %@",TodayDayName);
    
    
    
    NSData *WeekDaysData = [[NSUserDefaults standardUserDefaults] objectForKey:@"WeekDayPublicLable"];
    NSString *WeekDays = [NSKeyedUnarchiver unarchiveObjectWithData:WeekDaysData];
    NSString *WeekDayName;
    if(isSwipUp)
    {
        int myWeekDays=[WeekDays intValue];
        myWeekDays=myWeekDays+1;
        WeekDays=[NSString stringWithFormat:@"%@",WeekDays];
    }
    
    if([WeekDays isEqualToString:@"0"])
    {
        //
        self.Navitem.title=@"Monday";
        
        WeekDayName=[NSString stringWithFormat:@"Monday"];
    }
    else if([WeekDays isEqualToString:@"1"])
    {
        //
        self.Navitem.title=@"Tuesday";
        
        WeekDayName=[NSString stringWithFormat:@"Tuesday"];
        
    }
    else if([WeekDays isEqualToString:@"2"])
    {
        //
        self.Navitem.title=@"Wednesday";
        
        WeekDayName=[NSString stringWithFormat:@"Wednesday"];
        
    }
    else if([WeekDays isEqualToString:@"3"])
    {
        //
        self.Navitem.title=@"Thursday";
        
        WeekDayName=[NSString stringWithFormat:@"Thursday"];
        
    }
    
    else if([WeekDays isEqualToString:@"4"])
    {
        //
        self.Navitem.title=@"Friday";
        
        WeekDayName=[NSString stringWithFormat:@"Friday"];
        
    }
    else if([WeekDays isEqualToString:@"5"])
    {
        //
        self.Navitem.title=@"Saturday";
        
        WeekDayName=[NSString stringWithFormat:@"Saturday"];
        
    }
    else if([WeekDays isEqualToString:@"6"])
    {
        //
        self.Navitem.title=@"Sunday";
        
        WeekDayName=[NSString stringWithFormat:@"Sunday"];
        
    }
    else
    {
        //
        self.Navitem.title=@"Sunday";
        
        WeekDayName=[NSString stringWithFormat:@"Sunday"];
        
        
    }
    
    
    // Compare the current day
    if ([WeekDayName isEqualToString:[self GetCurrentWeekDay:0]]) {
        // self.view.backgroundColor=[UIColor greenColor];
        lblAlarmDate.text=[NSString stringWithFormat:@"%@",[self GetCurrentDate:0]];

        if(HasNotification)
        {
            
            [self FireUpWakeUpMode:[self GetCurrentDate:0] WeekDay:WeekDay];
            
        }
        
        
        
        
    }
    else if ([WeekDayName isEqualToString:[self GetCurrentWeekDay:1]]) {
        
        // self.view.backgroundColor=[UIColor whiteColor];
        
        lblAlarmDate.text=[NSString stringWithFormat: @"%@",[self GetCurrentDate:1]];
        if(HasNotification==YES)
        {
            [self FireUpWakeUpMode:[self GetCurrentDate:1] WeekDay:WeekDay];

            
        }
        
        
    }
    else if ([WeekDayName isEqualToString:[self GetCurrentWeekDay:2]]) {
        //self.view.backgroundColor=[UIColor purpleColor];
        lblAlarmDate.text=[NSString stringWithFormat:@"%@",[self GetCurrentDate:2]];
        if(HasNotification==YES)
        {
            [self FireUpWakeUpMode:[self GetCurrentDate:2] WeekDay:WeekDay];

            
        }
        // If God For Us , Who Can Be Against us. jesus christ ++++++++++++
        
    }
    else if ([WeekDayName isEqualToString:[self GetCurrentWeekDay:3]]) {
        //self.view.backgroundColor=[UIColor blueColor];
        lblAlarmDate.text=[NSString stringWithFormat:@"%@",[self GetCurrentDate:3]];
        if(HasNotification==YES)
        {
            [self FireUpWakeUpMode:[self GetCurrentDate:3] WeekDay:WeekDay];
            
            
        }
        
        
    }
    else if ([WeekDayName isEqualToString:[self GetCurrentWeekDay:4]]) {
        // self.view.backgroundColor=[UIColor yellowColor];
        lblAlarmDate.text=[NSString stringWithFormat:@"%@",[self GetCurrentDate:4]];
        if(HasNotification==YES)
        {
            [self FireUpWakeUpMode:[self GetCurrentDate:4] WeekDay:WeekDay];

            
            
            
        }
        
        
    }
    else if ([WeekDayName isEqualToString:[self GetCurrentWeekDay:5]]) {
        // self.view.backgroundColor=[UIColor grayColor];
        lblAlarmDate.text=[NSString stringWithFormat:@"%@",[self GetCurrentDate:5]];
        
        if(HasNotification==YES)
        {
            [self FireUpWakeUpMode:[self GetCurrentDate:5] WeekDay:WeekDay];

            
        }
        
        
    }
    else if ([WeekDayName isEqualToString:[self GetCurrentWeekDay:6]]) {
        // self.view.backgroundColor=[UIColor purpleColor];
        
        lblAlarmDate.text=[NSString stringWithFormat:@"%@",[self GetCurrentDate:6]];
        
        if(HasNotification==YES)
        {
            
            
            [self FireUpWakeUpMode:[self GetCurrentDate:6] WeekDay:WeekDay];

            
        }
    
    }
    
}
// it's DOne unto you as you believe

-(NSDate *)GetNotificationDateFromID:(NSString *)notificationID{
    
    NSDate *CurrentDate;
    for (UILocalNotification *someNotification in [[UIApplication sharedApplication] scheduledLocalNotifications]) {
        NSLog(@"All Notification ID %@",[someNotification.userInfo objectForKey:@"notificationID"]);

        if([[someNotification.userInfo objectForKey:@"notificationID"] isEqualToString:notificationID]) {
            
            CurrentDate =someNotification.fireDate;
            NSLog(@"notificationID from GetNotificationDateFromID %@",[someNotification.userInfo objectForKey:@"notificationID"]);

        }
    }
    return CurrentDate;
    
}

- (IBAction)Done:(id)sender {
/*
UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController  *vc =[storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    
    [self presentViewController:vc animated:YES completion:nil];
*/
}

- (IBAction)AllWakeUpAndSleepAlarmAlarms:(id)sender
{

    [[NSUserDefaults standardUserDefaults] setObject:@"FirstGroup" forKey:@"WhatPage"];
    //[[NSUserDefaults standardUserDefaults] setObject:@"SLeep" forKey:@"ReminderFor"];
    
    // Navigate to UIViewController programaticly inside storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController  *vc =[storyboard instantiateViewControllerWithIdentifier:@"RemindersTableViewController"];
    
    [self presentViewController:vc animated:YES completion:nil];
    
    
}


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ( [segue isKindOfClass: [SWRevealViewControllerSegue class]] ) {
        SWRevealViewControllerSegue *swSegue = (SWRevealViewControllerSegue*) segue;
        
        swSegue.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc) {
            
            UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
            [navController setViewControllers: @[dvc] animated: NO ];
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
        };
    }
}


@end
