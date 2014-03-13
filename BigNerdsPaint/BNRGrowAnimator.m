//
//  BNRFadeAnimator.m
//  BigNerdsPaint
//
//  Created by Hiedi Utley on 3/13/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRGrowAnimator.h"

@implementation BNRGrowAnimator



#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.0;
}


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *container = transitionContext.containerView;
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toVC.view;
    
    UICollectionViewCell* cell = self.startingCell;
    UIView *snapshot = [cell snapshotViewAfterScreenUpdates:YES];
    [container addSubview:snapshot];
    snapshot.frame = [container convertRect:cell.bounds fromView:cell];
    
    [UIView animateWithDuration:0.5
                     animations:^(){
                         snapshot.frame = container.bounds;
                     } completion:^ (BOOL finished) {
                         if ([transitionContext transitionWasCancelled]) {
                             [snapshot removeFromSuperview];
                             [transitionContext completeTransition:NO];
                             return;
                         }
                         [container addSubview:toView];
                         
                         [transitionContext completeTransition:YES];
                     }];
}


@end
