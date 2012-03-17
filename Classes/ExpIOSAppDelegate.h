//
//  ExpIOSAppDelegate.h
//  ExpIOS
//
//  Created by Marco Nova on 15/3/12.
//  Copyright Atex Global Media SpA 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface ExpIOSAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

-(CCScene *) scene;

@end
