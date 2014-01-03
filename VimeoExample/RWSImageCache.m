//
//  RWSImageCache.m
//  VimeoExample
//
//  Created by Samuel Goodwin on 03-01-14.
//  Copyright (c) 2014 Roundwall Software. All rights reserved.
//

#import "RWSImageCache.h"

@interface RWSImageCache()
@property (nonatomic, strong) NSCache *imageCache;
@property (nonatomic, strong) NSURLSession *session;
@end

@implementation RWSImageCache

- (id)init
{
    self = [super init];
    if(self){
        self.imageCache = [[NSCache alloc] init];
        self.session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    }
    return self;
}

- (void)imageWithURL:(NSURL *)url withBlock:(RWSImageBlock)block
{
    UIImage *image = [self.imageCache objectForKey:url];
    if(image){
        return dispatch_async(dispatch_get_main_queue(), ^{
            block(image);
        });
    }

    NSURLSessionDataTask *task = [self.session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if([(NSHTTPURLResponse*)response statusCode] != 200){
            return;
        }

        UIImage *image = [UIImage imageWithData:data];
        NSParameterAssert(image);

        [self.imageCache setObject:image forKey:url];

        dispatch_async(dispatch_get_main_queue(), ^{
            block(image);
        });
    }];
    [task resume];
}

@end
