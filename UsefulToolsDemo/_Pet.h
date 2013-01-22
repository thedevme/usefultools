// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Pet.h instead.

#import <CoreData/CoreData.h>


extern const struct PetAttributes {
	__unsafe_unretained NSString *age;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *weight;
} PetAttributes;

extern const struct PetRelationships {
} PetRelationships;

extern const struct PetFetchedProperties {
} PetFetchedProperties;






@interface PetID : NSManagedObjectID {}
@end

@interface _Pet : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PetID*)objectID;




@property (nonatomic, strong) NSNumber* age;


@property int16_t ageValue;
- (int16_t)ageValue;
- (void)setAgeValue:(int16_t)value_;

//- (BOOL)validateAge:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* weight;


@property int16_t weightValue;
- (int16_t)weightValue;
- (void)setWeightValue:(int16_t)value_;

//- (BOOL)validateWeight:(id*)value_ error:(NSError**)error_;






@end

@interface _Pet (CoreDataGeneratedAccessors)

@end

@interface _Pet (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveAge;
- (void)setPrimitiveAge:(NSNumber*)value;

- (int16_t)primitiveAgeValue;
- (void)setPrimitiveAgeValue:(int16_t)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSNumber*)primitiveWeight;
- (void)setPrimitiveWeight:(NSNumber*)value;

- (int16_t)primitiveWeightValue;
- (void)setPrimitiveWeightValue:(int16_t)value_;




@end
