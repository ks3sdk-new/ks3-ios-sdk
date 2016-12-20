//
//  KSS3HeadBucketRequest.m
//  KS3YunSDK
//
//  Created by Blues on 12/18/14.
//  Copyright (c) 2014 kingsoft. All rights reserved.
//

#import "KS3HeadBucketRequest.h"
#import "KS3Constants.h"
#import "KS3Client.h"
@implementation KS3HeadBucketRequest
- (instancetype)initWithName:(NSString *)bucketName
{
    self = [super init];
    if (self) {
        self.bucket = [self URLEncodedString:bucketName];
        self.httpMethod = kHttpMethodHead;
        self.contentMd5 = @"";
        self.contentType = @"";
        self.kSYHeader = @"";
        self.kSYResource = [NSString stringWithFormat:@"/%@/", self.bucket];
        self.host = [[KS3Client initialize] getBaseHost:self.bucket];
    }
    return self;
}

@end
