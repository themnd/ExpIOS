//
//  MenuScene.m
//  ExpIOS
//
//  Created by Marco Nova on 17/3/12.
//  Copyright 2012 Atex Global Media SpA. All rights reserved.
//

#import "MenuScene.h"
#import "GameScene.h"

@implementation MenuScene

+(CCScene *) scene
{
    // 'scene' is an autorelease object.
	MenuScene *scene = [MenuScene node];
	
	// return the scene
	return scene;
}

- (id) init
{
    if ((self=[super init]))
    {
        CCMenuItem* menuItem1 = [CCMenuItemFont itemFromString:@"Play" target:self selector:@selector(onPlay:)];
        CCMenuItem* menuItem2 = [CCMenuItemFont itemFromString:@"Settings" target:self selector:@selector(onSettings:)];
        CCMenuItem* menuItem3 = [CCMenuItemFont itemFromString:@"About" target:self selector:@selector(onAbout:)];
        
        CCMenu* menu = [CCMenu menuWithItems:menuItem1, menuItem2, menuItem3, nil];
        [menu alignItemsVertically];
        [self addChild:menu];
    }
    return self;
}

- (void)onPlay: (id)sender
{
    NSLog(@"on play");
    [[CCDirector sharedDirector] replaceScene:[GameScene scene]];
}

- (void)onSettings: (id)sender
{
    NSLog(@"on settings");
    //    [[Director sharedDirector] replaceScene:[SettingsScene node]];
}

- (void)onAbout: (id)sender
{
    NSLog(@"on about");
    //    [[Director sharedDirector] replaceScene:[AboutScene node]];
}

@end
