//
//  Shot.m
//  ExpIOS
//
//  Created by Marco Nova on 15/3/12.
//  Copyright 2012 Atex Global Media SpA. All rights reserved.
//

#import "Shot.h"


@implementation Shot

@synthesize distanceMoved, velocity, expired;

- (id)initWithTexture:(CCTexture2D *)texture rect:(CGRect)rect
{
	if ((self = [super initWithTexture:texture rect:rect]))
	{
		// Schedule update for this object
		[self scheduleUpdate];
        
		// Initialize the distance the bullet has moved
		distanceMoved = 0;
	}
	return self;
}

- (void)update:(ccTime *)dt
{
	// Get window size
	CGSize windowSize = [CCDirector sharedDirector].winSize;
    
	// Move
	[self setPosition:ccp(self.position.x + velocity.x, self.position.y + velocity.y)];
    
	// Increment the distance moved by the velocity vector
	distanceMoved += sqrt(pow(velocity.x, 2) + pow(velocity.y, 2));
    
	// If object moves off the bounds of the screen, make it appear on the other size
	if (self.position.x < 0) {
        velocity.x = velocity.x * -1;
        [self setPosition:ccp(self.position.x + velocity.x * 2, self.position.y)];
    } else if (self.position.x > windowSize.width) {
        velocity.x = velocity.x * -1;
        [self setPosition:ccp(self.position.x + velocity.x * 2, self.position.y)];
    }
    
	if (self.position.y < 0) {
        expired = TRUE;
	} else if (self.position.y > windowSize.height) {
        expired = TRUE;
    }
}

@end
