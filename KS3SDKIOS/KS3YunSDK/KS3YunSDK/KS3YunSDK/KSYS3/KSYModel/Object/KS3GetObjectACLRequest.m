//
//  KSS3GetObjectACLRequest.m
//  KS3SDK
//
//  Created by JackWong on 12/15/14.
//  Copyright (c) 2014 kingsoft. All rights reserved.
//

#import "KS3GetObjectACLRequest.h"
#import "KS3Constants.h"
#import "KS3Client.h"
@implementation KS3GetObjectACLRequest

- (instancetype)initWithName:(NSString *)bucketName withKeyName:(NSString *)strKey
{
    self = [super init];
    if (self) {
        self.bucket = [self URLEncodedString:bucketName];
        self.key = [self URLEncodedString:strKey];
        self.httpMethod = kHttpMethodGet;
        self.contentMd5 = @"";
        self.contentType = @"";
        self.kSYHeader = @"";
        self.kSYResource = [NSString stringWithFormat:@"/%@", self.bucket];
        self.host = [[KS3Client initialize] getBaseHost:self.bucket];
        
        //
        self.kSYResource = [NSString stringWithFormat:@"%@/%@?acl",self.kSYResource,_key];
        self.host = [NSString stringWithFormat:@"%@/%@?acl",self.host,_key];
    }
    return self;
}

- (KS3URLRequest *)configureURLRequest
{
    [super configureURLRequest];
    return self.urlRequest;
}
@end
