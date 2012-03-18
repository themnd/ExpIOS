//
//  AboutScene.m
//  ExpIOS
//
//  Created by Marco Nova on 17/3/12.
//  Copyright 2012 Atex Global Media SpA. All rights reserved.
//

#import "AboutScene.h"
#import "MenuScene.h"


@implementation AboutScene

+(CCScene *) scene
{
    // 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
    
    AboutScene* layer = [[AboutScene alloc] init];
    [scene addChild:[layer retain]];
	
	// return the scene
	return scene;    
}

- (id) init
{
    // always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init]))
    {
        [self setIsTouchEnabled:YES];

        CGSize size = [[CCDirector sharedDirector] winSize];
        CCSprite* aboutimg = [CCSprite spriteWithFile:@"about.png"];
        aboutimg.position = ccp(size.width / 2, size.height / 2);
        [self addChild:aboutimg];
    }
    return self;
}

- (void) doShot: (CGPoint) point
{
    [[CCDirector sharedDirector] replaceScene:[MenuScene scene]];
}

@end
