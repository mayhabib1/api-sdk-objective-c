//
//  Language.h
//  Qordoba
//
//    by Qordoba BETA v2.0 on 02/25/2016
//
#ifndef Qordoba_LANGUAGE
#define Qordoba_LANGUAGE

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "APIHelper.h"

#import "User.h"


//protocol defined for deserialization of JSON
@protocol Language
@end

@interface Language : JSONModel

/**
* TODO: Write general description for this field
*/
@property int mid;

/**
* TODO: Write general description for this field
*/
@property NSArray<User>* users;


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