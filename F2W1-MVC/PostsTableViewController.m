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

static NSString *const cellID = @"Cell"; //This is to make calling the Cell useful.

@interface PostsTableViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *posts;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation PostsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	NSMutableArray *assignPosts = [NSMutableArray new]; //This is an array that we create to set the posts into.
	
	for (int i = 0; i < 10; i++)
	{
		//Generates a post with the attributes assigned, it took me a good few minutes to realize how to condense this.
		Post *post = [[Post alloc] initWithName:@"Person"
										  title:[NSString stringWithFormat:@"Cell #%i", i+1]
										content:@"Content"
									  timeStamp:[NSDate date]];
		[assignPosts addObject:post];
	}
	self.posts = assignPosts; //This assigns the NSArray the contents of the mutable array.
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	//This creates a new TableViewCell. This cell gets its information by the method setPost, which is within PostTableViewCell.
	PostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
	[cell setPost:[self.posts objectAtIndex:indexPath.row]];
	
	return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	//INitializes the TableView with enough rows for all the posts.
	return [self.posts count];
}

@end
