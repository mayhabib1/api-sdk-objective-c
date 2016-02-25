//
//  Project.m
//  Qordoba
//
//    by Qordoba BETA v2.0 on 02/25/2016
//
#import "Project.h"

@implementation Project

/**
* TODO: 
*/
@synthesize contentType;

/**
* TODO: 
*/
@synthesize milestones;

/**
* TODO: 
*/
@synthesize name;

/**
* TODO: 
*/
@synthesize organizationId;

/**
* TODO: 
*/
@synthesize sourceLanguage;

/**
* TODO: 
*/
@synthesize stringFiles;

/**
* TODO: 
*/
@synthesize targetLanguages;


/**
* Key mappings for the json serialization and deserialization
*/
+(NSDictionary*) keyMap
{
    NSMutableDictionary* map = [[NSMutableDictionary alloc] init];
    [map addEntriesFromDictionary: @{
        @"content_type": @"contentType",
        @"milestones": @"milestones",
        @"name": @"name",
        @"organization_id": @"organizationId",
        @"source_language": @"sourceLanguage",
        @"string_files": @"stringFiles",
        @"target_languages": @"targetLanguages"  
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