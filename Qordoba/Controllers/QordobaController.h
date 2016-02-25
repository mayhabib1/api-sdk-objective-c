//
//  QordobaController.h
//  Qordoba
//
//    by Qordoba BETA v2.0 on 02/25/2016
//
#import <Foundation/Foundation.h>
#import "Configuration.h"
#import "APIHelper.h"
#import "APIError.h"
#import "BaseController.h"
#import "UnirestClient.h"
#import "HttpContext.h"
#import "Project.h"

@interface QordobaController : BaseController

/**
* Completion block definition for asynchronous call to projects */
typedef void (^CompletedPostProjects)(BOOL success, HttpContext* context, NSError* error);

/**
* Creates a new project
* @param    body    Required parameter: Project creation payload
*/
- (void) createProjectsAsyncWithBody:(Project*) body
                completionBlock:(CompletedPostProjects) onCompleted;

/**
* Completion block definition for asynchronous call to projects */
typedef void (^CompletedGetProjects)(BOOL success, HttpContext* context, id response, NSError* error);

/**
* Gets an organisation's projects
*/
- (void) getProjectsWithCompletionBlock:(CompletedGetProjects) onCompleted;

/**
* Completion block definition for asynchronous call to workflow */
typedef void (^CompletedGetWorkflow)(BOOL success, HttpContext* context, id response, NSError* error);

/**
* Gets organisation workflows
*/
- (void) getWorkflowWithCompletionBlock:(CompletedGetWorkflow) onCompleted;

/**
* Completion block definition for asynchronous call to workflow */
typedef void (^CompletedGetWorkflow)(BOOL success, HttpContext* context, id response, NSError* error);

/**
* Gets a workflow
* @param    wfId    Required parameter: Your workflow ID
*/
- (void) getWorkflowAsyncWithWfId:(NSString*) wfId
                completionBlock:(CompletedGetWorkflow) onCompleted;

/**
* Completion block definition for asynchronous call to team */
typedef void (^CompletedGetTeam)(BOOL success, HttpContext* context, id response, NSError* error);

/**
* Gets an organisation's team
* @param    filterQuery    Required parameter: Your filter string
* @param    limit    Required parameter: Your pagination limit
* @param    offset    Required parameter: Your pagination offset
*/
- (void) getTeamAsyncWithFilterQuery:(NSString*) filterQuery
                limit:(NSString*) limit
                offset:(NSString*) offset
                completionBlock:(CompletedGetTeam) onCompleted;

/**
* Completion block definition for asynchronous call to workflow */
typedef void (^CompletedGetWorkflow)(BOOL success, HttpContext* context, id response, NSError* error);

/**
* Gets a project's workflow
* @param    languageId    Required parameter: Your language ID
* @param    projectId    Required parameter: Your project ID
*/
- (void) getWorkflowAsyncWithLanguageId:(NSString*) languageId
                projectId:(NSString*) projectId
                completionBlock:(CompletedGetWorkflow) onCompleted;

/**
* Completion block definition for asynchronous call to workflow */
typedef void (^CompletedGetWorkflow)(BOOL success, HttpContext* context, id response, NSError* error);

/**
* Gets an project's feed
* @param    from    Required parameter: Feed source
* @param    limit    Required parameter: Your pagination limit
* @param    projectId    Required parameter: Your project ID
*/
- (void) getWorkflowAsyncWithFrom:(NSString*) from
                limit:(NSString*) limit
                projectId:(NSString*) projectId
                completionBlock:(CompletedGetWorkflow) onCompleted;

/**
* Completion block definition for asynchronous call to files */
typedef void (^CompletedGetFiles)(BOOL success, HttpContext* context, id response, NSError* error);

/**
* Gets project's files
* @param    languageId    Required parameter: Your language ID
* @param    limit    Required parameter: Your pagination limit
* @param    offset    Required parameter: Your pagination offset
* @param    projectId    Required parameter: Your project ID
* @param    searchString    Required parameter: Your search string
*/
- (void) getFilesAsyncWithLanguageId:(NSString*) languageId
                limit:(NSString*) limit
                offset:(NSString*) offset
                projectId:(NSString*) projectId
                searchString:(NSString*) searchString
                completionBlock:(CompletedGetFiles) onCompleted;

/**
* Completion block definition for asynchronous call to files */
typedef void (^CompletedPostFiles)(BOOL success, HttpContext* context, NSError* error);

