//
//  ViewController.h
//  cam
//
//  Created by optimusmac4 on 7/18/15.
//  Copyright (c) 2015 optimusmac4. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)selectPhoto:(UIButton *)sender;

- (IBAction)takePhoto:(UIButton *)sender;
@end
