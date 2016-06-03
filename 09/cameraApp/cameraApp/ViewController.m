//
//  ViewController.m
//  cameraApp
//
//  Created by Christopher Myers on 6/2/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import "ViewController.h"
#import "ImageViewController.h"


// add the delegates
@interface ViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

// Add the imagepicker controller
@property (strong, nonatomic) UIImagePickerController *pickerController;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) UIImage * currentImage;
@property (weak, nonatomic) IBOutlet UIButton *viewButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // alloc memory and set the delegate to self
    self.pickerController = [[UIImagePickerController alloc] init];
    self.pickerController.delegate = self;
    
    
}



- (IBAction)cameraTapped:(UIBarButtonItem *)sender {
    
    NSLog(@"Camera Tapped");
    // Set the picker controller to Camera for device or Photo Library for Simulator.
    self.pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    // when the camera button is tapped show the image picker
    [self presentViewController:self.pickerController animated:YES completion: nil];
    
}

- (IBAction)viewButtonPressed:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"imageSegue" sender:nil];
}
# pragma mark - ImagePicker Delegate Methods needed




-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
 
    [self.pickerController dismissViewControllerAnimated:YES completion:nil];
    self.viewButton.enabled = NO;
    
    
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    self.currentImage = info[UIImagePickerControllerOriginalImage];
    
    self.imageView.image = self.currentImage;
    
    [self.pickerController dismissViewControllerAnimated:YES completion:nil];
    
    self.viewButton.enabled = YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    ImageViewController * viewController = (ImageViewController *) segue.destinationViewController;
    
    viewController.passedImage = self.currentImage;
    
}
@end
