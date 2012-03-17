//
//  Status.m
//  Experiment
//
//  Created by Marco Nova on 15/3/12.
//  Copyright 2012 Atex Global Media SpA. All rights reserved.
//

#import "Status.h"
#import "Shot.h"

@implementation Status

@synthesize isAmiciShown;

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init]))
    {    
        [self setIsTouchEnabled:YES];
        
        // Schedule update for this object
		[self scheduleUpdate];

		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
        int width = size.width;
        int height = 32;

        CCLayerColor* cLayer = [[CCLayerColor alloc] initWithColor:ccc4(0x00, 0x00, 0x00, 0x90) width:width height:height];
        cLayer.position = ccp(0, size.height - height);
        [self addChild: cLayer];

        [self setAmiciVisible:YES];
        
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
    
    if (isAmiciShown == NO) {
        [amici release];
        amici = nil;
        [amiciLabel release];
        amiciLabel = nil;
    }
    
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
        
		// Only run the following code if there is more than one touch
		if ([touchArray count] > 1)
		{
			// Create "UITouch" objects representing each touch
			UITouch *fingerTwo = [touchArray objectAtIndex:1];
            
			// Convert each UITouch object to a CGPoint, which has x/y coordinates we can actually use
			CGPoint pointTwo = [fingerTwo locationInView:[fingerTwo view]];
            
			// The touch points are always in "portrait" coordinates - convert to landscape
			pointTwo = [[CCDirector sharedDirector] convertToGL:pointTwo];
            
			// Initialize the variables used to store the angle of rotation derived from the user's fingers
			currentTouchAngle = previousTouchAngle = CC_RADIANS_TO_DEGREES(atan2(pointOne.x - pointTwo.x, pointOne.y - pointTwo.y));
		}
	}
}

- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	// This method is passed an NSSet of touches called (of course) "touches"
	// "allObjects" returns an NSArray of all the objects in the set
	NSArray *touchArray = [touches allObjects];
    
	// Only run the following code if there is more than one touch
	if ([touchArray count] > 1)
	{
		// We're going to track the first two touches (i.e. first two fingers)
		// Create "UITouch" objects representing each touch
		UITouch *fingerOne = [touchArray objectAtIndex:0];
		UITouch *fingerTwo = [touchArray objectAtIndex:1];
        
		// Convert each UITouch object to a CGPoint, which has x/y coordinates we can actually use
		CGPoint pointOne = [fingerOne locationInView:[fingerOne view]];
		CGPoint pointTwo = [fingerTwo locationInView:[fingerTwo view]];
        
		// The touch points are always in "portrait" coordinates - you will need to convert them if in landscape (which we are)
		pointOne = [[CCDirector sharedDirector] convertToGL:pointOne];
		pointTwo = [[CCDirector sharedDirector] convertToGL:pointTwo];
        
		// Get the angle that's created by the user's two fingers - see http://en.wikipedia.org/wiki/Atan2
		currentTouchAngle = CC_RADIANS_TO_DEGREES(atan2(pointOne.x - pointTwo.x, pointOne.y - pointTwo.y));
        
		// Compare with the previous angle, to decide whether the change is positive or negative.
		float difference = currentTouchAngle - previousTouchAngle;
        
		// The ship is then rotated by that difference
		//ship.rotation += difference;
        
		// Store the current angle variable to be used again on the next loop iteration
		previousTouchAngle = currentTouchAngle;
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
			NSLog(@"Shoot!");
            [self setAmiciVisible:(self.isAmiciShown ? NO : YES)];
		}
		// Otherwise, it's a swipe
		else
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
            
            currentTouchAngle = CC_RADIANS_TO_DEGREES(atan2(velX, velY));

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
        
	}
}

- (void) setAmiciVisible: (BOOL) visible
{
    if (visible == YES) {
        int offX = 50;
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        amici = [CCSprite spriteWithFile:@"amici.png"];
        amici.position = ccp(offX, size.height - 16);
        [self addChild:amici];
        
        // create and initialize a Label
        amiciLabel = [CCLabelTTF labelWithString:@"Amici" fontName:@"Courier" fontSize:14];
        amiciLabel.position = ccp(offX + amici.contentSize.width + 20, size.height - 16);
        [self addChild:amiciLabel];
    } else {
        [self removeChild:amici cleanup: YES];
        [self removeChild:amiciLabel cleanup: YES];
    }
        
    self.isAmiciShown = visible;
}

@end
