//
//  DetailViewController.m
//  foodDiary
//
//  Created by BridgeLabz on 24/12/15.
//  Copyright © 2015 BridgeLabz. All rights reserved.
//

#import "DetailViewController.h"
#import "FoodTableViewController.h"
#import "FoodViewController.h"
@implementation DetailViewController

@synthesize nameLabel;
@synthesize restaurantLabel;
@synthesize food;
@synthesize label;
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [nameLabel setText:[food objectForKey:@"foodNAme"]];
    [restaurantLabel setText:[food objectForKey:@"restaurantName"]];
  //  [label setText:[@"This is " stringByAppendingString:[food objectForKey:@"foodRating"] stringByAppending]];
    [label setText:[NSString stringWithFormat:@"This is %@ restaurant",[food objectForKey:@"foodRating"] ]];
    NSNumber *longitude = [food objectForKey:@"longitude"];
    NSNumber *latitude=[food objectForKey:@"latitude"];
    MKCoordinateRegion region;
    region.span = MKCoordinateSpanMake(0.02, 0.02);
    region.center = CLLocationCoordinate2DMake([longitude floatValue], [latitude floatValue]);
    [_mapView setRegion:region];
    _foodDetailImage.image=[food objectForKey:@"foodImage"];
//    FoodViewController *fvc = [[FoodViewController alloc]init];
//    if([[fvc ratingControl] selectedSegmentIndex]==0)
//    {
//        [_label setText:@"This is good restaurant"];
//    }
//    else if([[fvc ratingControl] selectedSegmentIndex]==1)
//    {
//         [_label setText:@"This is bad restaurant"];
//    }
//    else
//    {
//        [_label setText:@"response not yet registered"];
//    }
    
    
}



@end
