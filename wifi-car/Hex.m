//
//  Hex.m
//  wifi-car
//
//  Created by Z-Radi on 15-3-22.
//  Copyright (c) 2015年 radi. All rights reserved.
//

#import "Hex.h"

@implementation NSData(hex)
-(NSData*)dataWithHexstring:(NSString *)hexstring{
    
    NSMutableData* data = [NSMutableData data];
    int idx;
    for(idx = 0; idx + 2 <= hexstring.length; idx += 2)
    {
        NSRange range = NSMakeRange(idx, 2);
        NSString* hexStr = [hexstring substringWithRange:range];
        NSScanner* scanner = [NSScanner scannerWithString:hexStr];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        [data appendBytes:&intValue length:1];
    }
    return data;
}

@end
