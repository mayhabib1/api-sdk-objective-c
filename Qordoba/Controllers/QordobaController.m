//
//  QordobaController.m
//  Qordoba
//
//    by Qordoba BETA v2.0 on 02/25/2016
//
#import "QordobaController.h"

@implementation QordobaController

/**
* Creates a new project
* @param    body    Required parameter: Project creation payload
* @return	Returns the void response from the API call */
- (void) createProjectsAsyncWithBody:(Project*) body
                completionBlock:(CompletedPostProjects) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/projects"];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0",
        @"content-type": @"application/json; charset=utf-8"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response 
    HttpRequest* request = [[self clientInstance] postBody: ^(HttpBodyRequest* request)
    {
        [request setBody: [[APIHelper jsonSerialize: body] dataUsingEncoding:NSUTF8StringEncoding]]; //set request body
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, statusError);
         }
         else
         {
             //return response to API caller

         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, error);
     }];
}

/**
* Gets an organisation's projects
* @return	Returns the id response from the API call */
- (void) getProjectsWithCompletionBlock:(CompletedGetProjects) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/projects"];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] get: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, nil, statusError);
         }
         else
         {
             //return response to API caller
             NSString* strResult = [(HttpStringResponse*)response body];
             id result = [NSJSONSerialization
                        JSONObjectWithData: [strResult dataUsingEncoding: NSUTF8StringEncoding]
                                   options: NSJSONReadingAllowFragments
                                     error: nil];

 
             //announce completion with success
             onCompleted(YES, context, result, nil);
         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, nil, error);
     }];
}

/**
* Gets organisation workflows
* @return	Returns the id response from the API call */
- (void) getWorkflowWithCompletionBlock:(CompletedGetWorkflow) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/workflows"];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] get: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, nil, statusError);
         }
         else
         {
             //return response to API caller
             NSString* strResult = [(HttpStringResponse*)response body];
             id result = [NSJSONSerialization
                        JSONObjectWithData: [strResult dataUsingEncoding: NSUTF8StringEncoding]
                                   options: NSJSONReadingAllowFragments
                                     error: nil];

 
             //announce completion with success
             onCompleted(YES, context, result, nil);
         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, nil, error);
     }];
}

/**
* Gets a workflow
* @param    wfId    Required parameter: Your workflow ID
* @return	Returns the id response from the API call */
- (void) getWorkflowAsyncWithWfId:(NSString*) wfId
                completionBlock:(CompletedGetWorkflow) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/workflows/{wf_id}"];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withTemplateParameters: @{
                    @"wf_id": wfId
                }];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] get: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, nil, statusError);
         }
         else
         {
             //return response to API caller
             NSString* strResult = [(HttpStringResponse*)response body];
             id result = [NSJSONSerialization
                        JSONObjectWithData: [strResult dataUsingEncoding: NSUTF8StringEncoding]
                                   options: NSJSONReadingAllowFragments
                                     error: nil];

 
             //announce completion with success
             onCompleted(YES, context, result, nil);
         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, nil, error);
     }];
}

/**
* Gets an organisation's team
* @param    filterQuery    Required parameter: Your filter string
* @param    limit    Required parameter: Your pagination limit
* @param    offset    Required parameter: Your pagination offset
* @return	Returns the id response from the API call */
- (void) getTeamAsyncWithFilterQuery:(NSString*) filterQuery
                limit:(NSString*) limit
                offset:(NSString*) offset
                completionBlock:(CompletedGetTeam) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/team"];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withQueryParameters: @{
                    @"filterQuery": filterQuery,
                    @"limit": limit,
                    @"offset": offset
                }];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] get: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, nil, statusError);
         }
         else
         {
             //return response to API caller
             NSString* strResult = [(HttpStringResponse*)response body];
             id result = [NSJSONSerialization
                        JSONObjectWithData: [strResult dataUsingEncoding: NSUTF8StringEncoding]
                                   options: NSJSONReadingAllowFragments
                                     error: nil];

 
             //announce completion with success
             onCompleted(YES, context, result, nil);
         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, nil, error);
     }];
}

