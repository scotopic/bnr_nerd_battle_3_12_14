//
//  BNRCanvasViewController.h
//  BigNerdsPaint
//
//  Created by Hiedi Utley on 3/13/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyLineDrawingView.h"

@interface BNRCanvasViewController : UIViewController {
        MyLineDrawingView *drawScreen;
}
@property (nonatomic, assign)int numberInDocs;

@end
