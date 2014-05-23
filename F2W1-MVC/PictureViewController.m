//
//  PictureViewController.m
//  F2W1-MVC
//
//  Created by Leonardo Lee on 5/20/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

#import "PictureViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "UIImage+ImageEffects.h"

@interface PictureViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate>

@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) UIImagePickerController *imagePicker;

@end

@implementation PictureViewController

#pragma mark - Image Picker
-(IBAction)showImagePicker:(id)sender
{
	_imagePicker = [[UIImagePickerController alloc] init];
	_imagePicker.delegate = self;
	_imagePicker.allowsEditing = YES;
	
	if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
	{
		UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Choose Source Type"
																delegate:self
														cancelButtonTitle:@"Cancel"
													destructiveButtonTitle:nil
															otherButtonTitles:@"Photo Library", @"Camera", nil];
		[actionSheet showFromBarButtonItem:sender animated:YES];
	} else
	{
		_imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
		[self presentViewController:_imagePicker animated:YES completion:nil];
	}
}
-(void)saveImageToLibrary:(UIImage *)editedImage
{
	ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
	[assetsLibrary writeImageToSavedPhotosAlbum:editedImage.CGImage
									orientation:ALAssetOrientationUp
								completionBlock:^(NSURL *assetURL, NSError *error) {
									NSLog(@"Asset URL: %@", assetURL);
								}];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	[picker dismissViewControllerAnimated:YES
							   completion:^{
								   UIImage *editedImage = [info objectForKey:UIImagePickerControllerEditedImage];
								   editedImage = [editedImage applyTintEffectWithColor:[UIColor lightGrayColor]]; //This is where the category comes in.
								   
								   _imageView.image = editedImage;
								   _imageView.contentMode = UIViewContentModeCenter;
								   _imageView.layer.cornerRadius = _imageView.frame.size.width / 2.0;
								   [_imageView setClipsToBounds:YES];
								   
								   [self saveImageToLibrary:editedImage];
							   }];
}
-(IBAction)showShareSheet:(id)sender
{
	if(_imageView.image)
	{
		UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:@[_imageView.image, @"Title"] applicationActivities:nil];
		[self presentViewController:activityVC animated:YES completion:nil];
	}
}
#pragma mark - Action Sheet
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	NSString *actionChosen = [actionSheet buttonTitleAtIndex:buttonIndex];
	
	if ([ actionChosen isEqualToString:@"Camera"])
	{
		_imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
	} else if ([ actionChosen isEqualToString:@"Photo Library"])
	{
		_imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
	}
	[self presentViewController:_imagePicker animated:YES completion:nil];
}

@end
