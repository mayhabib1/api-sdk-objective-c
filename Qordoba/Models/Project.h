//
//  Project.h
//  Qordoba
//
//    by Qordoba BETA v2.0 on 02/25/2016
//
#ifndef Qordoba_PROJECT
#define Qordoba_PROJECT

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "APIHelper.h"

#import "MilestoneLanguage.h"
#import "StringFile.h"


//protocol defined for deserialization of JSON
@protocol Project
@end

@interface Project : JSONModel

/**
* TODO: Write general description for this field
*/
@property int contentType;

/**
* TODO: Write general description for this field
*/
@property NSArray<MilestoneLanguage>* milestones;

/**
* TODO: Write general description for this field
*/
@property NSString* name;

/**
* TODO: Write general description for this field
*/
@property NSString* organizationId;

/**
* TODO: Write general description for this field
*/
@property int sourceLanguage;

/**
* TODO: Write general description for this field
*/
@property NSArray<StringFile>* stringFiles;

/**
* TODO: Write general description for this field
*/
@property NSArray* targetLanguages;


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