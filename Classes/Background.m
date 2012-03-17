//
//  Background.m
//  Untitled
//
//  Created by Marco Nova on 14/3/12.
//  Copyright 2012 Atex Global Media SpA. All rights reserved.
//

#import "Background.h"


@implementation Background

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
	
        CCSprite* bg = [CCSprite spriteWithFile:@"bg2.jpg"];
        int bgw = bg.contentSize.width;
        int bgh = bg.contentSize.height;
        [bg setPosition: CGPointMake(bgw / 2, bgh / 2) ];
        [self addChild:bg z:0];
        
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World 2" fontName:@"Marker Felt" fontSize:64];
        
		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
		[self addChild: label];
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


@end
