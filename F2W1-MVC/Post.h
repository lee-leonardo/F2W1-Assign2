//
//  Post.h
//  F2W1-MVC
//
//  Created by Leonardo Lee on 5/12/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, strong) NSDate *timeStamp;
@property (nonatomic, strong) UIColor *color;

-(instancetype) initWithName:(NSString *)userName title:(NSString *)title content:(NSString *)content timeStamp:(NSDate *)timeStamp;
@end
