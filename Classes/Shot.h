//
//  Shot.h
//  ExpIOS
//
//  Created by Marco Nova on 15/3/12.
//  Copyright 2012 Atex Global Media SpA. All rights reserved.
//

#import "cocos2d.h"

@interface Shot : CCSprite
{
    float distanceMoved;
    CGPoint velocity;
    bool expired;
}

@property float distanceMoved;
@property CGPoint velocity;
@property bool expired;

- (id)initWithTexture:(CCTexture2D *)texture rect:(CGRect)rect;
- (void)update:(ccTime)dt;

@end
