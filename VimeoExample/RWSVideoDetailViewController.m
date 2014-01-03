//
//  RWSVideoDetailViewController.m
//  VimeoExample
//
//  Created by Samuel Goodwin on 03-01-14.
//

#import "RWSVideoDetailViewController.h"
#import "RWSVideo.h"
#import "RWSImageCache.h"

@interface RWSVideoDetailViewController ()
@property (nonatomic, weak) IBOutlet UILabel *usernameLabel;
@property (nonatomic, weak) IBOutlet UIImageView *avatarView;
@property (nonatomic, weak) IBOutlet UITextView *descriptionView;
@end

@implementation RWSVideoDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self updateUIForVideo];
}

- (void)updateUIForVideo
{
    self.title = self.video.title;
    self.descriptionView.text = self.video.descriptionString;
    self.usernameLabel.text = self.video.username;

    NSURL *url = self.video.avatarURL;
    [self.imageCache imageWithURL:url withBlock:^(UIImage *image) {
        self.avatarView.image = image;
    }];
}

@end
