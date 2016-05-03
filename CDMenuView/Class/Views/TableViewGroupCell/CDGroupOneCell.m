//
//  CDGroupOneCell.m
//  CDMenuView
//
//  Created by Cindy on 16/4/27.
//  Copyright © 2016年 Cindy. All rights reserved.
//

#import "CDGroupOneCell.h"

@implementation CDGroupOneCell

#pragma mark - Public Method
#pragma mark init method
- (instancetype)initWithRestorationIdentifier:(NSString *)identifier
{
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    for(id oneObject in nib) {
        if([oneObject isKindOfClass:[self class]]) {
            self = oneObject;
            break;
        }
    }
    
    if (self == nil) {
        self = [super init];
    }
    
    [self setRestorationIdentifier:identifier];
    return self;
}
#pragma mark  update method
- (void)updateLayoutAndLayerWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
{
    CGFloat  outOpacity = 0.13f;  //  设置最外层的阴影透明度
    CGFloat inOpacity = 0.06f;  //  设置内层的cell阴影透明度
    CGFloat radius = 5;  //  设置每个section的圆角度
    
    if ([indexPath row] == 0 && [tableView numberOfRowsInSection:[indexPath section]] == 1) {  //  单行(只有一行)
        [self.viewBg jm_setJMRadius:JMRadiusMake(radius, radius, radius, radius) withBackgroundColor:[UIColor whiteColor]];
        self.viewBg.layer.shadowOpacity = outOpacity;
        
    } else if ([tableView numberOfRowsInSection:[indexPath section]] == [indexPath row] + 1) { //  最后一行（有多行）
        [self.viewBg jm_setJMRadius:JMRadiusMake(0, 0, radius, radius) withBackgroundColor:[UIColor whiteColor]];
        self.viewBg.layer.shadowOpacity = outOpacity;
        
    } else if ([indexPath row] == 0) {  //  首行（有多行）
        [self.viewBg jm_setJMRadius:JMRadiusMake(radius, radius, 0, 0) withBackgroundColor:[UIColor whiteColor]];
        self.viewBg.layer.shadowOpacity = inOpacity;
        
    } else {  //  其他行
        [self.viewBg jm_setJMRadius:JMRadiusMake(0, 0, 0, 0) withBackgroundColor:[UIColor whiteColor]];
        self.viewBg.layer.shadowOpacity = inOpacity;
        
    }
}

#pragma mark
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    UIColor *shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
    self.viewBg.layer.shadowColor = shadowColor.CGColor;
    self.viewBg.layer.shadowOffset = CGSizeMake(0.0,0.5);
    self.viewBg.layer.shadowOpacity = 0.15f;
    self.viewBg.layer.shadowRadius = 0.5f;
    
    self.constraintViewBgBottomSpace.constant = 1.0f;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
