//
//  StringFile.m
//  Qordoba
//
//    by Qordoba BETA v2.0 on 02/25/2016
//
#import "StringFile.h"

@implementation StringFile

/**
* TODO: 
*/
@synthesize fileName;

/**
* TODO: 
*/
@synthesize fileType;

/**
* TODO: 
*/
@synthesize mid;

/**
* TODO: 
*/
@synthesize sourceColumns;


/**
* Key mappings for the json serialization and deserialization
*/
+(NSDictionary*) keyMap
{
    NSMutableDictionary* map = [[NSMutableDictionary alloc] init];
    [map addEntriesFromDictionary: @{
        @"file_name": @"fileName",
        @"file_type": @"fileType",
        @"id": @"mid",
        @"source_columns": @"sourceColumns"  
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