/**
* Gets a project's workflow
* @param    languageId    Required parameter: Your language ID
* @param    projectId    Required parameter: Your project ID
* @return	Returns the id response from the API call */
- (void) getWorkflowAsyncWithLanguageId:(NSString*) languageId
                projectId:(NSString*) projectId
                completionBlock:(CompletedGetWorkflow) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/projects/{project_id}/languages/{language_id}/workflow"];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withTemplateParameters: @{
                    @"language_id": languageId,
                    @"project_id": projectId
                }];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] get: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, nil, statusError);
         }
         else
         {
             //return response to API caller
             NSString* strResult = [(HttpStringResponse*)response body];
             id result = [NSJSONSerialization
                        JSONObjectWithData: [strResult dataUsingEncoding: NSUTF8StringEncoding]
                                   options: NSJSONReadingAllowFragments
                                     error: nil];

 
             //announce completion with success
             onCompleted(YES, context, result, nil);
         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, nil, error);
     }];
}

/**
* Gets an project's feed
* @param    from    Required parameter: Feed source
* @param    limit    Required parameter: Your pagination limit
* @param    projectId    Required parameter: Your project ID
* @return	Returns the id response from the API call */
- (void) getWorkflowAsyncWithFrom:(NSString*) from
                limit:(NSString*) limit
                projectId:(NSString*) projectId
                completionBlock:(CompletedGetWorkflow) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/projects/{project_id}/feed"];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withTemplateParameters: @{
                    @"project_id": projectId
                }];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withQueryParameters: @{
                    @"from": from,
                    @"limit": limit
                }];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] get: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, nil, statusError);
         }
         else
         {
             //return response to API caller
             NSString* strResult = [(HttpStringResponse*)response body];
             id result = [NSJSONSerialization
                        JSONObjectWithData: [strResult dataUsingEncoding: NSUTF8StringEncoding]
                                   options: NSJSONReadingAllowFragments
                                     error: nil];

 
             //announce completion with success
             onCompleted(YES, context, result, nil);
         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, nil, error);
     }];
}

/**
* Gets project's files
* @param    languageId    Required parameter: Your language ID
* @param    limit    Required parameter: Your pagination limit
* @param    offset    Required parameter: Your pagination offset
* @param    projectId    Required parameter: Your project ID
* @param    searchString    Required parameter: Your search string
* @return	Returns the id response from the API call */
- (void) getFilesAsyncWithLanguageId:(NSString*) languageId
                limit:(NSString*) limit
                offset:(NSString*) offset
                projectId:(NSString*) projectId
                searchString:(NSString*) searchString
                completionBlock:(CompletedGetFiles) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/projects/{project_id}/languages/{language_id}/files"];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withTemplateParameters: @{
                    @"language_id": languageId,
                    @"project_id": projectId
                }];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withQueryParameters: @{
                    @"limit": limit,
                    @"offset": offset,
                    @"search_string": searchString
                }];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] get: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, nil, statusError);
         }
         else
         {
             //return response to API caller
             NSString* strResult = [(HttpStringResponse*)response body];
             id result = [NSJSONSerialization
                        JSONObjectWithData: [strResult dataUsingEncoding: NSUTF8StringEncoding]
                                   options: NSJSONReadingAllowFragments
                                     error: nil];

 
             //announce completion with success
             onCompleted(YES, context, result, nil);
         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, nil, error);
     }];
}

/**
* Uploads a project file
* @param    projectId    Required parameter: Your project ID
* @return	Returns the void response from the API call */
- (void) createFilesAsyncWithProjectId:(NSString*) projectId
                completionBlock:(CompletedPostFiles) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/projects/{project_id}/files"];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withTemplateParameters: @{
                    @"project_id": projectId
                }];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] post: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, statusError);
         }
         else
         {
             //return response to API caller

         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, error);
     }];
}

