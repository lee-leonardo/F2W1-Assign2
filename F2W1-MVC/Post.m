//
//  Post.m
//  F2W1-MVC
//
//  Created by Leonardo Lee on 5/12/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

#import "Post.h"

//Michael helped me with this design pattern.
@implementation Post
-(id) init
{
	return [self initWithName:nil title:nil content:nil timeStamp:nil];
}

-(instancetype) initWithName:(NSString *)userName
					   title:(NSString *)title
					 content:(NSString *)content
				   timeStamp:(NSDate *)timeStamp
{
	self = [super init];
	if (self) {
		_userName = userName;
		_title = title;
		_content = content;
		_timeStamp = timeStamp;
	}
	return self;
}

@end
