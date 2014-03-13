//Created by Thomas Dimson
#import "SmokeView.h"
#import <QuartzCore/QuartzCore.h>

@implementation SmokeView {
    __weak CAEmitterLayer*smokeEmitter;
}
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initTheParticle];
    }
    return self;
}
- (void)initTheParticle
{
    smokeEmitter = (CAEmitterLayer*)self.layer;
    smokeEmitter.emitterPosition = CGPointMake(50, 50);
    smokeEmitter.emitterSize = CGSizeMake(10, 10);
    smokeEmitter.emitterShape = kCAEmitterLayerRectangle;
    
    CAEmitterCell*smokeCell = [CAEmitterCell emitterCell];
    smokeCell.contents = (__bridge id)[[UIImage imageNamed:@"SmokeParticle.png"] CGImage];
    [smokeCell setName:@"smokeCell"];
    
    smokeCell.birthRate = 150;
    smokeCell.lifetime = 1.0;
    smokeCell.lifetimeRange = 0.5;
    smokeCell.color = [[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1.0] CGColor];
    smokeCell.redRange = 0.46f;
    smokeCell.greenRange = 0.49f;
    smokeCell.blueRange = 0.67f;
    smokeCell.alphaRange = 0.55f;
    
    smokeCell.redSpeed = 0.11f;
    smokeCell.greenSpeed = 0.07f;
    smokeCell.blueSpeed = -0.25f;
    smokeCell.alphaSpeed = 0.15f;
    /*smokeCell.redRange = 1.0;
     smokeCell.redSpeed = 0.5;
     smokeCell.blueRange = 1.0;
     smokeCell.blueSpeed = 0.5;
     smokeCell.greenRange = 1.0;
     smokeCell.greenSpeed = 0.5;
     smokeCell.alphaSpeed = -0.2;
     */
    smokeCell.velocity = 50;
    smokeCell.velocityRange = 20;
    smokeCell.yAcceleration = -100;
    smokeCell.emissionLongitude = -M_PI / 2;
    smokeCell.emissionRange = M_PI / 4;
    
    smokeCell.scale = 1.0;
    smokeCell.scaleSpeed = 1.0;
    smokeCell.scaleRange = 1.0;
    
    smokeEmitter.emitterCells = [NSArray arrayWithObject:smokeCell];
}


-(void)changeColour:(float)red green:(float)green blue:(float)blue
{
    CAEmitterCell*smokeCell = [CAEmitterCell emitterCell];
    smokeCell.contents = (__bridge id)[[UIImage imageNamed:@"SmokeParticle.png"] CGImage];
    [smokeCell setName:@"smokeCell"];
    
    smokeCell.birthRate = 150;
    smokeCell.lifetime = 1.0;
    smokeCell.lifetimeRange = 0.5;
    smokeCell.color = [[UIColor colorWithRed:red green:green blue:blue alpha:1.0] CGColor];
    smokeCell.redRange = 0.46f;
    smokeCell.greenRange = 0.49f;
    smokeCell.blueRange = 0.67f;
    smokeCell.alphaRange = 0.55f;
    
    smokeCell.redSpeed = 0.11f;
    smokeCell.greenSpeed = 0.07f;
    smokeCell.blueSpeed = -0.25f;
    smokeCell.alphaSpeed = 0.15f;
    /*smokeCell.redRange = 1.0;
     smokeCell.redSpeed = 0.5;
     smokeCell.blueRange = 1.0;
     smokeCell.blueSpeed = 0.5;
     smokeCell.greenRange = 1.0;
     smokeCell.greenSpeed = 0.5;
     smokeCell.alphaSpeed = -0.2;
     */
    smokeCell.velocity = 50;
    smokeCell.velocityRange = 20;
    smokeCell.yAcceleration = -100;
    smokeCell.emissionLongitude = -M_PI / 2;
    smokeCell.emissionRange = M_PI / 4;
    
    smokeCell.scale = 1.0;
    smokeCell.scaleSpeed = 1.0;
    smokeCell.scaleRange = 1.0;
    
    smokeEmitter.emitterCells = [NSArray arrayWithObject:smokeCell];
}

+ (Class) layerClass {
    return [CAEmitterLayer class];
}

- (void) stopEmitting {
    smokeEmitter.birthRate = 0.0;
}

-(void)setEmitterPositionFromTouch: (UITouch*)t
{
    //change the emitter's position
    smokeEmitter.emitterPosition = [t locationInView:self];
}

-(void)setIsEmitting:(BOOL)isEmitting
{
    //turn on/off the emitting of particles
    [smokeEmitter setValue:[NSNumber numberWithInt:isEmitting?200:0] forKeyPath:@"emitterCells.smokeCell.birthRate"];
}


@end