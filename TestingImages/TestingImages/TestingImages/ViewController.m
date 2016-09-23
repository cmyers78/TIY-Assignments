//
//  ViewController.m
//  TestingImages
//
//  Created by Christopher Myers on 9/23/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (weak, nonatomic) IBOutlet UILabel *imageNameLabel;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.activityIndicator startAnimating];
    
    [self displayPicture:@"https://media.licdn.com/mpr/mpr/AAEAAQAAAAAAAAkHAAAAJGMxMGFkMTlhLTRiYmQtNDRmZS1iYjE4LWRiZWVmODc5NDU4OQ.jpg" fileNameDesired:@"GCD.png"];
    
    [self loadImage:@"GCD.png"];
    
}

- (void) displayPicture: (NSString*) imageString fileNameDesired: (NSString *) fileName {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Create the image URL from a known string.
        NSURL *imageURL = [NSURL URLWithString:imageString];
        
        NSError *downloadError = nil;
        // Create an NSData object from the contents of the given URL.
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL
                                                  options:kNilOptions
                                                    error:&downloadError];
        // ALWAYS utilize the error parameter!
        if (downloadError) {
            // Something went wrong downloading the image. Figure out what went wrong and handle the error.
            // Don't forget to return to the main thread if you plan on doing UI updates here as well.
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.activityIndicator stopAnimating];
                NSLog(@"%@",[downloadError localizedDescription]);
            });
        } else {
            // Get the path of the application's documents directory.
            NSURL *documentsDirectoryURL = [self documentsDirectoryURL];
            // Append the desired file name to the documents directory path.
            NSURL *saveLocation = [documentsDirectoryURL URLByAppendingPathComponent:fileName];
            
            NSError *saveError = nil;
            BOOL writeWasSuccessful = [imageData writeToURL:saveLocation
                                                    options:kNilOptions
                                                      error:&saveError];
            // Successful or not we need to stop the activity indicator, so switch back the the main thread.
            dispatch_async(dispatch_get_main_queue(), ^{
                // Now that we're back on the main thread, you can make changes to the UI.
                // This is where you might display the saved image in some image view, or
                // stop the activity indicator.
                
                // Check if saving the file was successful, once again, utilizing the error parameter.
                if (writeWasSuccessful) {
                    // Get the saved image data from the file.
                    NSData *imageData = [NSData dataWithContentsOfURL:saveLocation];
                    
  //                  NSString *stringData = [[NSString alloc] initWithData:imageData encoding:NSUTF8StringEncoding];
                    
                    // Set the imageView's image to the image we just saved.
                    self.imageView.image = [UIImage imageWithData:imageData];
  //                  self.imageNameLabel.text = stringData;
                    
                    
                } else {
                    NSLog(@"%@",[saveError localizedDescription]);
                    // Something went wrong saving the file. Figure out what went wrong and handle the error.
                }
                
                [self.activityIndicator stopAnimating];
                
            });
        }
    });
    
}

- (NSURL *)documentsDirectoryURL
{
    NSError *error = nil;
    NSURL *url = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory
                                                        inDomain:NSUserDomainMask
                                               appropriateForURL:nil
                                                          create:NO
                                                           error:&error];
    if (error) {
        // Figure out what went wrong and handle the error.
    }
    
    return url;
}

- (void) loadImage: (NSString*) imageName {
    // go into documents directory and retrieve the URL
    
    NSURL * docDirectoryURL = [self documentsDirectoryURL];
    
    NSURL * retrieveURL = [docDirectoryURL URLByAppendingPathComponent:imageName];
    
    // convert URL to string
    
    NSString * myURLString = [retrieveURL absoluteString];
    
    NSLog(myURLString);
    
    self.imageNameLabel.text = myURLString;
    
    
    
}



@end
