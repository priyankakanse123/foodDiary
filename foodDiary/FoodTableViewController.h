//
//  FoodTableViewController.h
//  foodDiary
//
//  Created by BridgeLabz on 24/12/15.
//  Copyright © 2015 BridgeLabz. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "FoodViewController.h"

@interface FoodTableViewController : UITableViewController

@property (nonatomic,strong) NSMutableArray *foodArray;
-(void)addFood:(NSDictionary *)newFood;
-(void)saveData:(NSNotification*)notification;

@end
