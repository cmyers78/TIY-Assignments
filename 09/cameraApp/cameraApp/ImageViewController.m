//
//  ImageViewController.m
//  cameraApp
//
//  Created by Christopher Myers on 6/2/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import "ImageViewController.h"
#import "ViewController.h"

@interface ImageViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *passedImageVC;



@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.passedImageVC.image = self.passedImage;
    

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
