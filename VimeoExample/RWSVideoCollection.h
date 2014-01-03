//
//  RWSVideoCollection.h
//  VimeoExample
//
//  Created by Samuel Goodwin on 03-01-14.
//

@class RWSVideo;

extern NSString *const RWSVideoObservationKey;

@interface RWSVideoCollection : NSObject

- (NSUInteger)videoCount;
- (RWSVideo *)videoAtIndexPath:(NSIndexPath *)indexPath;

@end
