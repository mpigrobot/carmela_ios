//
//  SettingController.m
//  wifi-car
//
//  Created by Z-Radi on 15-3-16.
//  Copyright (c) 2015年 radi. All rights reserved.
//

#import "SettingController.h"

@interface SettingController ()

@end

@implementation SettingController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     NSString *forwardcommands = [[NSUserDefaults standardUserDefaults] objectForKey:@"forwardcommand"];
    if(forwardcommands == nil)
    {
        [self saveNSUserDefaults];
    }
    [self readNSUserDefaults];
        
   

    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)saveNSUserDefaults
{
    NSString *forwardcommand = _forwardcommand.text;
    NSString *backwardcommand = _backwardcommand.text;

    NSString *leftcommand = _leftcommand.text;
    NSString *rightcommand = _rightcommand.text;
    NSString *stopcommand = _stopcommand.text;
    NSString *host = _host.text;
    NSString *port = _port.text;
    //将上述数据全部存储到NSUserDefaults中
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
  
    
    [userDefaults setObject:forwardcommand forKey:@"forwardcommand"];
    [userDefaults setObject:backwardcommand forKey:@"backwardcommand"];
    [userDefaults setObject:leftcommand forKey:@"leftcommand"];
    [userDefaults setObject:rightcommand forKey:@"rightcommand"];
    [userDefaults setObject:stopcommand forKey:@"stopcommand"];
    [userDefaults setObject:host forKey:@"host"];
    [userDefaults setObject:port forKey:@"port"];
}
-(void)readNSUserDefaults
{
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    
    //读取数据到各个label中
    NSString *forwardcommand = [userDefaultes stringForKey:@"forwardcommand"];
    _forwardcommand.text = forwardcommand;
    NSString *backwardcommand = [userDefaultes stringForKey:@"backwardcommand"];
    _backwardcommand.text = backwardcommand;
    NSString *leftcommand = [userDefaultes stringForKey:@"leftcommand"];
    _leftcommand.text = leftcommand;
    NSString *rightcommand = [userDefaultes stringForKey:@"rightcommand"];
    _rightcommand.text = rightcommand;
    NSString *stopcommand = [userDefaultes stringForKey:@"stopcommand"];
    _stopcommand.text = stopcommand;
    NSString *host = [userDefaultes stringForKey:@"host"];
    _host.text = host;
    NSString *port = [userDefaultes stringForKey:@"port"];
    _port.text = port;
    
}




- (IBAction)save:(id)sender {
    [self saveNSUserDefaults];
    
      
    
}




- (IBAction)restore:(id)sender {
    _forwardcommand.text = @"7E310101FF00320D";
    _backwardcommand.text = @"7E310102FF00330D";
    _leftcommand.text = @"7E310104FF00350D";
    _rightcommand.text = @"7E310103FF00340D";
    _stopcommand.text = @"7E310100FF00310D";
    _host.text = @"192.168.1.1";
    _port.text= @"2001";
    [self saveNSUserDefaults];
}
@end
