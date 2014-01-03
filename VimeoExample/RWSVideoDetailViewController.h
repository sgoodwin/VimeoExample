//
//  RWSVideoDetailViewController.h
//  VimeoExample
//
//  Created by Samuel Goodwin on 03-01-14.
//  Copyright (c) 2014 Roundwall Software. All rights reserved.
//

@class RWSVideo;
@class RWSImageCache;

@interface RWSVideoDetailViewController : UIViewController
@property (nonatomic, strong) RWSVideo *video;
@property (nonatomic, strong) RWSImageCache *imageCache;
@end
