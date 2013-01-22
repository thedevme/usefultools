//
//  DetailViewController.m
//  UsefulToolsDemo
//
//  Created by Craig Clayton on 1/22/13.
//  Copyright (c) 2013 Craig Clayton. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item



- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Pet Details", @"Pet Details");
    }
    return self;
}

- (void) setPetData:(Pet *)pet
{
    self.lblName.text = pet.name;
    self.lblAge.text = [NSString stringWithFormat:@"%i", pet.ageValue];
    self.lblWeight.text = [NSString stringWithFormat:@"%i lbs.", pet.weightValue];
}
							
@end
