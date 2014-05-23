//
//  CreateCellControllerViewController.h
//  F2W1-MVC
//
//  Created by Leonardo Lee on 5/12/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

@protocol CreatePostViewControllerDelegate <NSObject>

-(void)createPostWithUser:(NSString *)name title:(NSString *)title content:(NSString *)content date:(NSDate *)date;

@end

@interface CreatePostViewController : UIViewController
@property (nonatomic, unsafe_unretained) id<CreatePostViewControllerDelegate> delegate;


@end
