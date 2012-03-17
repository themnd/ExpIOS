//
//  Status.h
//  Experiment
//
//  Created by Marco Nova on 15/3/12.
//  Copyright 2012 Atex Global Media SpA. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Status : CCLayer {
    
    BOOL isAmiciShown;
    CCSprite* amici;
    CCLabelTTF* amiciLabel;

    float previousTouchAngle, currentTouchAngle;
    CGPoint startTouchPoint, endTouchPoint;
    
    NSMutableArray *bullets;
}

@property BOOL isAmiciShown;

- (void)update:(ccTime)dt;
- (void) setAmiciVisible: (BOOL) visible;

@end
