//
//  BaseGameLayer.h
//  ExpIOS
//
//  Created by Marco Nova on 17/3/12.
//  Copyright 2012 Atex Global Media SpA. All rights reserved.
//

#import "cocos2d.h"

@interface BaseGameLayer : CCLayer {
    
    CGPoint startTouchPoint;
    CGPoint endTouchPoint;

}

- (id) init;
- (void) dealloc;

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;

- (void) doShot: (CGPoint) point;
- (void) doSwipe: (CGPoint) startPoint withEndPoint:(CGPoint) endPoint withDistance:(float) distance;


@end
