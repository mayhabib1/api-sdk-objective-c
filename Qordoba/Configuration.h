//
//  Configuration.h
//  Qordoba
//
//    by Qordoba BETA v2.0 on 02/25/2016
//
#ifndef Qordoba_Configuration_h
#define Qordoba_Configuration_h

@interface Configuration : NSObject

/** The base Uri for API calls */
+(NSString*) BaseUri;

/** The username to use with basic authentication */
+(NSString*) BasicAuthUserName;

/** The password to use with basic authentication */
+(NSString*) BasicAuthPassword;


@end

#endif