/**
* Uploads a project file
* @param    projectId    Required parameter: Your project ID
*/
- (void) createFilesAsyncWithProjectId:(NSString*) projectId
                completionBlock:(CompletedPostFiles) onCompleted;

/**
* Completion block definition for asynchronous call to files */
typedef void (^CompletedGetFiles)(BOOL success, HttpContext* context, id response, NSError* error);

/**
* Downloads a project's file
* @param    fileId    Required parameter: Your file ID
* @param    languageId    Required parameter: Your language ID
* @param    projectId    Required parameter: Your project ID
*/
- (void) getFilesAsyncWithFileId:(NSString*) fileId
                languageId:(NSString*) languageId
                projectId:(NSString*) projectId
                completionBlock:(CompletedGetFiles) onCompleted;

/**
* Completion block definition for asynchronous call to segments */
typedef void (^CompletedGetSegments)(BOOL success, HttpContext* context, id response, NSError* error);

/**
* Gets a file's segments
* @param    fileId    Required parameter: Your file ID
* @param    filter    Required parameter: Your filter string
* @param    languageId    Required parameter: Your language ID
* @param    limit    Required parameter: Your pagination limit
* @param    offset    Required parameter: Your pagination offset
* @param    projectId    Required parameter: Your project ID
* @param    searchString    Required parameter: Your search string
*/
- (void) getSegmentsAsyncWithFileId:(NSString*) fileId
                filter:(NSString*) filter
                languageId:(NSString*) languageId
                limit:(NSString*) limit
                offset:(NSString*) offset
                projectId:(NSString*) projectId
                searchString:(NSString*) searchString
                completionBlock:(CompletedGetSegments) onCompleted;

/**
* Completion block definition for asynchronous call to segments */
typedef void (^CompletedGetSegments)(BOOL success, HttpContext* context, id response, NSError* error);

/**
* Gets a segment
* @param    fileId    Required parameter: Your file ID
* @param    languageId    Required parameter: Your language ID
* @param    projectId    Required parameter: Your project ID
* @param    segmentId    Required parameter: Your segment ID
*/
- (void) getSegmentsAsyncWithFileId:(NSString*) fileId
                languageId:(NSString*) languageId
                projectId:(NSString*) projectId
                segmentId:(NSString*) segmentId
                completionBlock:(CompletedGetSegments) onCompleted;

/**
* Completion block definition for asynchronous call to segments */
typedef void (^CompletedPutSegments)(BOOL success, HttpContext* context, NSError* error);

/**
* Updates a segment
* @param    fileId    Required parameter: Your file ID
* @param    languageId    Required parameter: Your language ID
* @param    projectId    Required parameter: Your project ID
* @param    segmentId    Required parameter: Your segment ID
*/
- (void) updateSegmentsAsyncWithFileId:(NSString*) fileId
                languageId:(NSString*) languageId
                projectId:(NSString*) projectId
                segmentId:(NSString*) segmentId
                completionBlock:(CompletedPutSegments) onCompleted;

/**
* Completion block definition for asynchronous call to files */
typedef void (^CompletedPostFiles)(BOOL success, HttpContext* context, NSError* error);

/**
* Adds segments to a file
* @param    body    Required parameter: Project creation payload
* @param    fileId    Required parameter: Your file ID
* @param    projectId    Required parameter: Your project ID
*/
- (void) createFilesAsyncWithBody:(Project*) body
                fileId:(NSString*) fileId
                projectId:(NSString*) projectId
                completionBlock:(CompletedPostFiles) onCompleted;

/**
* Completion block definition for asynchronous call to files */
typedef void (^CompletedPostFiles)(BOOL success, HttpContext* context, NSError* error);

/**
* Creates an empty file
* @param    fileName    Required parameter: Your file name
* @param    projectId    Required parameter: Your project ID
*/
- (void) createFilesAsyncWithFileName:(NSString*) fileName
                projectId:(NSString*) projectId
                completionBlock:(CompletedPostFiles) onCompleted;

/**
* Completion block definition for asynchronous call to tm */
typedef void (^CompletedGetTm)(BOOL success, HttpContext* context, id response, NSError* error);

/**
* Gets an organisation's translation memory
*/
- (void) getTmWithCompletionBlock:(CompletedGetTm) onCompleted;

/**
* Completion block definition for asynchronous call to tm */
typedef void (^CompletedPostTm)(BOOL success, HttpContext* context, NSError* error);

