//
//  GameLayer.m
//  ExpIOS
//
//  Created by Marco Nova on 17/3/12.
//  Copyright 2012 Atex Global Media SpA. All rights reserved.
//

#import "GameLayer.h"
#import "Shot.h"

@implementation GameLayer

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init]))
    {
        [self setIsTouchEnabled:YES];
		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
        int width = size.width;
        int height = 32;
        
        CCLayerColor* cLayer = [[CCLayerColor alloc] initWithColor:ccc4(0x00, 0x00, 0x00, 0x90) width:width height:height];
        cLayer.position = ccp(0, size.height - height);
        [self addChild: cLayer];
        
        bullets = [[NSMutableArray array] retain];
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
    
    [bullets release];
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

- (void) update:(ccTime)dt
{
    for (Shot* s in bullets) {
        if (s.expired) {
            [bullets removeObject:s];
            [self removeChild:s cleanup:NO];
        }
    }
}

- (void) doSwipe: (CGPoint) startPoint withEndPoint:(CGPoint) endPoint withDistance:(float) distance
{
    Shot* s = [Shot spriteWithFile:@"pallone.png"];
    s.position = startTouchPoint;

    if (distance > 150) {
        distance = 150;
    }
    if (distance < 50) {
        distance = 50;
    }

    int velX = endTouchPoint.x - startTouchPoint.x;
    int velY = endTouchPoint.y - startTouchPoint.y;

    float currentTouchAngle = CC_RADIANS_TO_DEGREES(atan2(velX, velY));

    NSLog(@"velX %d  velY %d angle %f", velX, velY, currentTouchAngle);

    if (currentTouchAngle < -60) {
        currentTouchAngle = -60;
    } else if (currentTouchAngle > 60) {
        currentTouchAngle = 60;
    }

    s.velocity = ccp(sin(CC_DEGREES_TO_RADIANS(currentTouchAngle)) * (distance / 10), cos(CC_DEGREES_TO_RADIANS(currentTouchAngle)) * (distance / 10));

    NSLog(@"velocity %f %f", s.velocity.x, s.velocity.y);

    [bullets addObject:s];
    [self addChild:s];
}

@end
