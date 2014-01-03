//
//  RWSVideoCollection.m
//  VimeoExample
//
//  Created by Samuel Goodwin on 03-01-14.
//  Copyright (c) 2014 Roundwall Software. All rights reserved.
//

#import "RWSVideoCollection.h"
#import "RWSVideo.h"

NSString *const RWSVideoObservationKey = @"videos";

@interface RWSVideoCollection()
@property (nonatomic, copy) NSArray *videos;
@property (nonatomic, strong) NSURLSession *session;
@end

@implementation RWSVideoCollection

- (id)init
{
    self = [super init];
    if(self){
        self.session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];

        NSURL *url = [NSURL URLWithString:@"http://vimeo.com/api/v2/album/58/videos.json"];
        NSURLSessionDataTask *task = [self.session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            NSParameterAssert(![NSThread isMainThread]);

            NSError *jsonError;
            NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

            NSMutableArray *videos = [NSMutableArray arrayWithCapacity:[json count]];
            for(NSDictionary *videoDictionary in json){
                [videos addObject:[RWSVideo videoFromDictionary:videoDictionary]];
            }

            dispatch_async(dispatch_get_main_queue(), ^{
                self.videos = videos;
            });
        }];

        [task resume];
    }
    return self;
}

- (NSUInteger)videoCount
{
    return [self.videos count];
}

- (RWSVideo *)videoAtIndexPath:(NSIndexPath *)indexPath
{
    return self.videos[indexPath.row];
}

@end
