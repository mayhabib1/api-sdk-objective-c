//
//  Milestone.m
//  Qordoba
//
//    by Qordoba BETA v2.0 on 02/25/2016
//
#import "Milestone.h"

@implementation Milestone

/**
* TODO: 
*/
@synthesize milestoneId;

/**
* TODO: 
*/
@synthesize name;

/**
* TODO: 
*/
@synthesize order;


/**
* Key mappings for the json serialization and deserialization
*/
+(NSDictionary*) keyMap
{
    NSMutableDictionary* map = [[NSMutableDictionary alloc] init];
    [map addEntriesFromDictionary: @{
        @"milestone_id": @"milestoneId",
        @"name": @"name",
        @"order": @"order"  
    }];

    return map;
}

/**
* Key mapper for json serialization and deserialization
*/
+(JSONKeyMapper*) keyMapper
{ 
  return [[JSONKeyMapper alloc] initWithDictionary: [self keyMap]];
}

/**
* Helps avoiding deserialization errors when one or more properties are missing
* @returns	True, indicating that all properties are optional for deserialization
*/
+(BOOL)propertyIsOptional:(NSString*) propertyName
{
    return YES;
}

@end