//
//  GameScene.h
//  ExpIOS
//
//  Created by Marco Nova on 17/3/12.
//  Copyright 2012 Atex Global Media SpA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface GameScene : CCLayer {

}

+(CCScene *) scene;

- (id) init;
- (void) dealloc;
- (void) onSettingsClicked: (NSNotification *)notification;

@end
