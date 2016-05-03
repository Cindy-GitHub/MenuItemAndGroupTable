//
//  CDGroupOneCell.h
//  CDMenuView
//
//  Created by Cindy on 16/4/27.
//  Copyright © 2016年 Cindy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+RoundedCorner.h"

@interface CDGroupOneCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *viewBg;

@property (weak, nonatomic) IBOutlet UILabel *labelName;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintViewBgBottomSpace;


#pragma mark - Public Method
- (instancetype)initWithRestorationIdentifier:(NSString *)identifier;  //  初始化
- (void)updateLayoutAndLayerWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;  //  更新cell显示

@end
