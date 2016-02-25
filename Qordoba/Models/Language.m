//
//  Language.m
//  Qordoba
//
//    by Qordoba BETA v2.0 on 02/25/2016
//
#import "Language.h"

@implementation Language

/**
* TODO: 
*/
@synthesize mid;

/**
* TODO: 
*/
@synthesize users;


/**
* Key mappings for the json serialization and deserialization
*/
+(NSDictionary*) keyMap
{
    NSMutableDictionary* map = [[NSMutableDictionary alloc] init];
    [map addEntriesFromDictionary: @{
        @"id": @"mid",
        @"users": @"users"  
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