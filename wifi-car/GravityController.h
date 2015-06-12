//
//  GravityController.h
//  wifi-car
//
//  Created by Z-Radi on 15-3-16.
//  Copyright (c) 2015年 radi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import "GCDAsyncSocket.h"
#import "GCDAsyncUdpSocket.h"






@interface GravityController : UIViewController<GCDAsyncSocketDelegate>
{
    GCDAsyncSocket     *_asyncSocket;
    
}

@property (strong, nonatomic) IBOutlet UITextField *xaxis;
@property (strong, nonatomic) IBOutlet UIWebView *camera;
@property (strong, nonatomic) IBOutlet UITextField *yaxis;
@property (strong, nonatomic) IBOutlet UITextField *zaxis;
- (IBAction)startmotion:(id)sender;

- (IBAction)opencamera:(id)sender;


@end
