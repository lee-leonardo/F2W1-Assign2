//
//  UIColor+ColorChange.m
//  F2W1-MVC
//
//  Created by Leonardo Lee on 5/14/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

#import "UIColor+ColorChange.h"

@implementation UIColor (ColorChange)
+(UIColor *)randomColor
{
    CGFloat red = ( arc4random() % 256 / 256.0 );
    CGFloat green = ( arc4random() % 256 / 256.0 );
    CGFloat blue = ( arc4random() % 256 / 256.0 );
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

//Decided it would be more pertinent to convert the colorWithRed to a hsla to saturate and brighten rather than
-(UIColor *)lightenColor:(UIColor *)color by:(CGFloat *)percentAmount
{
//	UIColor temp = [color colorWit
				
//				   CGColorCreateCopy(color);
	
	return color;
}

@end
