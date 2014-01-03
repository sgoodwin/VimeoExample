//
//  RWSVideo.m
//  VimeoExample
//
//  Created by Samuel Goodwin on 03-01-14.
//

#import "RWSVideo.h"

@implementation RWSVideo

+ (NSDateFormatter *)dateFormatter
{
    static NSDateFormatter *formatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
        [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    });

    return formatter;
}

+ (instancetype)videoFromDictionary:(NSDictionary *)dictionary
{
    RWSVideo *video = [[self alloc] init];

    video.title = dictionary[@"title"];
    video.descriptionString = [dictionary[@"description"] stringByReplacingOccurrencesOfString:@"<br />" withString:@"\n"];
    video.uploadDate = [[self dateFormatter] dateFromString:dictionary[@"upload_date"]];
    video.username = dictionary[@"user_name"];
    video.thumbnailURL = [NSURL URLWithString:dictionary[@"thumbnail_medium"]];
    video.avatarURL = [NSURL URLWithString:dictionary[@"user_portrait_medium"]];

    return video;
}

@end
