//
//  CDCollectionItemCell.h
//  CDMenuView
//
//  Created by Cindy on 16/4/19.
//  Copyright © 2016年 Cindy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDCommenHeader.h"

@interface CDCollectionItemCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIView *viewIconAndText;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewIcon;
@property (weak, nonatomic) IBOutlet UILabel *labelName;

@property (weak, nonatomic) IBOutlet UIView *viewIcon;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewOnlyIcon;

@property (weak, nonatomic) IBOutlet UIView *viewText;
@property (weak, nonatomic) IBOutlet UILabel *labelOnlyName;



@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintImageViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintImageViewWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintImageViewCenterY;




@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintOnlyImageViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintOnlyImageViewWidth;



//  public method
- (void)displayMenuItemData:(NSDictionary *)item onMode:(CDMenuShowMode)showMode;

@end
