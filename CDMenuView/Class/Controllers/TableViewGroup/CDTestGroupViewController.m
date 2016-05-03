//
//  CDTestGroupViewController.m
//  CDMenuView
//
//  Created by Cindy on 16/4/27.
//  Copyright © 2016年 Cindy. All rights reserved.
//

#import "CDTestGroupViewController.h"
#import "CDGroupOneCell.h"
#import "CDCommenHeader.h"
#import "CExpandHeader.h"

CGFloat const HeaderViewTopHeight = 200.0;
CGFloat const HeaderViewOtherHeight = 10.0;

CGFloat const FooterViewBottomHeight = 50.0;
CGFloat const FooterViewOtherHeight = 4.0;

@interface CDTestGroupViewController () <UITableViewDelegate,UITableViewDataSource>
{
    CExpandHeader *_header;
    UIView *_customView;
}
@end

@implementation CDTestGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, HeaderViewTopHeight)];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:_customView.bounds];
    [imageView setImage:[UIImage imageNamed:@"header_view_image_bg.jpg"]];
    
    
    //关键步骤 设置可变化背景view属性
    imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight| UIViewAutoresizingFlexibleWidth;
    imageView.clipsToBounds = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    
    [_customView addSubview:imageView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    [label setText:@"这是一个自定义头部view"];
    [label setTextColor:[UIColor redColor]];
    [_customView addSubview:label];
    
    _header = [CExpandHeader expandWithScrollView:self.tableViewGroup expandView:_customView];
    
    
    self.tableViewGroup.delegate = self;
    self.tableViewGroup.dataSource = self;
    
//    _viewHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, HeaderViewTopHeight)];
//    _viewHeader.backgroundColor = [UIColor clearColor];
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, _viewHeader.bounds.size.height - 10.0, _viewHeader.bounds.size.width, 10.0)];
//    label.backgroundColor = self.tableViewGroup.backgroundColor;
//    [_viewHeader addSubview:label];
//    
//    UIView *viewBg = [[UIView alloc] initWithFrame:self.view.bounds];
//    viewBg.backgroundColor = self.tableViewGroup.backgroundColor;
//    UIImageView *bgImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header_view_image_bg.jpg"]];
//    bgImg.frame = _viewHeader.bounds;
//    [viewBg addSubview:bgImg];
//    self.tableViewGroup.backgroundView = viewBg;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CDGroupOneCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyUITableViewCell"];
    if (cell == nil) {
        cell = [[CDGroupOneCell alloc] initWithRestorationIdentifier:@"MyUITableViewCell"];
    }
    
    cell.labelName.text = [NSString stringWithFormat:@"row%zi in section%zi",[indexPath row],[indexPath section]];
    [cell updateLayoutAndLayerWithTableView:tableView indexPath:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    if (section == 0) {
//        if (_viewHeader == nil) {
//            _viewHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, HeaderViewTopHeight)];
//            _viewHeader.backgroundColor = [UIColor clearColor];
//            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, _viewHeader.bounds.size.height - 10.0, _viewHeader.bounds.size.width, 10.0)];
//            label.backgroundColor = self.tableViewGroup.backgroundColor;
//            [_viewHeader addSubview:label];
//        }
//        return _viewHeader;
//    } else {
//        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, HeaderViewOtherHeight)];
//        label.backgroundColor = self.tableViewGroup.backgroundColor;
//        return label;
//    }
//}

#pragma mark  Retrun  CGFloat
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return HeaderViewOtherHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == [tableView numberOfSections] - 1) {
        return FooterViewBottomHeight;
    } else {
        return FooterViewOtherHeight;
    }
}

#pragma mark Retrun NSInteger
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
        {
            return 1;
        }
            break;
        case 1:
        {
            return 3;
        }
            break;
        case 2:
        {
            return 4;
        }
            break;
        case 3:
        {
            return 5;
        }
            break;
        default:
            return 0;
            break;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
