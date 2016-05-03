//
//  CDMenuView.h
//  CDMenuView
//
//  Created by Cindy on 16/4/19.
//  Copyright © 2016年 Cindy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDCommenHeader.h"

@interface CDMenuView : UIView

// 菜单展示的类型
@property (nonatomic,assign) CDMenuShowMode showMode;
//  存放菜单展示的数据
@property (nonatomic,strong) NSArray *item;
//  icon显示的大小
@property (nonatomic,assign) CGSize iconSize;



@end