/**
* Posts an organisation's translation memory
*/
- (void) createTmWithCompletionBlock:(CompletedPostTm) onCompleted;

/**
* Completion block definition for asynchronous call to tm */
typedef void (^CompletedGetTm)(BOOL success, HttpContext* context, id response, NSError* error);

/**
* Gets a translation memory config
* @param    tmId    Required parameter: Your translation memory ID
*/
- (void) getTmAsyncWithTmId:(NSString*) tmId
                completionBlock:(CompletedGetTm) onCompleted;

/**
* Completion block definition for asynchronous call to tm */
typedef void (^CompletedPutTm)(BOOL success, HttpContext* context, NSError* error);

/**
* Updates a translation memory config
* @param    tmId    Required parameter: Your translation ID
*/
- (void) updateTmAsyncWithTmId:(NSString*) tmId
                completionBlock:(CompletedPutTm) onCompleted;

/**
* Completion block definition for asynchronous call to tm */
typedef void (^CompletedGetTm)(BOOL success, HttpContext* context, id response, NSError* error);

/**
* Gets a translation memory
* @param    tmId    Required parameter: Your translation memory ID
*/
- (void) getTmAsyncWithTmId:(NSString*) tmId
                completionBlock:(CompletedGetTm) onCompleted;

/**
* Completion block definition for asynchronous call to tm */
typedef void (^CompletedGetTm)(BOOL success, HttpContext* context, id response, NSError* error);

/**
* Gets a translation memory's segments
* @param    tmId    Required parameter: Your translation memory ID
*/
- (void) getTmAsyncWithTmId:(NSString*) tmId
                completionBlock:(CompletedGetTm) onCompleted;

/**
* Completion block definition for asynchronous call to tm */
typedef void (^CompletedPostTm)(BOOL success, HttpContext* context, NSError* error);

/**
* Posts a translation memory's term
*/
- (void) createTmWithCompletionBlock:(CompletedPostTm) onCompleted;

/**
* Completion block definition for asynchronous call to tm */
typedef void (^CompletedGetTm)(BOOL success, HttpContext* context, id response, NSError* error);

/**
* Gets a translation memory's segment
* @param    mid    Required parameter: Your segment ID
* @param    tmId    Required parameter: Your translation memory ID
*/
- (void) getTmAsyncWithId:(NSString*) mid
                tmId:(NSString*) tmId
                completionBlock:(CompletedGetTm) onCompleted;

/**
* Completion block definition for asynchronous call to tm */
typedef void (^CompletedPutTm)(BOOL success, HttpContext* context, NSError* error);

/**
* Updates a translation memory's segment
* @param    mid    Required parameter: Your segment ID
* @param    tmId    Required parameter: Your translation memory ID
*/
- (void) updateTmAsyncWithId:(NSString*) mid
                tmId:(NSString*) tmId
                completionBlock:(CompletedPutTm) onCompleted;

/**
* Completion block definition for asynchronous call to tm */
typedef void (^CompletedDeleteTm)(BOOL success, HttpContext* context, NSError* error);

/**
* Deletes a translation memory's segment
* @param    mid    Required parameter: Your segment ID
* @param    tmId    Required parameter: Your translation memory ID
*/
- (void) deleteTmAsyncWithId:(NSString*) mid
                tmId:(NSString*) tmId
                completionBlock:(CompletedDeleteTm) onCompleted;

/**
* Completion block definition for asynchronous call to glossaries */
typedef void (^CompletedGetGlossaries)(BOOL success, HttpContext* context, id response, NSError* error);

/**
* Gets organization's glossaries
*/
- (void) getGlossariesWithCompletionBlock:(CompletedGetGlossaries) onCompleted;

/**
* Completion block definition for asynchronous call to glossaries */
typedef void (^CompletedPostGlossaries)(BOOL success, HttpContext* context, NSError* error);

/**
* Posts an organization glossary
*/
- (void) createGlossariesWithCompletionBlock:(CompletedPostGlossaries) onCompleted;

/**
* Completion block definition for asynchronous call to glossaries */
typedef void (^CompletedGetGlossaries)(BOOL success, HttpContext* context, id response, NSError* error);

/**
* Gets a glossary's config
* @param    glossaryId    Required parameter: Your glossary ID
*/
- (void) getGlossariesAsyncWithGlossaryId:(NSString*) glossaryId
                completionBlock:(CompletedGetGlossaries) onCompleted;

