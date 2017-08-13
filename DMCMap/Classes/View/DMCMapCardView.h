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
@property (nonatomic, weak, nullable) IBOutlet UIImageView *imageView;
@property (nonatomic, weak, nullable) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak, nullable) IBOutlet UIView *viewLabel;

+ (CGFloat)stopCardViewHeight;

@end
