//
//  FoodViewController.h
//  foodDiary
//
//  Created by BridgeLabz on 24/12/15.
//  Copyright © 2015 BridgeLabz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


//#import "FoodTableViewController.h"
#import "FoodTableViewController.h"
//#include "imprt.m"


@interface FoodViewController : UIViewController<CLLocationManagerDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
- (IBAction)addFoodButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *addFoodTextField;
- (IBAction)addImage:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *imageview;

@property (nonatomic,weak) FoodTableViewController *objtableController;
@property (weak, nonatomic) IBOutlet UITextField *addRestaurantTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *ratingControl;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong,nonatomic) CLLocationManager *locationManeger ;
@property UIImage *storedImage;
//@property (strong,nonatomic) FoodViewController *saveImageObject;

@end
