//
//  RWSVideoCell.h
//  VimeoExample
//
//  Created by Samuel Goodwin on 03-01-14.
//  Copyright (c) 2014 Roundwall Software. All rights reserved.
//

@class RWSVideo;

@interface RWSVideoCell : UITableViewCell

- (void)setVideo:(RWSVideo *)video;
- (void)setAvatarImage:(UIImage *)image;

@end
