//
//  FoodTableViewController.m
//  foodDiary
//
//  Created by BridgeLabz on 24/12/15.
//  Copyright © 2015 BridgeLabz. All rights reserved.
//

#import "FoodViewController.h"
#import "FoodTableViewController.h"
#import "DetailViewController.h"



@interface FoodTableViewController ()

@end

@implementation FoodTableViewController


@synthesize foodArray;
//FoodTableViewController *objtableController=[[FoodTableViewController alloc]init];

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender

{
    if([[segue identifier]isEqualToString:@"AddViewSegue"])
    {
   
        FoodViewController *addViewController=[segue destinationViewController];
    
        [addViewController setObjtableController:self];
    }
    else if ([[segue identifier] isEqualToString:@"DeatilViewSegue"])
    {
        NSIndexPath *selectedRow = [[self tableView ]indexPathForSelectedRow];
        NSDictionary *selectedFood = [foodArray objectAtIndex:[selectedRow row]];
        DetailViewController *detaicontroller =[segue destinationViewController];
        [detaicontroller setFood:selectedFood];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(saveData:) name:UIApplicationDidEnterBackgroundNotification object:nil];
        if([ [NSFileManager defaultManager]fileExistsAtPath:[self plistPath]])
    {
        foodArray =[[NSMutableArray alloc]initWithContentsOfFile:[self plistPath]];
        NSLog(@"plist present");
    }
    else
#pragma changeInCode
    {
        NSDictionary *firstFood = [[NSDictionary alloc]initWithObjectsAndKeys:@"pizza",@"foodNAme",@"pizzaHut",
            @"restaurantName",@"good",@"foodRating",@"UIMAGE",@"FoodImage",nil];
    //foodArray = [[NSMutableArray alloc]initWithObjects:@"Pizza",@"Chips",@"sandwiches", nil];
        foodArray = [[NSMutableArray alloc]initWithObjects:firstFood, nil];
        NSLog(@"plist absent");
    }
    
}
- (NSString *)plistPath
{
    NSLog(@"hello");
    NSString *homeDirectory = NSHomeDirectory();
    NSString *filePath = [homeDirectory stringByAppendingString:@"/Documents/foods.plist"];
    NSLog(@"%@",filePath);
    return filePath;
}


-(void)saveData:(NSNotification*)notification
{
    NSString *filePath;
    NSLog(@"hi");
    filePath = [self plistPath];
    [foodArray writeToFile:filePath atomically:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//warning Incomplete implementation, return the number of rows
    return [foodArray count];
    }


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BasicCell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSInteger rowNumber = [indexPath row];
    NSDictionary *foodDictionary = [foodArray objectAtIndex:rowNumber];
   // NSString *food = [foodArray objectAtIndex:rowNumber];
    NSLog(@"object at index %ld %@",(long)rowNumber,[foodArray objectAtIndex:rowNumber]);
    NSString *food=[foodDictionary objectForKey:@"foodNAme"];
    NSString *resturant =[foodDictionary valueForKey:@"restaurantName"];
    //UIImage *foodImage = [foodDictionary objectForKey:@"foodImage"];
    
   
    //NSString *rating =[foodDictionary valueForKey:@"foodRating"];
#pragma changeCode
   
    
    [[cell textLabel] setText:food];
    [[cell detailTextLabel] setText:resturant];
    cell.imageView.layer.cornerRadius=25;
    cell.imageView.layer.masksToBounds=YES;
    cell.imageView.image = [foodDictionary objectForKey:@"foodImage"];
    //new code
    
    
    return cell;
}

-(void)addFood:(NSDictionary *)newFood

{
    [foodArray addObject:newFood];
    NSLog(@"Adding new Food");
    [[self tableView] reloadData ];
    }

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source
        [foodArray removeObjectAtIndex:[indexPath row]];

        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
       
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
