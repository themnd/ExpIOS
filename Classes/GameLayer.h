//
//  GameLayer.h
//  ExpIOS
//
//  Created by Marco Nova on 17/3/12.
//  Copyright 2012 Atex Global Media SpA. All rights reserved.
//

#import "cocos2d.h"
#import "BaseGameLayer.h"

@interface GameLayer : BaseGameLayer {

    NSMutableArray *bullets;    
}

- (void)update:(ccTime)dt;
- (void) doSwipe: (CGPoint) startPoint withEndPoint:(CGPoint) endPoint withDistance:(float) distance;

@end
