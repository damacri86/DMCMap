//
//  DMCMapCardView.h
//  DMCMapview
//
//  Created by David on 11/8/17.
//  Copyright © 2017 damacri.pods. All rights reserved.
//

@import UIKit;

@class DMCMapCardView;

@protocol DMCCardViewDelegate <NSObject>

- (void)didCardViewPressed:(nonnull DMCMapCardView *)cardView;

@end

@interface DMCMapCardView : UIView

@property (nonatomic, weak, nullable) id<DMCCardViewDelegate> delegate;
@property (nonatomic, strong, nonnull) UIImageView *imageView;
@property (nonatomic, strong, nonnull) UILabel *titleLabel;
@property (nonatomic, strong, nonnull) UIView *viewLabel;

+ (CGFloat)cardViewHeight;

@end
