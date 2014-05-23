//
//  EditPostViewController.m
//  F2W1-MVC
//
//  Created by Leonardo Lee on 5/14/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

#import "EditPostViewController.h"

@interface EditPostViewController ()
@property (weak, nonatomic) IBOutlet UITextField *changeTitle;
@property (weak, nonatomic) IBOutlet UITextView *changeContent;

@end

@implementation EditPostViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	[_changeTitle setPlaceholder:_postToEdit.title];
	[_changeContent setText:_postToEdit.content];
	
    // Do any additional setup after loading the view.
}

- (IBAction)finishEdit:(id)sender {
	
//	[self.delegate finishPostEditAtIndex:indexPath.row
//								   title:_changeTitle
//								 content:_changeContent];
	
	[self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)cancelEditPost:(id)sender {
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
