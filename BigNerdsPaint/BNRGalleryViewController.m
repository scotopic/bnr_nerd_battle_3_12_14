//
//  BNRGalleryViewController.m
//  BigNerdsPaint
//
//  Created by Hiedi Utley on 3/13/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRGalleryViewController.h"
#import "BNRCanvasViewController.h"
#import "BNRGalleryLayout.h"
#import "BNRFadeAnimator.h"
#import "BNRGrowAnimator.h"

@interface BNRGalleryViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIViewControllerTransitioningDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) IBOutlet UICollectionView* collectionView;
@property (nonatomic, strong) UICollectionViewLayout*    layout;
@property (nonatomic, strong) id<UIViewControllerAnimatedTransitioning> transitionAnimation;

@end


@implementation BNRGalleryViewController

- (id) init
{
    return [self initWithNibName:nil bundle:nil];
}

- (id) initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.layout = [[BNRGalleryLayout alloc] init];
    }
    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
//    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"gridCell"];
    self.title = @"Big Nerd Gallery";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(handleNewPainting:)];

    [self.collectionView.collectionViewLayout invalidateLayout];
    [self.collectionView setCollectionViewLayout:self.layout animated:YES];
    self.navigationController.delegate = self;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}

- (IBAction) handleNewPainting:(id)sender
{
    self.transitionAnimation = nil;
    [self.navigationController pushViewController:[[BNRCanvasViewController alloc] init] animated:YES];
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger) collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1000;
}

- (UICollectionViewCell*) collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath
{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"gridCell" forIndexPath:indexPath];

    if (!cell)
    {
        cell = [[UICollectionViewCell alloc] init];
    }
    // DEMO: get a nice color palette so we have unique cells
    UIColor* color = [UIColor colorWithRed:(((int)cell >> 0) & 0xFF) / 255.0
                                     green:(((int)cell >> 8) & 0xFF) / 255.0
                                      blue:(((int)cell >> 16) & 0xFF) / 255.0
                                     alpha:1.0];
    [cell setBackgroundColor:color];

    return cell;
}

- (void) collectionView:(UICollectionView*)collectionView didSelectItemAtIndexPath:(NSIndexPath*)indexPath
{
    self.transitionAnimation = [[BNRGrowAnimator alloc] init];

    NSIndexPath *selected = self.collectionView.indexPathsForSelectedItems[0];
	UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:selected];

    [(BNRGrowAnimator*)[self transitionAnimation] setStartingCell:cell];
    UIViewController* toVC = [[BNRCanvasViewController alloc] init];
    UIColor* color = [[collectionView cellForItemAtIndexPath:indexPath] backgroundColor];
    [toVC.view setBackgroundColor:color];
    toVC.transitioningDelegate = self;
    [self.navigationController pushViewController:toVC animated:YES];
}

#pragma mark - UINavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>) navigationController:(UINavigationController*)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController*)fromVC
                                                  toViewController:(UIViewController*)toVC
{
    if (![self.navigationController.topViewController isKindOfClass:self.class])
    {
        return self.transitionAnimation;
    }
    return nil;
}

- (void) navigationController:(UINavigationController*)navigationController didShowViewController:(UIViewController*)viewController animated:(BOOL)animated
{
    return;
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>) animationControllerForPresentedController:(UIViewController*)presented
                                                                   presentingController:(UIViewController*)presenting
                                                                       sourceController:(UIViewController*)source
{
    if (![self.navigationController.topViewController isKindOfClass:self.class])
    {
        return self.transitionAnimation;
    }
    return nil;
}

- (id<UIViewControllerAnimatedTransitioning>) animationControllerForDismissedController:(UIViewController*)dismissed
{
    return nil;
}

@end
