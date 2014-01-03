//
//  RWSVideo.h
//  VimeoExample
//
//  Created by Samuel Goodwin on 03-01-14.
//

#import <Foundation/Foundation.h>

@interface RWSVideo : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *descriptionString;
@property (nonatomic, copy) NSDate *uploadDate;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, strong) NSURL *thumbnailURL;
@property (nonatomic, strong) NSURL *avatarURL;

+ (instancetype)videoFromDictionary:(NSDictionary *)dictionary;
@end
