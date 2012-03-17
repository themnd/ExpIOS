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
        [self setAmiciVisible:YES];
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
    
	// don't forget to call "super dealloc"
	[super dealloc];
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

- (void) doShot: (CGPoint) point
{
    NSLog(@"Shoot!");
    [self setAmiciVisible:(self.isAmiciShown ? NO : YES)];
}

@end