/**
* Downloads a project's file
* @param    fileId    Required parameter: Your file ID
* @param    languageId    Required parameter: Your language ID
* @param    projectId    Required parameter: Your project ID
* @return	Returns the id response from the API call */
- (void) getFilesAsyncWithFileId:(NSString*) fileId
                languageId:(NSString*) languageId
                projectId:(NSString*) projectId
                completionBlock:(CompletedGetFiles) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/projects/{project_id}/languages/{language_id}/files/{file_id}"];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withTemplateParameters: @{
                    @"file_id": fileId,
                    @"language_id": languageId,
                    @"project_id": projectId
                }];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] get: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, nil, statusError);
         }
         else
         {
             //return response to API caller
             NSString* strResult = [(HttpStringResponse*)response body];
             id result = [NSJSONSerialization
                        JSONObjectWithData: [strResult dataUsingEncoding: NSUTF8StringEncoding]
                                   options: NSJSONReadingAllowFragments
                                     error: nil];

 
             //announce completion with success
             onCompleted(YES, context, result, nil);
         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, nil, error);
     }];
}

/**
* Gets a file's segments
* @param    fileId    Required parameter: Your file ID
* @param    filter    Required parameter: Your filter string
* @param    languageId    Required parameter: Your language ID
* @param    limit    Required parameter: Your pagination limit
* @param    offset    Required parameter: Your pagination offset
* @param    projectId    Required parameter: Your project ID
* @param    searchString    Required parameter: Your search string
* @return	Returns the id response from the API call */
- (void) getSegmentsAsyncWithFileId:(NSString*) fileId
                filter:(NSString*) filter
                languageId:(NSString*) languageId
                limit:(NSString*) limit
                offset:(NSString*) offset
                projectId:(NSString*) projectId
                searchString:(NSString*) searchString
                completionBlock:(CompletedGetSegments) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/projects/{project_id}/languages/{language_id}/files/{file_id}/segments"];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withTemplateParameters: @{
                    @"file_id": fileId,
                    @"language_id": languageId,
                    @"project_id": projectId
                }];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withQueryParameters: @{
                    @"filter": filter,
                    @"limit": limit,
                    @"offset": offset,
                    @"search_string": searchString
                }];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] get: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, nil, statusError);
         }
         else
         {
             //return response to API caller
             NSString* strResult = [(HttpStringResponse*)response body];
             id result = [NSJSONSerialization
                        JSONObjectWithData: [strResult dataUsingEncoding: NSUTF8StringEncoding]
                                   options: NSJSONReadingAllowFragments
                                     error: nil];

 
             //announce completion with success
             onCompleted(YES, context, result, nil);
         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, nil, error);
     }];
}

/**
* Gets a segment
* @param    fileId    Required parameter: Your file ID
* @param    languageId    Required parameter: Your language ID
* @param    projectId    Required parameter: Your project ID
* @param    segmentId    Required parameter: Your segment ID
* @return	Returns the id response from the API call */
- (void) getSegmentsAsyncWithFileId:(NSString*) fileId
                languageId:(NSString*) languageId
                projectId:(NSString*) projectId
                segmentId:(NSString*) segmentId
                completionBlock:(CompletedGetSegments) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/projects/{project_id}/languages/{language_id}/files/{file_id}/segments/{segment_id}"];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withTemplateParameters: @{
                    @"file_id": fileId,
                    @"language_id": languageId,
                    @"project_id": projectId,
                    @"segment_id": segmentId
                }];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] get: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, nil, statusError);
         }
         else
         {
             //return response to API caller
             NSString* strResult = [(HttpStringResponse*)response body];
             id result = [NSJSONSerialization
                        JSONObjectWithData: [strResult dataUsingEncoding: NSUTF8StringEncoding]
                                   options: NSJSONReadingAllowFragments
                                     error: nil];

 
             //announce completion with success
             onCompleted(YES, context, result, nil);
         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, nil, error);
     }];
}

