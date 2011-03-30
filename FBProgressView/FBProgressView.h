//
//  FBProgressView.h
//  FBProgressView
//
//  Created by Hiroshi Hashiguchi on 11/03/30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    FBProgressViewStyleDefault = 0,
    FBProgressViewStyleGray,
    FBProgressViewStyleWhite
} FBProgressViewStyle;

@interface FBProgressView : UIView {
    
    UIColor* color_;
    CGFloat lineWidth_;
    UIBezierPath* outlinePath_;
    FBProgressViewStyle progressViewStyle_;
    float progress_;
    BOOL hidesUntilStart_;
    BOOL started_;
}
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, assign) FBProgressViewStyle progressViewStyle;
@property (nonatomic, assign) float progress;
@property (nonatomic, assign) BOOL hidesUntilStart;

@end
