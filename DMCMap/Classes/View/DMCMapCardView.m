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
        
        [self customizeView];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.gradient.frame = self.viewLabel.bounds;
}


#pragma mark - Public

+ (CGFloat)cardViewHeight {
    
    return 180.0;
}


#pragma mark - Private

- (void)customizeView {
    
    self.imageView = [[UIImageView alloc] init];
    self.viewLabel = [[UIView alloc] init];
    self.titleLabel = [[UILabel alloc] init];
    
    [self addSubview:self.imageView];
    [self addSubview:self.viewLabel];
    [self addSubview:self.titleLabel];
    
    [self.imageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = true;
    [self.imageView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = true;
    [self.imageView.topAnchor constraintEqualToAnchor:self.topAnchor].active = true;
    [self.imageView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = true;
    
    [self.viewLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = true;
    [self.viewLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = true;
    [self.viewLabel.heightAnchor constraintEqualToConstant:52.0].active = true;
    [self.viewLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = true;

    [self.viewLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:16.0].active = true;
    [self.viewLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-16.0].active = true;
    [self.viewLabel.heightAnchor constraintEqualToConstant:21.0].active = true;
    [self.viewLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-10.0].active = true;

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
