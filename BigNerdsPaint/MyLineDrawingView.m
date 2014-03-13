//
//  MyLineDrawingView.m
//  DrawLines
//
//  Created by Reetu Raj on 11/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyLineDrawingView.h"


@implementation MyLineDrawingView
@synthesize undoSteps;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
                

        pathArray=[[NSMutableArray alloc]init];
        bufferArray=[[NSMutableArray alloc]init];
        
        self.fireView = [[DWFParticleView alloc] initWithFrame:frame];
        self.smokeView=[[SmokeView alloc] initWithFrame:frame];
        [self addSubview:self.fireView];
        [self addSubview:self.smokeView];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
//    [[UIColor redColor] setStroke];
//    [[self.drawingColor] setStroke];
    
    if (self.drawingColor) {
        [self.drawingColor setStroke];
    } else {
      [[UIColor whiteColor] setStroke];
    }
    
    
    for (UIBezierPath *_path in pathArray) {
        [_path strokeWithBlendMode:kCGBlendModeNormal alpha:1.0];
    }


}

#pragma mark - Touch Methods
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    myPath=[[UIBezierPath alloc]init];
    myPath.lineWidth=10;
    
    UITouch *mytouch=[[touches allObjects] objectAtIndex:0];
    [myPath moveToPoint:[mytouch locationInView:self]];
    
    // attach CGPath to UIbezierPath
    
    [pathArray addObject:myPath];
    if (emitterIsOn) {
        [self.smokeView setEmitterPositionFromTouch:[touches anyObject]];
        [self.smokeView setIsEmitting:YES];
        [self.fireView setEmitterPositionFromTouch:[touches anyObject]];
        [self.fireView setIsEmitting:YES];
    }
    
    
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *mytouch=[[touches allObjects] objectAtIndex:0];
    [myPath addLineToPoint:[mytouch locationInView:self]];
    if (emitterIsOn) {
        [self.smokeView setEmitterPositionFromTouch:[touches anyObject]];
        [self.fireView setEmitterPositionFromTouch: [touches anyObject]];
    }
    
    [self setNeedsDisplay];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.smokeView setIsEmitting:NO];
    [self.fireView setIsEmitting:NO];
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.smokeView setIsEmitting:NO];
    [self.fireView setIsEmitting:NO];
}
-(void)switchEmitter{
    emitterIsOn=!emitterIsOn;
}
-(void)undoButtonClicked
{
    
    
    
    if([pathArray count]>0){
    UIBezierPath *_path=[pathArray lastObject];
    [bufferArray addObject:_path];
    [pathArray removeLastObject];
    [self setNeedsDisplay];
    }
    
}

-(void)redoButtonClicked
{

    
    
    if([bufferArray count]>0){
        UIBezierPath *_path=[bufferArray lastObject];
        [pathArray addObject:_path];
        [bufferArray removeLastObject];
        [self setNeedsDisplay];
    }
    
    
}


@end
