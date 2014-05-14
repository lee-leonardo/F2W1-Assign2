//
//  PostViewTableCell.h
//  F2W1-MVC
//
//  Created by Leonardo Lee on 5/12/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Post; //Tells the compiler that this class exists.

@interface PostTableViewCell : UITableViewCell
@property (nonatomic, strong) Post *postFormat;

- (void)setPost:(Post *)post;

@end
