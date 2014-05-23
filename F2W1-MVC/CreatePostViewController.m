//
//  CreateCellControllerViewController.m
//  F2W1-MVC
//
//  Created by Leonardo Lee on 5/12/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

#import "CreatePostViewController.h"

@class Post;

@interface CreatePostViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *postTitle;
@property (weak, nonatomic) IBOutlet UITextView *content;

@end

@implementation CreatePostViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)finishNewPost:(id)sender {
	NSString *name = [NSString stringWithFormat:@"%@", _name];
	NSString *title = [NSString stringWithFormat:@"%@", _postTitle];
	NSString *content = [NSString stringWithFormat:@"%@", _content];
	
	[self.delegate createPostWithUser:name title:title content:content date:[NSDate date]];
	[self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)cancelNewPost:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
