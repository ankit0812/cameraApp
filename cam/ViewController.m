//
//  ViewController.m
//  cam
//
//  Created by optimusmac4 on 7/18/15.
//  Copyright (c) 2015 optimusmac4. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UIPopoverController *popOver;

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    //Condition using isSourceTypeAvailable to check whether device is available or Not
    
     self.popOver.delegate=self;
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Device has no camera" delegate:nil                                                                                                                                                                                                 cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [myAlertView show];
        
    }
    
}


- (void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:animated];
    
}



//Function for taking photos using UIImagePickerController

- (IBAction)takePhoto:(UIButton *)sender
{
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

// Function for selecting photos from gallery using UIImagePickerControllerSourceTypePhotoLibrary

- (IBAction)selectPhoto:(UIButton *)sender
{
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        // The device is an iPad running iOS 3.2 or later.
        CGRect r=sender.frame;
        self.popOver = [[UIPopoverController alloc] initWithContentViewController:picker];
        //  CGRectMake(10, 30, 200, 350)
        [self.popOver presentPopoverFromRect:r
                                      inView:self.view
                    permittedArrowDirections:UIPopoverArrowDirectionDown
                                    animated:YES];
    }
    
    [self presentViewController:picker animated:YES completion:NULL];
    
    
    
}


//Use of Delegates of Image Picker Controller

#pragma mark - Image Picker Controller delegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

@end