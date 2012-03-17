//
//  Status.m
//  Experiment
//
//  Created by Marco Nova on 15/3/12.
//  Copyright 2012 Atex Global Media SpA. All rights reserved.
//

#import "Status.h"
#import "Shot.h"
#import "EventNames.h"

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
        
		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
        int width = size.width;
        int height = 32;
        
        CCLayerColor* cLayer = [[CCLayerColor alloc] initWithColor:ccc4(0x00, 0x00, 0x00, 0x90) width:width height:height];
        cLayer.position = ccp(0, size.height - height);
        [self addChild: cLayer];
        
        [self setAmiciVisible:YES];
        [self showSettings:YES];
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
    
    if (settings) {
        [settings release];
        settings = nil;
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

- (void) showSettings: (BOOL) visible
{
    if (visible == YES) {
        CGSize size = [[CCDirector sharedDirector] winSize];
        settings = [CCSprite spriteWithFile:@"pref32.png"];
        settings.position = ccp(size.width - settings.contentSize.width, size.height - 16);
        [self addChild:settings];
    } else {
        [self removeChild:settings cleanup: YES];
        settings = nil;
    }
}

- (void) doShot: (CGPoint) point
{
    NSLog(@"Shoot!");
    //BOOL show = (self.isAmiciShown ? NO : YES);
    //[self setAmiciVisible:show];
    //[self showSettings:show];
    
    NSLog(@"Shot poistion %f, %f", point.x, point.y);
    
    if ([Status hitTest: settings withPoint: point]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:SETTINGS_CLICKED_EVENTMSG object:self];
    }

}

+ (bool) hitTest: (CCSprite*) s withPoint: (CGPoint) pt
{
    return CGRectContainsPoint(s.boundingBox, pt);
}

@end
