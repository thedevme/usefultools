//
//  AddPetViewController.h
//  UsefulToolsDemo
//
//  Created by Craig Clayton on 1/22/13.
//  Copyright (c) 2013 Craig Clayton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataStack.h"
#import "Pet.h"

@protocol AddPetDelegate <NSObject>

- (void) savePet;

@end


@interface AddPetViewController : UIViewController

@property (nonatomic, retain) CoreDataStack* dataStack;
@property (nonatomic, weak) id <AddPetDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *tfName;
@property (strong, nonatomic) IBOutlet UITextField *tfAge;
@property (strong, nonatomic) IBOutlet UITextField *tfWeight;

@end
