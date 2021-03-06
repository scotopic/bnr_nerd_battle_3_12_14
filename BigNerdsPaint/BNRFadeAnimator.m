//
//  BNRFadeAnimator.m
//  BigNerdsPaint
//
//  Created by Hiedi Utley on 3/13/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRFadeAnimator.h"

@implementation BNRFadeAnimator


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
    
    UIView *snapshot = [toView snapshotViewAfterScreenUpdates:YES];
    [snapshot setAlpha:0.0];
    
    // Add the snapshot!
    [container addSubview:snapshot];
    [UIView animateWithDuration:1.0
                     animations:^(){
                         [snapshot setAlpha:1.0];
                     } completion:^ (BOOL finished) {
                         if ([transitionContext transitionWasCancelled]) {
                             [snapshot removeFromSuperview];
                             [transitionContext completeTransition:NO];
                             return;
                         }
                         // Demo: Important to add this
                         [container addSubview:toView];
                         
                         [transitionContext completeTransition:YES];
                     }];
}



@end
