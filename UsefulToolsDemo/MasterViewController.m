//
//  MasterViewController.m
//  UsefulToolsDemo
//
//  Created by Craig Clayton on 1/22/13.
//  Copyright (c) 2013 Craig Clayton. All rights reserved.
//

#import "MasterViewController.h"
#import "Pet.h"
#import "DetailViewController.h"

@interface MasterViewController ()
@end

@implementation MasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Master", @"Master");
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initialize];
}


- (void) initialize
{
    [self createNavigationButtons];
    [self createModel];
    [self checkData];
}

- (void) createNavigationButtons
{
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onAddTapped:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void) createModel
{
    self.dataStack = [CoreDataStack coreDataStackWithModelName:@"UsefulToolsDemoModel" databaseFilename:@"UsefulToolsDemoModel.sqlite"];
    self.dataStack.coreDataStoreType = CDSStoreTypeSQL;
    
    
    [self getData];
}


- (void) checkData
{
    BOOL isAtLeastOneEntity = [self.dataStack storeContainsAtLeastOneEntityOfClass:[Pet class]];
    NSLog(isAtLeastOneEntity ? @"Yes" : @"No");
}

- (void) getData
{
    NSError* error = nil;
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"Pet"
                                              inManagedObjectContext:self.dataStack.managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    NSArray *array = [_dataStack.managedObjectContext executeFetchRequest:request error:&error];
    
    self.arrPets = [[NSMutableArray alloc] initWithArray:array];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onAddTapped:(id)sender
{
    self.addPetViewController = [[AddPetViewController alloc] initWithNibName:@"AddPetViewController" bundle:nil];
    self.addPetViewController.delegate = self;
    UINavigationController* navController = [[UINavigationController alloc] initWithRootViewController:self.addPetViewController];
    navController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    [self.navigationController presentViewController:navController animated:YES completion:nil];
}

- (void) savePet
{
    [self.arrPets removeAllObjects];
    [self getData];
    
    [self.tableView reloadData];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrPets.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }


    Pet *objPet = [self.arrPets objectAtIndex:[indexPath row]];
    
    cell.textLabel.text = [objPet name];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.detailViewController) {
        self.detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    }
    
    Pet *objPet = [self.arrPets objectAtIndex:[indexPath row]];
    
    
    [self.navigationController pushViewController:self.detailViewController animated:YES];
    [self.detailViewController setPetData:objPet];
}

@end
