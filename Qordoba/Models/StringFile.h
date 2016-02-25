//
//  StringFile.h
//  Qordoba
//
//    by Qordoba BETA v2.0 on 02/25/2016
//
#ifndef Qordoba_STRINGFILE
#define Qordoba_STRINGFILE

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "APIHelper.h"



//protocol defined for deserialization of JSON
@protocol StringFile
@end

@interface StringFile : JSONModel

/**
* TODO: Write general description for this field
*/
@property NSString* fileName;

/**
* TODO: Write general description for this field
*/
@property NSString* fileType;

/**
* TODO: Write general description for this field
*/
@property NSString* mid;

/**
* TODO: Write general description for this field
*/
@property NSArray* sourceColumns;


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