/**
* Updates a segment
* @param    fileId    Required parameter: Your file ID
* @param    languageId    Required parameter: Your language ID
* @param    projectId    Required parameter: Your project ID
* @param    segmentId    Required parameter: Your segment ID
* @return	Returns the void response from the API call */
- (void) updateSegmentsAsyncWithFileId:(NSString*) fileId
                languageId:(NSString*) languageId
                projectId:(NSString*) projectId
                segmentId:(NSString*) segmentId
                completionBlock:(CompletedPutSegments) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/projects/{project_id}/languages/{language_id}/files/{file_id}/segments/{segment_id}"];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withTemplateParameters: @{
                    @"file_id": fileId,
                    @"language_id": languageId,
                    @"project_id": projectId,
                    @"segment_id": segmentId
                }];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] put: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, statusError);
         }
         else
         {
             //return response to API caller

         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, error);
     }];
}

/**
* Adds segments to a file
* @param    body    Required parameter: Project creation payload
* @param    fileId    Required parameter: Your file ID
* @param    projectId    Required parameter: Your project ID
* @return	Returns the void response from the API call */
- (void) createFilesAsyncWithBody:(Project*) body
                fileId:(NSString*) fileId
                projectId:(NSString*) projectId
                completionBlock:(CompletedPostFiles) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/projects/{project_id}/files/{file_id}/segments"];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withTemplateParameters: @{
                    @"file_id": fileId,
                    @"project_id": projectId
                }];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0",
        @"content-type": @"application/json; charset=utf-8"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response 
    HttpRequest* request = [[self clientInstance] postBody: ^(HttpBodyRequest* request)
    {
        [request setBody: [[APIHelper jsonSerialize: body] dataUsingEncoding:NSUTF8StringEncoding]]; //set request body
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, statusError);
         }
         else
         {
             //return response to API caller

         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, error);
     }];
}

/**
* Creates an empty file
* @param    fileName    Required parameter: Your file name
* @param    projectId    Required parameter: Your project ID
* @return	Returns the void response from the API call */
- (void) createFilesAsyncWithFileName:(NSString*) fileName
                projectId:(NSString*) projectId
                completionBlock:(CompletedPostFiles) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/projects/{project_id}/files/{file_name}"];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withTemplateParameters: @{
                    @"file_name": fileName,
                    @"project_id": projectId
                }];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] post: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, statusError);
         }
         else
         {
             //return response to API caller

         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, error);
     }];
}

/**
* Gets an organisation's translation memory
* @return	Returns the id response from the API call */
- (void) getTmWithCompletionBlock:(CompletedGetTm) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/translation_memories"];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] get: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, nil, statusError);
         }
         else
         {
             //return response to API caller
             NSString* strResult = [(HttpStringResponse*)response body];
             id result = [NSJSONSerialization
                        JSONObjectWithData: [strResult dataUsingEncoding: NSUTF8StringEncoding]
                                   options: NSJSONReadingAllowFragments
                                     error: nil];

 
             //announce completion with success
             onCompleted(YES, context, result, nil);
         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, nil, error);
     }];
}

/**
* Posts an organisation's translation memory
* @return	Returns the void response from the API call */
- (void) createTmWithCompletionBlock:(CompletedPostTm) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/translation_memories/upload"];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] post: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, statusError);
         }
         else
         {
             //return response to API caller

         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, error);
     }];
}

/**
* Gets a translation memory config
* @param    tmId    Required parameter: Your translation memory ID
* @return	Returns the id response from the API call */
- (void) getTmAsyncWithTmId:(NSString*) tmId
                completionBlock:(CompletedGetTm) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/translation_memories/{tm_id}/config"];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withTemplateParameters: @{
                    @"tm_id": tmId
                }];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] get: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, nil, statusError);
         }
         else
         {
             //return response to API caller
             NSString* strResult = [(HttpStringResponse*)response body];
             id result = [NSJSONSerialization
                        JSONObjectWithData: [strResult dataUsingEncoding: NSUTF8StringEncoding]
                                   options: NSJSONReadingAllowFragments
                                     error: nil];

 
             //announce completion with success
             onCompleted(YES, context, result, nil);
         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, nil, error);
     }];
}

