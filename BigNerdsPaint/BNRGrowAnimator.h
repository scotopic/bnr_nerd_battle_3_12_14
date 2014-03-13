//
//  BNRGrowAnimator.h
//  BigNerdsPaint
//
//  Created by Hiedi Utley on 3/13/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRGrowAnimator : NSObject  <UIViewControllerAnimatedTransitioning>

@property (nonatomic, strong) UICollectionViewCell* startingCell;

@end
