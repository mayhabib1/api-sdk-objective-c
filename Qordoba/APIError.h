//
//  APIError.h
//  Qordoba
//
//    by Qordoba BETA v2.0 on 02/25/2016
//
#ifndef Qordoba_APIERROR
#define Qordoba_APIERROR

#import <Foundation/Foundation.h>

@interface APIError : NSError

/**
 * The HTTP response code from the API request
 */
@property NSInteger errorCode;

/**
 * The error message for the API calls
 */
@property NSString* errorMessage;

/**
 * The error data for the API calls
 */
@property NSData* errorData;

/**
 * Initialization
 * @param	reason	The reason for the error
 * @param	code	The HTTP response code from the API request
 * @param	data	The Raw HTTP response data from the API request
 */
- (APIError*) initWithReason: (NSString*) reason
                         andCode: (NSInteger) code
                         andData: (NSData*) data;

@end

#endif