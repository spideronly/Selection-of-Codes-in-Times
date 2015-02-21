//
//  NavigationViewController.m
//  TIMES
//
//  Created by Sami Shamsan on 2/11/15.
//  Copyright (c) 2015 com.Sami.Times. All rights reserved.
//

#import "NavigationViewController.h"
#import "SWRevealViewController.h"

@interface NavigationViewController ()
{
    NSArray *NavigationList;
    NSArray *NavigationImages;
    

}
@end

@implementation NavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    [self LoadTheNavigationItems];
   // [self GoToHome];
}

-(void)GoToHome
{
    
    UIImage* image3 = [UIImage imageNamed:@"home-2-32.png"];
    CGRect frameimg = CGRectMake(0, 0, image3.size.width, image3.size.height);
    UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
    [someButton setBackgroundImage:image3 forState:UIControlStateNormal];
    [someButton addTarget:self  action:@selector(GoHome:)
         forControlEvents:UIControlEventTouchUpInside];
    [someButton setShowsTouchWhenHighlighted:YES];
    
    UIBarButtonItem *HomeButton =[[UIBarButtonItem alloc] initWithCustomView:someButton];
    self.navigationItem.leftBarButtonItem=HomeButton;
    
    
}
- (void)GoHome:(UIBarButtonItem *)sender{
    
    // Navigate to UIViewController programaticly inside storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController  *vc =[storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    
    [self presentViewController:vc animated:YES completion:nil];
    
    
}
-(void)LoadTheNavigationItems
{//RemindFriend
    NavigationList=@[@"Time Interval",@"Parking Memory",@"World Clock",@"Time Converter",@"Weather",@"Setting"];
    NavigationImages=@[@"Time_interval.png",@"location-alt-512.png",@"Earth-1127235406.png",@"compare-32.png",@"lightningDay.png",@"settings-16-32.png"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [NavigationList count];
}

-(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    NSString *CellIdentfier=[NavigationList objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentfier forIndexPath:indexPath];
    // Configure the cell...
    UIImage *originalImage =[UIImage imageNamed:[NavigationImages objectAtIndex:indexPath.row]];
    
    // Resize the image
   
     CGSize cellViewSize = CGSizeMake(32.0, 32.0);
    UIImage *resizedImage=[self imageWithImage:originalImage scaledToSize:cellViewSize];


    [[cell imageView] setImage:resizedImage];

    return cell;
}



#pragma mark - Navigation

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
