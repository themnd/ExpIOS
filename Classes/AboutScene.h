//
//  AboutScene.h
//  ExpIOS
//
//  Created by Marco Nova on 17/3/12.
//  Copyright 2012 Atex Global Media SpA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "BaseGameLayer.h"

@interface AboutScene : BaseGameLayer {

}

+(CCScene *) scene;

- (id) init;
- (void) doShot: (CGPoint) point;

@end
