//
//  GravityController.m
//  wifi-car
//
//  Created by Z-Radi on 15-3-16.
//  Copyright (c) 2015年 radi. All rights reserved.
//

#import "GravityController.h"
#import "Hex.h"

@interface GravityController ()
@property (strong, nonatomic) CMMotionManager *motionManager;
@end

@implementation GravityController

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
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.deviceMotionUpdateInterval = 1.0f/2.0f;
    if (!_asyncSocket)
    {
        _asyncSocket=nil;
    }
    
    _asyncSocket = [[GCDAsyncSocket alloc]initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    _asyncSocket.delegate = self;
    NSString *ports = [[NSUserDefaults standardUserDefaults] objectForKey:@"port"];
    int port = [ports intValue];
    
    UInt16 portx = port;
    NSError *error = nil;
    NSString *host = [[NSUserDefaults standardUserDefaults] objectForKey:@"host"];
    [_asyncSocket connectToHost:host onPort:portx withTimeout:-1 error:&error];
    if (error!=nil) {
        NSLog(@"连接失败：%@",error);
    }else{
        NSLog(@"连接成功");
    }

    
    NSString *urlString=@"http://192.168.1.1/webcam.png";
    [_camera loadRequest:[[NSURLRequest alloc]initWithURL:[[NSURL alloc]initWithString:urlString]]];


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



- (void)socket:(GCDAsyncSocket *)sock willDisconnectWithError:(NSError *)err
{
    NSLog(@"willDisconnectWithError");
    //[self logInfo:FORMAT(@"Client Disconnected: %@:%hu", [sock connectedHost], [sock connectedPort])];
    if (err) {
        NSLog(@"错误报告：%@",err);
    }else{
        NSLog(@"连接工作正常");
    }
    _asyncSocket = nil;
}


- (void)acceleration
{
    [self.motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMDeviceMotion *motion, NSError *error)
  {      self.xaxis.text = [NSString stringWithFormat:@"%.2f",motion.gravity.x];
         self.yaxis.text = [NSString stringWithFormat:@"%.2f",motion.gravity.y];
         self.zaxis.text = [NSString stringWithFormat:@"%.2f",motion.gravity.z];
       if(motion.gravity.x>0.2)
       {
           NSString *rightcommands = [[NSUserDefaults standardUserDefaults] objectForKey:@"rightcommand"];
           NSData *rightcommand = [[rightcommands dataUsingEncoding:NSUTF8StringEncoding]dataWithHexstring:rightcommands];
           
           
           [_asyncSocket writeData:rightcommand withTimeout:3 tag:0];

       }
       
       else if(motion.gravity.x<-0.2)
        {
            NSString *leftcommands = [[NSUserDefaults standardUserDefaults] objectForKey:@"leftcommand"];
            NSData *leftcommand = [[leftcommands dataUsingEncoding:NSUTF8StringEncoding]dataWithHexstring:leftcommands];
            
            
            [_asyncSocket writeData:leftcommand withTimeout:3 tag:0];
        }
       
       else if(motion.gravity.y>0.2)
        {
            NSString *forwardcommands = [[NSUserDefaults standardUserDefaults] objectForKey:@"forwardcommand"];
            
            NSData *forwardcommand = [[forwardcommands dataUsingEncoding:NSUTF8StringEncoding]dataWithHexstring:forwardcommands];
            
            [_asyncSocket writeData:forwardcommand withTimeout:3 tag:0];
        }
        
       else if(motion.gravity.y<-0.2)
        {
            NSString *backwardcommands = [[NSUserDefaults standardUserDefaults] objectForKey:@"backwardcommand"];
            
            NSData *backwardcommand = [[backwardcommands dataUsingEncoding:NSUTF8StringEncoding]dataWithHexstring:backwardcommands];
            
            
            [_asyncSocket writeData:backwardcommand withTimeout:3 tag:0];

        }
       else
       { NSString *stopcommand = [[NSUserDefaults standardUserDefaults] objectForKey:@"stopcommand"];
           NSData *stopcommands = [[stopcommand dataUsingEncoding:NSUTF8StringEncoding]dataWithHexstring:stopcommand];
           
           [_asyncSocket writeData:stopcommands withTimeout:3 tag:0];
       }


    }];
}


- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    NSLog(@"didReadData");
    NSData *strData = [data subdataWithRange:NSMakeRange(0, [data length])];
    NSString *msg = [[NSString alloc] initWithData:strData encoding:NSUTF8StringEncoding];
    if(msg)
    {
        NSLog(@"%@",msg);
    }
    else
    {
        NSLog(@"错误");
    }
    [sock readDataWithTimeout:-1 tag:0]; //一直监听网络
    
}

- (void)socket:(GCDAsyncSocket *)sock didReadPartialDataOfLength:(NSUInteger)partialLength tag:(long)tag{
    
    
}


- (IBAction)startmotion:(id)sender {
    UISwitch *motionSwitch = (UISwitch *)sender;
    if(motionSwitch.on)
    {
        [self acceleration];
    }
    else
    {
        [self.motionManager stopDeviceMotionUpdates];
    }
}

- (IBAction)opencamera:(id)sender {
    UISwitch *camera = (UISwitch*)sender;
    BOOL isButtonOn = [camera isOn];
    if (isButtonOn) {
        NSString *urlString=@"http://192.168.1.1/camera.html";
        [_camera loadRequest:[[NSURLRequest alloc]initWithURL:[[NSURL alloc]initWithString:urlString]]];
    }else {
        NSString *urlString=@"http://192.168.1.1/webcam.png";
        [_camera loadRequest:[[NSURLRequest alloc]initWithURL:[[NSURL alloc]initWithString:urlString]]];
    }
}
@end