/**
* Updates a translation memory config
* @param    tmId    Required parameter: Your translation ID
* @return	Returns the void response from the API call */
- (void) updateTmAsyncWithTmId:(NSString*) tmId
                completionBlock:(CompletedPutTm) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/translation_memories/{tm_id}/config"];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withTemplateParameters: @{
                    @"tm_id": tmId
                }];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] put: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, statusError);
         }
         else
         {
             //return response to API caller

         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, error);
     }];
}

/**
* Gets a translation memory
* @param    tmId    Required parameter: Your translation memory ID
* @return	Returns the id response from the API call */
- (void) getTmAsyncWithTmId:(NSString*) tmId
                completionBlock:(CompletedGetTm) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/translation_memories/{tm_id}"];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withTemplateParameters: @{
                    @"tm_id": tmId
                }];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] get: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, nil, statusError);
         }
         else
         {
             //return response to API caller
             NSString* strResult = [(HttpStringResponse*)response body];
             id result = [NSJSONSerialization
                        JSONObjectWithData: [strResult dataUsingEncoding: NSUTF8StringEncoding]
                                   options: NSJSONReadingAllowFragments
                                     error: nil];

 
             //announce completion with success
             onCompleted(YES, context, result, nil);
         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, nil, error);
     }];
}

/**
* Gets a translation memory's segments
* @param    tmId    Required parameter: Your translation memory ID
* @return	Returns the id response from the API call */
- (void) getTmAsyncWithTmId:(NSString*) tmId
                completionBlock:(CompletedGetTm) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/translation_memories/{tm_id}/segments"];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withTemplateParameters: @{
                    @"tm_id": tmId
                }];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] get: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, nil, statusError);
         }
         else
         {
             //return response to API caller
             NSString* strResult = [(HttpStringResponse*)response body];
             id result = [NSJSONSerialization
                        JSONObjectWithData: [strResult dataUsingEncoding: NSUTF8StringEncoding]
                                   options: NSJSONReadingAllowFragments
                                     error: nil];

 
             //announce completion with success
             onCompleted(YES, context, result, nil);
         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, nil, error);
     }];
}

/**
* Posts a translation memory's term
* @return	Returns the void response from the API call */
- (void) createTmWithCompletionBlock:(CompletedPostTm) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/translation_memories/add_term"];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] post: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, statusError);
         }
         else
         {
             //return response to API caller

         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, error);
     }];
}

/**
* Gets a translation memory's segment
* @param    mid    Required parameter: Your segment ID
* @param    tmId    Required parameter: Your translation memory ID
* @return	Returns the id response from the API call */
- (void) getTmAsyncWithId:(NSString*) mid
                tmId:(NSString*) tmId
                completionBlock:(CompletedGetTm) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/translation_memories/{tm_id}/segments/{id}"];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withTemplateParameters: @{
                    @"id": mid,
                    @"tm_id": tmId
                }];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] get: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, nil, statusError);
         }
         else
         {
             //return response to API caller
             NSString* strResult = [(HttpStringResponse*)response body];
             id result = [NSJSONSerialization
                        JSONObjectWithData: [strResult dataUsingEncoding: NSUTF8StringEncoding]
                                   options: NSJSONReadingAllowFragments
                                     error: nil];

 
             //announce completion with success
             onCompleted(YES, context, result, nil);
         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, nil, error);
     }];
}

