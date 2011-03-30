//
//  FBProgressView.m
//  FBProgressView
//
//  Created by Hiroshi Hashiguchi on 11/03/30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FBProgressView.h"

@interface FBProgressView()
@property (nonatomic, retain) UIColor* color;
@end

@implementation FBProgressView

@synthesize color = color_;
@synthesize lineWidth = lineWidth_;
@synthesize progressViewStyle = progressViewStyle_;
@synthesize progress = progress_;
@synthesize hidesUntilStart = hidesUntilStart_;


#pragma mark -
#pragma mark Private Services
- (void)_createOutlinePath
{
    [outlinePath_ release];
    outlinePath_ = [[UIBezierPath bezierPath] retain];

    CGSize size = self.bounds.size;
    CGFloat unit = size.height/2.0 - self.lineWidth;

    CGPoint c1 = CGPointMake(unit+self.lineWidth, unit+self.lineWidth);
    [outlinePath_ addArcWithCenter:c1
                            radius:unit
                        startAngle:3*M_PI/2 endAngle:M_PI/2
                         clockwise:NO];
    
    [outlinePath_ addLineToPoint:CGPointMake(size.width - c1.x,
                                            size.height - self.lineWidth)];
    CGPoint c2 = CGPointMake(size.width - unit - self.lineWidth,
                             unit+self.lineWidth);
    [outlinePath_ addArcWithCenter:c2
                           radius:unit
                       startAngle:M_PI/2 endAngle:-M_PI/2
                        clockwise:NO];
    
    [outlinePath_ addLineToPoint:CGPointMake(c1.x, self.lineWidth)];
    
    [outlinePath_ setLineWidth:self.lineWidth];
   
}

- (void)_init
{
    self.progressViewStyle = FBProgressViewStyleDefault;
    self.lineWidth = 3.0;
    self.backgroundColor = [UIColor clearColor];
    [self _createOutlinePath];
    
    self.hidesUntilStart = YES;
    started_ = NO;
}


#define MARGIN_UNIT     3.0
- (void)_drawProgressBar
{
    CGFloat margin = self.lineWidth + MARGIN_UNIT;
    CGSize size = self.bounds.size;
    size.width -= margin*2;
    size.height -= margin*2;
    CGFloat unit = size.height/2.0;
    
    CGFloat progressWidth = size.width * self.progress;
    if (progressWidth < unit*2) {
        progressWidth = unit*2;
    }
    
    CGRect barRect = CGRectMake(margin,
                                margin,
                                progressWidth,
                                size.height);
    UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect:barRect
                                                    cornerRadius:unit];
    [path fill];
    
}


#pragma mark -
#pragma mark Initialization and deallocation

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _init];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self _init];
    }
    return self;
}
- (void)dealloc {
    [outlinePath_ release];
    [super dealloc];
}


#pragma mark -
#pragma mark UIView

- (void)drawRect:(CGRect)rect
{
    if (!self.hidesUntilStart || started_) {
        [self.color set];
        [outlinePath_ stroke];

        if (self.progress) {
            [self _drawProgressBar];
        }
    }
}


#pragma mark -
#pragma mark Properties
- (void)setProgressViewStyle:(FBProgressViewStyle)progressViewStyle
{
    progressViewStyle_ = progressViewStyle;

    switch (progressViewStyle) {
        case FBProgressViewStyleGray:
            self.color = [UIColor lightGrayColor];
            break;
            
        case FBProgressViewStyleWhite:
            self.color = [UIColor whiteColor];
            break;
            
        default:
            self.color = [UIColor lightGrayColor];
            break;
    }
}

- (void)setProgress:(float)progress
{
    if (progress > 1.0) {
        progress = 1.0;
    } else if (progress < 0.0) {
        progress = 0.0;
    }
    progress_ = progress;
    started_ = YES;

    [self setNeedsDisplay];
}

@end
