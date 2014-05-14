//
//  PostViewTableCell.m
//  F2W1-MVC
//
//  Created by Leonardo Lee on 5/12/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

#import "PostTableViewCell.h"
#import "Post.h"

@implementation PostTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


//Really the only thing used in this class atm.
- (void)setPost:(Post *)post
{
	self.textLabel.text = post.title;
	self.detailTextLabel.text = post.content;
	
}

@end
