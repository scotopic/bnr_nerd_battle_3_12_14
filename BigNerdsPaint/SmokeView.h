//
//  SmokeView.h
//  everscore-v2
//
//  Created by Danielle Watson on 2014-02-20.
//  Copyright (c) 2014 Music Quest. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface SmokeView : UIView
-(void)changeColour:(float)red green:(float)green blue:(float)blue;
-(void)setEmitterPositionFromTouch: (UITouch*)t;
-(void)setIsEmitting:(BOOL)isEmitting;
@end
