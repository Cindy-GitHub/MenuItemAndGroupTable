//
//  CDCollectionItemCell.m
//  CDMenuView
//
//  Created by Cindy on 16/4/19.
//  Copyright © 2016年 Cindy. All rights reserved.
//

#import "CDCollectionItemCell.h"

@implementation CDCollectionItemCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
        // 如果路径不存在，return nil
        if (arrayOfViews.count < 1) {
            return nil;
        }
        // 如果xib中view不属于UICollectionViewCell类，return nil
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        // 加载nib
        self = [arrayOfViews objectAtIndex:0];
    }
    
    return self;
}

- (void)displayMenuItemData:(NSDictionary *)item onMode:(CDMenuShowMode)showMode
{
    switch (showMode) {
        case CDMenuShowModeIcon:
        {
            self.viewText.hidden = YES;
            self.viewIconAndText.hidden = YES;
            
            self.imageViewOnlyIcon.image = [UIImage imageNamed:[item objectForKey:MenuTextKey]];
        }
            break;
        case CDMenuShowModeText:
        {
            self.viewIconAndText.hidden = YES;
            self.viewIcon.hidden = YES;
            
            self.labelOnlyName.text = [item objectForKey:MenuTextKey];
        }
            break;
        case CDMenuShowModeIconAndText:
        {
            self.viewText.hidden = YES;
            self.viewIcon.hidden = YES;
            
            self.labelName.text = [item objectForKey:MenuTextKey];
            self.imageViewIcon.image = [UIImage imageNamed:[item objectForKey:MenuIconKey]];
        }
            break;
            
        default:
            break;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



@end
