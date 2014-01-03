//
//  RWSImageCache.h
//  VimeoExample
//
//  Created by Samuel Goodwin on 03-01-14.
//  Copyright (c) 2014 Roundwall Software. All rights reserved.
//

typedef void (^RWSImageBlock)(UIImage *image);

@interface RWSImageCache : NSObject

- (void)imageWithURL:(NSURL *)url withBlock:(RWSImageBlock)block;

@end