/**
* Updates a translation memory's segment
* @param    mid    Required parameter: Your segment ID
* @param    tmId    Required parameter: Your translation memory ID
* @return	Returns the void response from the API call */
- (void) updateTmAsyncWithId:(NSString*) mid
                tmId:(NSString*) tmId
                completionBlock:(CompletedPutTm) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/translation_memories/{tm_id}/segments/{id}"];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withTemplateParameters: @{
                    @"id": mid,
                    @"tm_id": tmId
                }];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] put: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, statusError);
         }
         else
         {
             //return response to API caller

         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, error);
     }];
}

/**
* Deletes a translation memory's segment
* @param    mid    Required parameter: Your segment ID
* @param    tmId    Required parameter: Your translation memory ID
* @return	Returns the void response from the API call */
- (void) deleteTmAsyncWithId:(NSString*) mid
                tmId:(NSString*) tmId
                completionBlock:(CompletedDeleteTm) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/translation_memories/{tm_id}/segments/{id}"];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withTemplateParameters: @{
                    @"id": mid,
                    @"tm_id": tmId
                }];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] delete: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, statusError);
         }
         else
         {
             //return response to API caller

         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, error);
     }];
}

/**
* Gets organization's glossaries
* @return	Returns the id response from the API call */
- (void) getGlossariesWithCompletionBlock:(CompletedGetGlossaries) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/glossaries"];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] get: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, nil, statusError);
         }
         else
         {
             //return response to API caller
             NSString* strResult = [(HttpStringResponse*)response body];
             id result = [NSJSONSerialization
                        JSONObjectWithData: [strResult dataUsingEncoding: NSUTF8StringEncoding]
                                   options: NSJSONReadingAllowFragments
                                     error: nil];

 
             //announce completion with success
             onCompleted(YES, context, result, nil);
         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, nil, error);
     }];
}

/**
* Posts an organization glossary
* @return	Returns the void response from the API call */
- (void) createGlossariesWithCompletionBlock:(CompletedPostGlossaries) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/glossaries/upload"];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] post: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, statusError);
         }
         else
         {
             //return response to API caller

         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, error);
     }];
}

/**
* Gets a glossary's config
* @param    glossaryId    Required parameter: Your glossary ID
* @return	Returns the id response from the API call */
- (void) getGlossariesAsyncWithGlossaryId:(NSString*) glossaryId
                completionBlock:(CompletedGetGlossaries) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/glossaries/{glossary_id}/config"];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withTemplateParameters: @{
                    @"glossary_id": glossaryId
                }];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] get: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, nil, statusError);
         }
         else
         {
             //return response to API caller
             NSString* strResult = [(HttpStringResponse*)response body];
             id result = [NSJSONSerialization
                        JSONObjectWithData: [strResult dataUsingEncoding: NSUTF8StringEncoding]
                                   options: NSJSONReadingAllowFragments
                                     error: nil];

 
             //announce completion with success
             onCompleted(YES, context, result, nil);
         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, nil, error);
     }];
}

/**
* Updates a glossary's config
* @param    glossaryId    Required parameter: Your glossary ID
* @return	Returns the void response from the API call */
- (void) updateGlossariesAsyncWithGlossaryId:(NSString*) glossaryId
                completionBlock:(CompletedPutGlossaries) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/glossaries/{glossary_id}/config"];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withTemplateParameters: @{
                    @"glossary_id": glossaryId
                }];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] put: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, statusError);
         }
         else
         {
             //return response to API caller

         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, error);
     }];
}

/**
* Downloads a glossary
* @param    glossaryId    Required parameter: Your glossary ID
* @return	Returns the id response from the API call */
- (void) getGlossariesAsyncWithGlossaryId:(NSString*) glossaryId
                completionBlock:(CompletedGetGlossaries) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/glossaries/{glossary_id}/download"];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withTemplateParameters: @{
                    @"glossary_id": glossaryId
                }];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] get: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, nil, statusError);
         }
         else
         {
             //return response to API caller
             NSString* strResult = [(HttpStringResponse*)response body];
             id result = [NSJSONSerialization
                        JSONObjectWithData: [strResult dataUsingEncoding: NSUTF8StringEncoding]
                                   options: NSJSONReadingAllowFragments
                                     error: nil];

 
             //announce completion with success
             onCompleted(YES, context, result, nil);
         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, nil, error);
     }];
}

