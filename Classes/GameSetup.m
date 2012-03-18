//
//  GameSetup.m
//  ExpIOS
//
//  Created by Marco Nova on 17/3/12.
//  Copyright 2012 Atex Global Media SpA. All rights reserved.
//

#import "GameSetup.h"
#import "MenuScene.h"


@implementation GameSetup

+(CCScene *) scene
{
    // 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
    
    GameSetup* layer = [[GameSetup alloc] init];
    [scene addChild:[layer retain]];
	
	// return the scene
	return scene;
}

- (id) init
{
    if ((self=[super init]))
    {
        [self setIsTouchEnabled:YES];
//        CCMenuItem* menuItem1 = [CCMenuItemFont itemFromString:@"Play" target:self selector:@selector(onPlay:)];
//        CCMenuItem* menuItem2 = [CCMenuItemFont itemFromString:@"Settings" target:self selector:@selector(onSettings:)];
//        CCMenuItem* menuItem3 = [CCMenuItemFont itemFromString:@"About" target:self selector:@selector(onAbout:)];
//        
//        CCMenu* menu = [CCMenu menuWithItems:menuItem1, menuItem2, menuItem3, nil];
//        [menu alignItemsVertically];
//        [self addChild:menu];
    }
    return self;
}

- (void) doShot: (CGPoint) point
{
    [[CCDirector sharedDirector] replaceScene:[MenuScene scene]];
}

@end
