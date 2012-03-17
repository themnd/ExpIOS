//
//  BaseGameLayer.m
//  ExpIOS
//
//  Created by Marco Nova on 17/3/12.
//  Copyright 2012 Atex Global Media SpA. All rights reserved.
//

#import "BaseGameLayer.h"


@implementation BaseGameLayer

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init]))
    {    
//        [self setIsTouchEnabled:YES];        
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
    
	// don't forget to call "super dealloc"
	[super dealloc];
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	// This method is passed an NSSet of touches called (of course) "touches"
	// The "allObjects" method returns an NSArray of all the objects in the set
	NSArray *touchArray = [touches allObjects];
    
	// Only run the following code if there is more than one touch
	if ([touchArray count] > 0)
	{
		// Create "UITouch" objects representing each touch
		UITouch *fingerOne = [touchArray objectAtIndex:0];
        
		// Convert each UITouch object to a CGPoint, which has x/y coordinates we can actually use
		CGPoint pointOne = [fingerOne locationInView:[fingerOne view]];
        
		// The touch points are always in "portrait" coordinates - convert to landscape
		pointOne = [[CCDirector sharedDirector] convertToGL:pointOne];
        
		// We store the starting point of the touch so we can determine whether the touch is a swipe or tap.
		// A tap shouldn't move, so we compare the distance of the starting/ending touches, and if the distance is
		// small enough (we account for a bit of movement, just in case), the input is considered a tap
		startTouchPoint = pointOne;        
	}
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{    
	// Get array of touch objects
	NSArray *touchArray = [touches allObjects];
    
	// Only run this if there's one touch
	if ([touchArray count] == 1)
	{
		// Create "UITouch" objects representing each touch
		UITouch *fingerOne = [touchArray objectAtIndex:0];
        
		// Convert each UITouch object to a CGPoint, which has x/y coordinates we can actually use
		CGPoint pointOne = [fingerOne locationInView:[fingerOne view]];
        
		// The touch points are always iin "portrait" coordinates - convert to landscape
		pointOne = [[CCDirector sharedDirector] convertToGL:pointOne];
        
		// Set the variable that stores the ending touch point
		endTouchPoint = pointOne;
        
		// Get the distance that the user's finger moved during this touch
		float distance = sqrt(pow(endTouchPoint.x - startTouchPoint.x, 2) + pow(endTouchPoint.y - startTouchPoint.y, 2));
        
		// If the distance moved (in pixels) is small enough, consider the gesture a tap
		if (distance < 5)
		{
            [self doShot:startTouchPoint];
		}
		// Otherwise, it's a swipe
		else
		{
            [self doSwipe: startTouchPoint withEndPoint: endTouchPoint withDistance: distance];
		}
        
	}
}

- (void) doShot: (CGPoint) point
{
}

- (void) doSwipe: (CGPoint) startPoint withEndPoint:(CGPoint) endPoint withDistance:(float) distance
{
}

@end
