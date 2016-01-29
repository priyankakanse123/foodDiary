//
//  FoodViewController.m
//  foodDiary
//
//  Created by BridgeLabz on 24/12/15.
//  Copyright © 2015 BridgeLabz. All rights reserved.
//

#import "FoodViewController.h"

@interface FoodViewController ()

@end


@implementation FoodViewController


@synthesize objtableController;
@synthesize ratingControl;
@synthesize locationManeger;
@synthesize activityIndicator;
@synthesize locationLabel;
@synthesize imageview;
//@synthesize paths;



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[_storedImage scaleToSize:CGSizeMake(50.0f,50.0f)];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if(locationManeger == nil)
    {
        locationManeger = [[CLLocationManager alloc]init];
        [locationManeger setDelegate:self];
        [locationManeger requestWhenInUseAuthorization];
        [locationManeger setDesiredAccuracy:kCLLocationAccuracyKilometer];
        //[locationManeger setPurpose:@""];
    }
    [locationManeger startUpdatingLocation];
    [activityIndicator startAnimating];
    locationLabel.text = @"updating location.....";
    
    
    
    
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations
{
    [activityIndicator stopAnimating];
    locationLabel.text = @"location received";
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(nonnull NSError *)error
{
    [activityIndicator stopAnimating];
    locationLabel.text=@"location error";
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addFoodButton:(id)sender

{
    [locationManeger startUpdatingLocation];
    NSString *newFood =[_addFoodTextField text];
    NSLog(@"RATING CONTROL %d",[ratingControl selectedSegmentIndex]);
    NSString *restaurantName =[_addRestaurantTextField text];
    
   // UIImage *foodImage = imageview.image;
    //NSString *currentImageName = [imageview getFileName];
    
    
    
    NSString *rating = @"ok";
    
    //NSString *rating = [[ratingControl selectedSegmentIndex] ] ;
    if([ratingControl selectedSegmentIndex]==0)
    {
        rating =@"good";
    }
    else
    {
        rating = @"bad";
    }
    NSNumber *longitudeNumber = [[NSNumber alloc]initWithFloat:0.00];
    NSNumber *lattitudeNumber = [[NSNumber alloc]initWithFloat:0.00];
    if(locationManeger.location!=nil)
    {
        CLLocationCoordinate2D currentCoordinate = locationManeger.location.coordinate;
        longitudeNumber = [NSNumber numberWithFloat:currentCoordinate.longitude];
        lattitudeNumber =[NSNumber numberWithFloat:currentCoordinate.latitude];
        
    }
    //inserted image code
    
    NSDictionary *newfood = [[NSDictionary alloc]initWithObjectsAndKeys:newFood,@"foodNAme",restaurantName,@"restaurantName",rating,@"foodRating" ,longitudeNumber,@"longitude",lattitudeNumber,@"latitude",_storedImage,@"foodImage",nil];
    [objtableController addFood:newfood];
    
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    
}
- (IBAction)addImage:(id)sender
{
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [imagePicker setDelegate:self];
    [self presentViewController:imagePicker animated:YES completion:NULL];
    NSLog(@"Button Pressed");
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage ];
    UIImageView *newImage=[[UIImageView alloc]initWithImage:image];
    [newImage setFrame:CGRectMake(0, 0, 50, 50)];
    [self dismissViewControllerAnimated:YES completion:^{
               [imageview addSubview:newImage];
       
        
        
        
        
    }];
    _storedImage = newImage.image;
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
