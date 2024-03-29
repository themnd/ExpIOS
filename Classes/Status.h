//
//  Status.h
//  Experiment
//
//  Created by Marco Nova on 15/3/12.
//  Copyright 2012 Atex Global Media SpA. All rights reserved.
//

#import "cocos2d.h"
#import "BaseGameLayer.h"

@interface Status : BaseGameLayer {
    
    BOOL isAmiciShown;
    CCSprite* amici;
    CCLabelTTF* amiciLabel;
    
    CCSprite* settings;

}

@property BOOL isAmiciShown;

- (void) setAmiciVisible: (BOOL) visible;
- (void) showSettings: (BOOL) visible;
- (void) doShot: (CGPoint) point;
+ (bool) hitTest: (CCSprite*) s withPoint: (CGPoint) pt;

@end