/**
* Gets a glossary
* @param    glossaryId    Required parameter: Your glossary ID
* @return	Returns the id response from the API call */
- (void) getGlossariesAsyncWithGlossaryId:(NSString*) glossaryId
                completionBlock:(CompletedGetGlossaries) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/glossaries/{glossary_id}"];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withTemplateParameters: @{
                    @"glossary_id": glossaryId
                }];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] get: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, nil, statusError);
         }
         else
         {
             //return response to API caller
             NSString* strResult = [(HttpStringResponse*)response body];
             id result = [NSJSONSerialization
                        JSONObjectWithData: [strResult dataUsingEncoding: NSUTF8StringEncoding]
                                   options: NSJSONReadingAllowFragments
                                     error: nil];

 
             //announce completion with success
             onCompleted(YES, context, result, nil);
         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, nil, error);
     }];
}

/**
* Gets project glossaries
* @param    languageId    Required parameter: Your language ID
* @param    projectId    Required parameter: Your project ID
* @return	Returns the id response from the API call */
- (void) getGlossariesAsyncWithLanguageId:(NSString*) languageId
                projectId:(NSString*) projectId
                completionBlock:(CompletedGetGlossaries) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/project/{project_id}/languages/{language_id}/glossaries/terms"];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withTemplateParameters: @{
                    @"language_id": languageId,
                    @"project_id": projectId
                }];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] get: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, nil, statusError);
         }
         else
         {
             //return response to API caller
             NSString* strResult = [(HttpStringResponse*)response body];
             id result = [NSJSONSerialization
                        JSONObjectWithData: [strResult dataUsingEncoding: NSUTF8StringEncoding]
                                   options: NSJSONReadingAllowFragments
                                     error: nil];

 
             //announce completion with success
             onCompleted(YES, context, result, nil);
         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, nil, error);
     }];
}

/**
* Posts glossary term
* @return	Returns the void response from the API call */
- (void) createGlossariesWithCompletionBlock:(CompletedPostGlossaries) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/glossaries/add_term"];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] post: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, statusError);
         }
         else
         {
             //return response to API caller

         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, error);
     }];
}

/**
* Gets glossary term
* @param    glossaryId    Required parameter: Your glossary ID
* @param    mid    Required parameter: Your glossary term ID
* @return	Returns the id response from the API call */
- (void) getGlossariesAsyncWithGlossaryId:(NSString*) glossaryId
                mid:(NSString*) mid
                completionBlock:(CompletedGetGlossaries) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/glossaries/{glossary_id}/terms/{id}"];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withTemplateParameters: @{
                    @"glossary_id": glossaryId,
                    @"id": mid
                }];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] get: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, nil, statusError);
         }
         else
         {
             //return response to API caller
             NSString* strResult = [(HttpStringResponse*)response body];
             id result = [NSJSONSerialization
                        JSONObjectWithData: [strResult dataUsingEncoding: NSUTF8StringEncoding]
                                   options: NSJSONReadingAllowFragments
                                     error: nil];

 
             //announce completion with success
             onCompleted(YES, context, result, nil);
         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, nil, error);
     }];
}

/**
* Updates glossary term
* @param    glossaryId    Required parameter: Your glossary ID
* @param    mid    Required parameter: Your glossary term ID
* @return	Returns the void response from the API call */
- (void) updateGlossariesAsyncWithGlossaryId:(NSString*) glossaryId
                mid:(NSString*) mid
                completionBlock:(CompletedPutGlossaries) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/glossaries/{glossary_id}/terms/{id}"];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withTemplateParameters: @{
                    @"glossary_id": glossaryId,
                    @"id": mid
                }];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] put: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, statusError);
         }
         else
         {
             //return response to API caller

         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, error);
     }];
}

