//
//  SettingController.h
//  wifi-car
//
//  Created by Z-Radi on 15-3-16.
//  Copyright (c) 2015年 radi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeyController.h"

@interface SettingController : UIViewController


@property (strong, nonatomic) IBOutlet UITextField *forwardcommand;



- (IBAction)save:(id)sender;


@property (strong, nonatomic) IBOutlet UITextField *leftcommand;
@property (strong, nonatomic) IBOutlet UITextField *rightcommand;
@property (strong, nonatomic) IBOutlet UITextField *stopcommand;

@property (strong, nonatomic) IBOutlet UITextField *backwardcommand;

@property (strong, nonatomic) IBOutlet UITextField *host;
@property (strong, nonatomic) IBOutlet UITextField *port;


- (IBAction)restore:(id)sender;

@end
