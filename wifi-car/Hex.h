//
//  Hex.h
//  wifi-car
//
//  Created by Z-Radi on 15-3-22.
//  Copyright (c) 2015年 radi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (hex)

-(NSData*)dataWithHexstring:(NSString *)hexstring;

@end
