//
//  BNRGalleryLayout.m
//  BigNerdsPaint
//
//  Created by Hiedi Utley on 3/13/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRGalleryLayout.h"

@implementation BNRGalleryLayout

- (id)init
{
    self = [super init];
    if (self) {
        // Set up our basic properties
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.itemSize = CGSizeMake(180, 180);
        self.minimumLineSpacing = 50;      // Gets items up close to one another
        self.minimumInteritemSpacing = 10; // Makes sure we only have 1 row of items in portrait mode
        self.sectionInset = UIEdgeInsetsMake(50, 50, 50, 50);
    }
    return self;
}

@end
