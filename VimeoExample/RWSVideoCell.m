//
//  RWSVideoCell.m
//  VimeoExample
//
//  Created by Samuel Goodwin on 03-01-14.
//

#import "RWSVideoCell.h"
#import "RWSVideo.h"

@interface RWSVideoCell()
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *dateLabel;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailView;
@end

@implementation RWSVideoCell

- (void)prepareForReuse
{
    self.thumbnailView.image = nil;
    self.titleLabel.text = nil;
}

- (void)setVideo:(RWSVideo *)video
{
    self.titleLabel.text = [@[video.title, @"by", video.username] componentsJoinedByString:@" "];
    self.dateLabel.text = [NSDateFormatter localizedStringFromDate:video.uploadDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
}

- (void)setAvatarImage:(UIImage *)image
{
    self.thumbnailView.image = image;
}

@end
