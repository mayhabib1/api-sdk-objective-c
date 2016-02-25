//
//  MilestoneLanguage.h
//  Qordoba
//
//    by Qordoba BETA v2.0 on 02/25/2016
//
#ifndef Qordoba_MILESTONELANGUAGE
#define Qordoba_MILESTONELANGUAGE

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "APIHelper.h"

#import "Language.h"
#import "Milestone.h"


//protocol defined for deserialization of JSON
@protocol MilestoneLanguage
@end

@interface MilestoneLanguage : JSONModel

/**
* TODO: Write general description for this field
*/
@property NSArray<Language>* languages;

/**
* TODO: Write general description for this field
*/
@property Milestone* milestone;


/**
* Key mappings for the json serialization and deserialization
*/
+(NSDictionary*) keyMap;

/**
* Key mapper for json serialization and deserialization
*/
+(JSONKeyMapper*) keyMapper;

/**
* Helps avoiding deserialization errors when one or more properties are missing
* @returns	True, indicating that all properties are optional for deserialization
*/
+(BOOL)propertyIsOptional:(NSString*) propertyName;

@end
#endif