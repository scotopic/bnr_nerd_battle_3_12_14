//
//  MyLineDrawingView.h
//  DrawLines
//
//  Created by Reetu Raj on 11/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DWFParticleView.h"
#import "SmokeView.h"
@class MyPath;

@interface MyLineDrawingView : UIView {
 
    NSMutableArray *pathArray;
    NSMutableArray *bufferArray;
    MyPath *myPath;
    BOOL emitterIsOn;

}
@property(nonatomic,assign) NSInteger undoSteps;
@property(nonatomic, strong) DWFParticleView* fireView;
@property(nonatomic, strong) SmokeView *smokeView;
@property(nonatomic, strong) UIColor *drawingColor;

-(void)undoButtonClicked;
-(void)redoButtonClicked;
-(void)switchEmitter;
@end