/**
* Deletes glossary term
* @param    glossaryId    Required parameter: Your glossary ID
* @param    mid    Required parameter: Your glossary term ID
* @return	Returns the void response from the API call */
- (void) deleteGlossariesAsyncWithGlossaryId:(NSString*) glossaryId
                mid:(NSString*) mid
                completionBlock:(CompletedDeleteGlossaries) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/glossaries/{glossary_id}/terms/{id}"];

    //process optional query parameters
    [APIHelper appendUrl: queryBuilder withTemplateParameters: @{
                    @"glossary_id": glossaryId,
                    @"id": mid
                }];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] delete: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, statusError);
         }
         else
         {
             //return response to API caller

         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, error);
     }];
}

/**
* Gets languages
* @return	Returns the id response from the API call */
- (void) getLanguagesWithCompletionBlock:(CompletedGetLanguages) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/languages"];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] get: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, nil, statusError);
         }
         else
         {
             //return response to API caller
             NSString* strResult = [(HttpStringResponse*)response body];
             id result = [NSJSONSerialization
                        JSONObjectWithData: [strResult dataUsingEncoding: NSUTF8StringEncoding]
                                   options: NSJSONReadingAllowFragments
                                     error: nil];

 
             //announce completion with success
             onCompleted(YES, context, result, nil);
         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, nil, error);
     }];
}

/**
* Gets countries
* @return	Returns the id response from the API call */
- (void) getLanguagesWithCompletionBlock:(CompletedGetLanguages) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/countries"];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] get: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, nil, statusError);
         }
         else
         {
             //return response to API caller
             NSString* strResult = [(HttpStringResponse*)response body];
             id result = [NSJSONSerialization
                        JSONObjectWithData: [strResult dataUsingEncoding: NSUTF8StringEncoding]
                                   options: NSJSONReadingAllowFragments
                                     error: nil];

 
             //announce completion with success
             onCompleted(YES, context, result, nil);
         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, nil, error);
     }];
}

/**
* Gets regex templates
* @return	Returns the id response from the API call */
- (void) getRegextemplatesWithCompletionBlock:(CompletedGetRegextemplates) onCompleted
{
    //the base uri for api requests
    NSString* baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* queryBuilder = [NSMutableString stringWithString: baseUri]; 
    [queryBuilder appendString: @"/api/regextemplates"];

    //validate and preprocess url
    NSString* queryUrl = [APIHelper cleanUrl: queryBuilder];

    //preparing request headers
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"Qordoba 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: headers];


    //prepare the request and fetch response  
    HttpRequest* request = [[self clientInstance] get: ^(HttpRequest* request) 
    { 
        [request setQueryUrl: queryUrl]; //set request url        
        [request setHeaders: headers]; //set request headers
        [request setUsername: [Configuration BasicAuthUserName]];
        [request setPassword: [Configuration BasicAuthPassword]];

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: request
     success: ^(id context, HttpResponse *response) {
         //Error handling using HTTP status codes
         NSError* statusError = nil;

         //Error handling using HTTP status codes 
         if((response.statusCode < 200) || (response.statusCode > 206)) //[200,206] = HTTP OK
             statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: response.statusCode
                                                    andData: response.rawBody];

         if(statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, context, nil, statusError);
         }
         else
         {
             //return response to API caller
             NSString* strResult = [(HttpStringResponse*)response body];
             id result = [NSJSONSerialization
                        JSONObjectWithData: [strResult dataUsingEncoding: NSUTF8StringEncoding]
                                   options: NSJSONReadingAllowFragments
                                     error: nil];

 
             //announce completion with success
             onCompleted(YES, context, result, nil);
         }
     } failure:^(id context, NSError *error) {
 
         //announce completion with failure
         onCompleted(NO, context, nil, error);
     }];
}


@end