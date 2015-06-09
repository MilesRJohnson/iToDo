//
//  ViewController.m
//  iToDo
//
//  Created by Miles Johnson on 6/9/15.
//  Copyright (c) 2015 StarshipEnterprise. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Items.h"
#import <CoreData/CoreData.h>
#import "DetailViewController.h"

@interface ViewController ()

@property (nonatomic, strong) AppDelegate            *appDelegate;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSArray                *itemArray;
@property (nonatomic, strong) IBOutlet UITableView * itemTableView;

@end

@implementation ViewController

#pragma - To Do List Methods

//- (void)tempAddRecords {
//    NSLog(@"Add");
//    Items *newItem = (Items *)[NSEntityDescription insertNewObjectForEntityForName:@"Items" inManagedObjectContext:_managedObjectContext];
//    [newItem setItemName:@"Do Dishes"];
//    [newItem setItemImportance: [NSNumber numberWithInt:2]];
//    [_appDelegate saveContext];
//}

- (NSArray *)fetchItems {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Items" inManagedObjectContext:_managedObjectContext];
    [fetchRequest setEntity:entity];
    return [_managedObjectContext executeFetchRequest:fetchRequest error:nil];
}



#pragma Table View Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _itemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * cellIdentifer = @"Cell";
    UITableViewCell * cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    Items * currentItem = [_itemArray objectAtIndex:indexPath.row];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifer];
        cell.textLabel.textColor = [UIColor blueColor];
        cell.textLabel.font = [UIFont fontWithName:@"Tahoma" size:15.0];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = currentItem.itemName;
    //cell.detailTextLabel.text = [NSString stringWithFormat:@"%.2f", [self :currentItem]];
    //cell.imageView.image = [UIImage imageNamed:currentFlavor.flavorImage];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Select");
    [self performSegueWithIdentifier:@"listToDetailSegue" sender:self];
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    DetailViewController *destController = [segue destinationViewController];
//    NSIndexPath *indexPath = [_itemTableView indexPathForSelectedRow];
//    Items *newCurrentItem = [_itemArray objectAtIndex:indexPath.row];
//    destController.nameItemString = [newCurrentItem itemName];
//}


#pragma - Life Cycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    _managedObjectContext = _appDelegate.managedObjectContext;
    //[self tempAddRecords];
    _itemArray = [self fetchItems];
    NSLog(@"Count: %li", _itemArray.count);
    NSLog(@"Name: %@", [_itemArray[2] itemName]);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
