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
@property (nonatomic, strong, nullable) UIImageView *imageView;
@property (nonatomic, strong, nullable) UILabel *titleLabel;
@property (nonatomic, strong, nullable) UIView *viewLabel;

+ (CGFloat)cardViewHeight;

@end
