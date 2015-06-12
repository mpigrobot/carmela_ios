//
//  KeyController.h
//  wifi-car
//
//  Created by Z-Radi on 15-3-17.
//  Copyright (c) 2015年 radi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCDAsyncSocket.h"
#import "GCDAsyncUdpSocket.h"
#import "CameraView.h"



@interface KeyController : UIViewController<GCDAsyncSocketDelegate>
{
    GCDAsyncSocket   * _asyncSocket;
   
}


- (IBAction)forward:(id)sender;
- (IBAction)backward:(id)sender;
- (IBAction)forwardstop:(id)sender;
- (IBAction)backwardstop:(id)sender;
- (IBAction)leftcommand:(id)sender;
- (IBAction)leftstop:(id)sender;
- (IBAction)rightcommand:(id)sender;
- (IBAction)rightstop:(id)sender;

- (IBAction)connect:(id)sender;

- (IBAction)opencamera:(id)sender;
@property (strong, nonatomic) IBOutlet UIWebView *camera;

@end
