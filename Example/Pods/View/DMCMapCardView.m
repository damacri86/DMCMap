//
//  DMCMapCardView.m
//  DMCMapview
//
//  Created by David on 11/8/17.
//  Copyright © 2017 damacri.pods. All rights reserved.
//

#import "DMCMapCardView.h"

@interface DMCMapCardView ()

@property (nonatomic, strong) CAGradientLayer *gradient;

@end

@implementation DMCMapCardView

#pragma mark - Lifecycle

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
        [self customizeView];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.gradient.frame = self.viewLabel.bounds;
}


#pragma mark - Public

+ (CGFloat)stopCardViewHeight {
    
    return 180.0;
}


#pragma mark - Private

- (void)customizeView {
    
    self.layer.cornerRadius = 10.0;
    self.gradient = [CAGradientLayer layer];
    self.gradient.frame = self.viewLabel.bounds;
    self.gradient.colors = @[(id)[UIColor clearColor].CGColor, (id)[UIColor blackColor].CGColor];
    [self.viewLabel.layer insertSublayer:self.gradient atIndex:0];
}

- (IBAction)didButtonPressed:(id)sender {
    
    [self.delegate didCardViewPressed:self];
}

@end
