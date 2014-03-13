//
//  MyLineDrawingView.h
//  DrawLines
//
//  Created by Reetu Raj on 11/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DWFParticleView.h"

@interface MyLineDrawingView : UIView {
 
    NSMutableArray *pathArray;
    NSMutableArray *bufferArray;
    UIBezierPath *myPath;
    BOOL emitterIsOn;

}
@property(nonatomic,assign) NSInteger undoSteps;
@property(nonatomic, strong) DWFParticleView* fireView;

-(void)undoButtonClicked;
-(void)redoButtonClicked;
-(void)switchEmitter;
@end
