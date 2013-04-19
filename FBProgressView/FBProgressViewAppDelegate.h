//
//  FBProgressViewAppDelegate.h
//  FBProgressView
//
//  Created by Hiroshi Hashiguchi on 11/03/30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FBProgressView;
@interface FBProgressViewAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet FBProgressView* view1;
@property (nonatomic, strong) IBOutlet FBProgressView* view2;

@end
