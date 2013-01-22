//
//  MasterViewController.h
//  UsefulToolsDemo
//
//  Created by Craig Clayton on 1/22/13.
//  Copyright (c) 2013 Craig Clayton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddPetViewController.h"
#import "CoreDataStack.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController <AddPetDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) NSMutableArray *arrPets;
@property (nonatomic, retain) CoreDataStack* dataStack;
@property (nonatomic, retain) AddPetViewController* addPetViewController;
@end
