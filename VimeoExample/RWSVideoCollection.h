//
//  RWSVideoCollection.h
//  VimeoExample
//
//  Created by Samuel Goodwin on 03-01-14.
//  Copyright (c) 2014 Roundwall Software. All rights reserved.
//

@class RWSVideo;

extern NSString *const RWSVideoObservationKey;

@interface RWSVideoCollection : NSObject

- (NSUInteger)videoCount;
- (RWSVideo *)videoAtIndexPath:(NSIndexPath *)indexPath;

@end
