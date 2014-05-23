//
//  ViewController.m
//  F2W1-MVC
//
//  Created by Leonardo Lee on 5/12/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

#import "PostsTableViewController.h"
#import "Post.h"
#import "PostTableViewCell.h"
#import "CreatePostViewController.h"
#import "EditPostViewController.h"
#import "UIColor+ColorChange.h"

/*
 Things to do:
 1.Finish up the EditPostView
 2.Make sure that the cells are different colors, using the features of UIColor+ColorChange.h
 */
/*
 1. Move the Color to the Model, so that the color stays.
 2.
 */


static NSString *const cellID = @"Cell"; //This is to make calling the Cell useful.

@interface PostsTableViewController () <UITableViewDataSource, UITableViewDelegate, CreatePostViewControllerDelegate, EditPostViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *posts;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation PostsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	_posts = [NSMutableArray new];
	for (int i = 0; i < 10; i++)
	{
		//Generates a post with the attributes assigned, it took me a good few minutes to realize how to condense this.
		Post *post = [[Post alloc] initWithName:@"Person"
										  title:[NSString stringWithFormat:@"Cell #%i", i+1]
										content:@"Content"
									  timeStamp:[NSDate date]];
		[_posts addObject:post];
	}
	
}

#pragma mark - UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	//This creates a new TableViewCell. This cell gets its information by the method setPost, which is within PostTableViewCell.
	PostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
	cell.backgroundColor = [UIColor randomColor];
	[cell.backgroundColor lightenColor:cell.backgroundColor];
	[cell setPost:[self.posts objectAtIndex:indexPath.row]];
	
	return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	//Initializes the TableView with enough rows for all the posts.
	return [self.posts count];
}

#pragma mark - prepareForSegue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"createPostView"])
	{
		UINavigationController *navigationController = segue.destinationViewController;
		CreatePostViewController *createPostVC = navigationController.viewControllers.firstObject;
		createPostVC.delegate = self;
	} else if ([segue.identifier isEqualToString:@"editPostView"])
	{
		UINavigationController *navigationController = segue.destinationViewController;
		EditPostViewController *editPostVC = navigationController.viewControllers.firstObject;
		editPostVC.delegate = self;
		editPostVC.postEditing = [self.tableView indexPathForSelectedRow];
		
	}
}

#pragma mark - CreatePostViewControllerDelegation
-(void)createPostWithUser:(NSString *)name title:(NSString *)title content:(NSString *)content date:(NSDate *)date
{
//	This creates a newPost, this post then in turn is added to the MutableArray, afterwhich the tableView is reloaded.
	Post *newPost = [[Post alloc] initWithName:name
									  title:title
									content:content
								  timeStamp:[NSDate date]];

	
	[_posts addObject:newPost];
	
	[self.tableView reloadData];
}

#pragma mark - EditPostViewControllerDelegation
-(void)finishEditAtIndex:(NSUInteger *)indexPath title:(NSString *)title content:(NSString *)content
{
	Post *editedPost = [_posts objectAtIndex:*indexPath];
	editedPost.title = title;
	editedPost.content = content;
	
//	This is the parallel to the createPost method. This
	[_posts replaceObjectAtIndex:*indexPath withObject:editedPost];
	[self.tableView reloadData];
}

@end