//
//  AddPetViewController.m
//  UsefulToolsDemo
//
//  Created by Craig Clayton on 1/22/13.
//  Copyright (c) 2013 Craig Clayton. All rights reserved.
//

#import "AddPetViewController.h"

@interface AddPetViewController ()

@end

@implementation AddPetViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initialize];
    // Do any additional setup after loading the view from its nib.
}

- (void) initialize
{
    [self createModel];
    [self createNavigationButtons];
}


- (void) createModel
{
    self.dataStack = [CoreDataStack coreDataStackWithModelName:@"UsefulToolsDemoModel" databaseFilename:@"UsefulToolsDemoModel.sqlite"];
    self.dataStack.coreDataStoreType = CDSStoreTypeSQL;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) createNavigationButtons
{
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(onSaveTapped:)];
    self.navigationItem.rightBarButtonItem = saveButton;
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(onCancelTapped:)];
    self.navigationItem.leftBarButtonItem = cancelButton;
}

- (void) onSaveTapped:(id)sender
{
    Pet* pet = [Pet insertInManagedObjectContext:self.dataStack.managedObjectContext];
    pet.name = self.tfName.text;
    pet.ageValue = [self.tfAge.text intValue];
    pet.weightValue = [self.tfWeight.text intValue];
    
    [self.dataStack saveOrFail:^(NSError* error) {
        NSLog(@"There was an error %@", error);
        NSLog(@"Failed to save to data store: %@", [error localizedDescription]);
    }];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.delegate savePet];
}

- (void) onCancelTapped:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}









@end
