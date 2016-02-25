//
//  Configuration.m
//  Qordoba
//
//    by Qordoba BETA v2.0 on 02/25/2016
//
#import "Configuration.h"

@implementation Configuration

/** The base Uri for API calls */
+(NSString*) BaseUri
{
    return @"https://developers.qordoba.com";
}

/** The username to use with basic authentication */
+(NSString*) BasicAuthUserName
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"BasicAuthUserName"];
}

/** The password to use with basic authentication */
+(NSString*) BasicAuthPassword
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"BasicAuthPassword"];
}


@end