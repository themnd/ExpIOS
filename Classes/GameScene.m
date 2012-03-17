//
//  GameScene.m
//  ExpIOS
//
//  Created by Marco Nova on 17/3/12.
//  Copyright 2012 Atex Global Media SpA. All rights reserved.
//

#import "GameScene.h"

#import "Background.h"
#import "Status.h"
#import "GameLayer.h"
#import "MenuScene.h"
#import "EventNames.h"

@implementation GameScene

+(CCScene *) scene
{
    // 'scene' is an autorelease object.
	GameScene *scene = [GameScene node];
	
	// return the scene
	return (CCScene*)scene;    
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init]))
    {
        Background *layer = [[Background alloc] init];
        [self addChild: [layer retain]];
        
        GameLayer* gameLayer = [[GameLayer alloc] init];
        [self addChild: [gameLayer retain]];
        
        Status* statusLayer = [[Status alloc] init];
        [self addChild: [statusLayer retain]];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onSettingsClicked:) name:SETTINGS_CLICKED_EVENTMSG object:nil];
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
	// don't forget to call "super dealloc"
	[super dealloc];
}

- (void) onSettingsClicked: (NSNotification *)notification
{
    NSLog(@"Settings clicked!");
    [[CCDirector sharedDirector] replaceScene:[MenuScene scene]];
}


@end
