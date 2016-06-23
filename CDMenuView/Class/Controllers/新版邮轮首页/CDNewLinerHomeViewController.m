//
//  CDNewLinerHomeViewController.m
//  CDMenuView
//
//  Created by Cindy on 16/6/16.
//  Copyright © 2016年 Cindy. All rights reserved.
//

#import "CDNewLinerHomeViewController.h"
#import "CDCollectionViewFlowLayout.h"

#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height

NSString *const UICollectionElementKindSectionHeaderID = @"NewLinerHomeCollectionViewHeaderViewID";
NSString *const UICollectionElementKindSectionFooterID = @"NewLinerHomeCollectionViewFooterViewID";

@interface CDNewLinerHomeViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionViewLinerHome;
}
@end

@implementation CDNewLinerHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"邮轮";
    
    //  初始化装载控件
    CDCollectionViewFlowLayout *flowLayout= [[CDCollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.isSuspend = YES;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _collectionViewLinerHome.collectionViewLayout = flowLayout;
    _collectionViewLinerHome = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:flowLayout];
    _collectionViewLinerHome.backgroundColor = [UIColor whiteColor];
    _collectionViewLinerHome.delegate = self;
    _collectionViewLinerHome.dataSource = self;
    [self.view addSubview:_collectionViewLinerHome];
}

- (void)viewWillAppear:(BOOL)animated
{
    [_collectionViewLinerHome reloadData];
}

#pragma mark - UICollection View Delegate
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"MyCollectionCellID";
    [_collectionViewLinerHome registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"MyCollectionCellID"];
    UICollectionViewCell * cell = (UICollectionViewCell *)[_collectionViewLinerHome dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UILabel *labelDesr = [cell viewWithTag:100];
    if (labelDesr == nil) {
        labelDesr = [[UILabel alloc] initWithFrame:cell.bounds];
        labelDesr.tag = 100;
        labelDesr.textAlignment = NSTextAlignmentCenter;
        labelDesr.textColor = [UIColor darkGrayColor];
        labelDesr.font = [UIFont systemFontOfSize:14.0];
        [cell addSubview:labelDesr];
    }
    labelDesr.text = [NSString stringWithFormat:@"%zi%zi",[indexPath section],[indexPath row]];
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"section = %zi , item = %zi   clicked !",[indexPath section],[indexPath row]);
}

#pragma mark  Header  View   or   Footer   View
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:UICollectionElementKindSectionHeaderID];
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:UICollectionElementKindSectionFooterID];
    
    CDCollectionViewFlowLayout *collectionViewFlowLayout = (CDCollectionViewFlowLayout *)collectionViewLayout;
    // 设置header或footer的size, 如不设置默认是CGSizeZero
    CGSize size = section == 0 ? CGSizeZero : CGSizeMake(ScreenWidth, 35.0);
    collectionViewFlowLayout.headerReferenceSize = size;
    collectionViewFlowLayout.footerReferenceSize = CGSizeZero;  //  不需要显示footer
    
    return size;
}

- (UICollectionReusableView *) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        reusableView = [self retrunCollectionView:collectionView headerViewAtIndexPath:indexPath];
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        reusableView = [self retrunCollectionView:collectionView headerViewAtIndexPath:indexPath];
    } else {
        NSLog(@"other kind");
    }
    return reusableView;
}

#pragma mark  Item Size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size;
    
    switch ([indexPath section]) {
        case 0:
        {
            size = CGSizeMake(ScreenWidth, 120.0);
        }
            break;
        case 1:
        {
            size = CGSizeMake((ScreenWidth - 3.0)/4.0, 50.0);
        }
            break;
        case 2:
        {
            size = CGSizeMake(ScreenWidth, 100.0);
        }
            break;
        case 3:
        {
            size = CGSizeMake(ScreenWidth, 80.0);
        }
            break;
        case 4:
        {
            size = CGSizeMake((ScreenWidth - 3.0)/4.0, 60.0);
        }
            break;
        default:
            size = CGSizeZero;
            break;
    }
    
    return size;
}

#pragma mark  Item Number  And  Section Number
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
        {
            return 1;
        }
            break;
        case 1:
        {
            return 8;
        }
            break;
        case 2:
        {
            return 1;
        }
            break;
        case 3:
        {
            return 6;
        }
            break;
        case 4:
        {
            return 4;
        }
            break;
        default:
            return 0;
            break;
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 5;
}

#pragma mark  Item  Spacing
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}

#pragma mark -  Item   Cell    Method
- (UICollectionReusableView *)retrunCollectionView:(UICollectionView *)collectionView headerViewAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:UICollectionElementKindSectionHeaderID forIndexPath:indexPath];
    headerView.backgroundColor = [UIColor groupTableViewBackgroundColor];  //  设置header的背景颜色
    
    UILabel *label = [headerView viewWithTag:100];
    if (label == nil) {
        label = [[UILabel alloc] initWithFrame:headerView.bounds];
        label.tag = 100;
        label.textColor = [UIColor darkGrayColor];
        label.font = [UIFont systemFontOfSize:14.0];
        [headerView addSubview:label];
    }
    label.text = [NSString stringWithFormat:@"  我是section%zi的头信息",[indexPath section]];

    return  headerView;
}

- (UICollectionReusableView *)retrunCollectionView:(UICollectionView *)collectionView footerViewAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:UICollectionElementKindSectionFooterID forIndexPath:indexPath];
    
    return  footerView;
}

@end
