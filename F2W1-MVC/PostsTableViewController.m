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

/*
 Things to do:
 1.Finish up the EditPostView
 2.Make sure that the cells are different colors, using the features of UIColor+ColorChange.h
 */
/*
 1. Move the Color to the Model, so that the color stays.
 2.
 */

@interface PostsTableViewController () <UITableViewDataSource, UITableViewDelegate, CreatePostViewControllerDelegate, EditPostViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *posts;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

static NSString *const cellID = @"Cell"; //This is to make calling the Cell useful.

@implementation PostsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
//	This just populates the array with things to play with.
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
	
	Post *cellObject = [self.posts objectAtIndex:indexPath.row];

	[cell setPost:cellObject];
	
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
		NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
		
		EditPostViewController *editPostVC = navigationController.viewControllers.firstObject;
		editPostVC.delegate = self;
		editPostVC.postEditing = indexPath;
		editPostVC.postToEdit = [self.posts objectAtIndex:indexPath.row];
	}
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
//	cell.textLabel.text = [[self.posts objectAtIndex:indexPath.row] title];
//	cell.detailTextLabel.text = [[self.posts objectAtIndex:indexPath.row] content];
	cell.backgroundColor = [[self.posts objectAtIndex:indexPath.row] color];
	
}

#pragma mark - CreatePostViewControllerDelegation
-(void)createPostWithUser:(NSString *)name title:(NSString *)title content:(NSString *)content date:(NSDate *)date
{
//	This creates a newPost, this post then in turn is added to the MutableArray, afterwhich the tableView is reloaded.
	Post *newPost = [[Post alloc] initWithName:name
									  title:title
									content:content
								  timeStamp:[NSDate date]];
	
//	Testing NSLogs.
//	NSLog(@"Name: %@", newPost.userName);
//	NSLog(@"Title: %@", newPost.title);
//	NSLog(@"Content: %@", newPost.content);
	
	
	[_posts addObject:newPost];
	[self.tableView reloadData];
}

#pragma mark - EditPostViewControllerDelegation
-(void)finishEditAtIndex:(NSIndexPath *)indexPath title:(NSString *)title content:(NSString *)content
{
	Post *editedPost = [self.posts objectAtIndex:indexPath.row];
	editedPost.title = title;
	editedPost.content = content;
	
//	This is the parallel to the createPost method. This
	[_posts replaceObjectAtIndex:indexPath.row withObject:editedPost];
	[self.tableView reloadData];
}

@end