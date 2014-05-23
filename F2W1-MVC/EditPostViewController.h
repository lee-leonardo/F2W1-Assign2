//
//  EditPostViewController.h
//  F2W1-MVC
//
//  Created by Leonardo Lee on 5/14/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

@protocol EditPostViewControllerDelegate <NSObject>
-(void)finishEditAtIndex:(NSUInteger *)indexPath title:(NSString *)title content:(NSString *)content;

@end

@interface EditPostViewController : UIViewController
@property (nonatomic, unsafe_unretained) id<EditPostViewControllerDelegate> delegate;
@property (nonatomic, strong) Post *postToEdit;
@property (strong, nonatomic) NSIndexPath *postEditing;

@end
