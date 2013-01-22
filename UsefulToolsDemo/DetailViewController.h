//
//  DetailViewController.h
//  UsefulToolsDemo
//
//  Created by Craig Clayton on 1/22/13.
//  Copyright (c) 2013 Craig Clayton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pet.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblAge;
@property (strong, nonatomic) IBOutlet UILabel *lblWeight;

- (void) setPetData:(Pet *)pet;

@end
