//
//  RWSViewController.m
//  VimeoExample
//
//  Created by Samuel Goodwin on 03-01-14.
//

#import "RWSViewController.h"
#import "RWSVideoCollection.h"
#import "RWSVideo.h"
#import "RWSVideoCell.h"
#import "RWSVideoDetailViewController.h"
#import "RWSImageCache.h"

@interface RWSViewController ()
@property (nonatomic, strong) RWSVideoCollection *collection;
@property (nonatomic, strong) RWSImageCache *imageCache;
@end

@implementation RWSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setupTableAppearance];

    self.collection = [[RWSVideoCollection alloc] init];
    [self.collection addObserver:self forKeyPath:RWSVideoObservationKey options:NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionNew context:nil];

    self.imageCache = [[RWSImageCache alloc] init];
}

- (void)setupTableAppearance
{
    CGFloat statusBarHeight = CGRectGetHeight([[UIApplication sharedApplication] statusBarFrame]);
    self.tableView.contentInset = UIEdgeInsetsMake(statusBarHeight, 0.0, statusBarHeight, 0.0);
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)dealloc
{
    [self.collection removeObserver:self forKeyPath:RWSVideoObservationKey];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.collection videoCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RWSVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"video" forIndexPath:indexPath];
    RWSVideo *video = [self.collection videoAtIndexPath:indexPath];

    cell.video = video;

    NSURL *url = video.thumbnailURL;
    [self.imageCache imageWithURL:url withBlock:^(UIImage *image) {
        RWSVideoCell *cellForImage = (RWSVideoCell *)[tableView cellForRowAtIndexPath:indexPath];

        [cellForImage setAvatarImage:image];
    }];

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    RWSVideoDetailViewController *controller = [segue destinationViewController];

    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    controller.video = [self.collection videoAtIndexPath:indexPath];
    controller.imageCache = self.imageCache;
}

@end