/**
* Completion block definition for asynchronous call to glossaries */
typedef void (^CompletedPutGlossaries)(BOOL success, HttpContext* context, NSError* error);

/**
* Updates a glossary's config
* @param    glossaryId    Required parameter: Your glossary ID
*/
- (void) updateGlossariesAsyncWithGlossaryId:(NSString*) glossaryId
                completionBlock:(CompletedPutGlossaries) onCompleted;

/**
* Completion block definition for asynchronous call to glossaries */
typedef void (^CompletedGetGlossaries)(BOOL success, HttpContext* context, id response, NSError* error);

/**
* Downloads a glossary
* @param    glossaryId    Required parameter: Your glossary ID
*/
- (void) getGlossariesAsyncWithGlossaryId:(NSString*) glossaryId
                completionBlock:(CompletedGetGlossaries) onCompleted;

/**
* Completion block definition for asynchronous call to glossaries */
typedef void (^CompletedGetGlossaries)(BOOL success, HttpContext* context, id response, NSError* error);

/**
* Gets a glossary
* @param    glossaryId    Required parameter: Your glossary ID
*/
- (void) getGlossariesAsyncWithGlossaryId:(NSString*) glossaryId
                completionBlock:(CompletedGetGlossaries) onCompleted;

/**
* Completion block definition for asynchronous call to glossaries */
typedef void (^CompletedGetGlossaries)(BOOL success, HttpContext* context, id response, NSError* error);

/**
* Gets project glossaries
* @param    languageId    Required parameter: Your language ID
* @param    projectId    Required parameter: Your project ID
*/
- (void) getGlossariesAsyncWithLanguageId:(NSString*) languageId
                projectId:(NSString*) projectId
                completionBlock:(CompletedGetGlossaries) onCompleted;

/**
* Completion block definition for asynchronous call to glossaries */
typedef void (^CompletedPostGlossaries)(BOOL success, HttpContext* context, NSError* error);

/**
* Posts glossary term
*/
- (void) createGlossariesWithCompletionBlock:(CompletedPostGlossaries) onCompleted;

/**
* Completion block definition for asynchronous call to glossaries */
typedef void (^CompletedGetGlossaries)(BOOL success, HttpContext* context, id response, NSError* error);

/**
* Gets glossary term
* @param    glossaryId    Required parameter: Your glossary ID
* @param    mid    Required parameter: Your glossary term ID
*/
- (void) getGlossariesAsyncWithGlossaryId:(NSString*) glossaryId
                mid:(NSString*) mid
                completionBlock:(CompletedGetGlossaries) onCompleted;

/**
* Completion block definition for asynchronous call to glossaries */
typedef void (^CompletedPutGlossaries)(BOOL success, HttpContext* context, NSError* error);

/**
* Updates glossary term
* @param    glossaryId    Required parameter: Your glossary ID
* @param    mid    Required parameter: Your glossary term ID
*/
- (void) updateGlossariesAsyncWithGlossaryId:(NSString*) glossaryId
                mid:(NSString*) mid
                completionBlock:(CompletedPutGlossaries) onCompleted;

/**
* Completion block definition for asynchronous call to glossaries */
typedef void (^CompletedDeleteGlossaries)(BOOL success, HttpContext* context, NSError* error);

/**
* Deletes glossary term
* @param    glossaryId    Required parameter: Your glossary ID
* @param    mid    Required parameter: Your glossary term ID
*/
- (void) deleteGlossariesAsyncWithGlossaryId:(NSString*) glossaryId
                mid:(NSString*) mid
                completionBlock:(CompletedDeleteGlossaries) onCompleted;

/**
* Completion block definition for asynchronous call to languages */
typedef void (^CompletedGetLanguages)(BOOL success, HttpContext* context, id response, NSError* error);

/**
* Gets languages
*/
- (void) getLanguagesWithCompletionBlock:(CompletedGetLanguages) onCompleted;

/**
* Completion block definition for asynchronous call to languages */
typedef void (^CompletedGetLanguages)(BOOL success, HttpContext* context, id response, NSError* error);

/**
* Gets countries
*/
- (void) getLanguagesWithCompletionBlock:(CompletedGetLanguages) onCompleted;

/**
* Completion block definition for asynchronous call to regextemplates */
typedef void (^CompletedGetRegextemplates)(BOOL success, HttpContext* context, id response, NSError* error);

/**
* Gets regex templates
*/
- (void) getRegextemplatesWithCompletionBlock:(CompletedGetRegextemplates) onCompleted;

@end