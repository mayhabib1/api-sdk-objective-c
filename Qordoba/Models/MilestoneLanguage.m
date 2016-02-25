//
//  MilestoneLanguage.m
//  Qordoba
//
//    by Qordoba BETA v2.0 on 02/25/2016
//
#import "MilestoneLanguage.h"

@implementation MilestoneLanguage

/**
* TODO: 
*/
@synthesize languages;

/**
* TODO: 
*/
@synthesize milestone;


/**
* Key mappings for the json serialization and deserialization
*/
+(NSDictionary*) keyMap
{
    NSMutableDictionary* map = [[NSMutableDictionary alloc] init];
    [map addEntriesFromDictionary: @{
        @"languages": @"languages",
        @"milestone": @"milestone"  
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