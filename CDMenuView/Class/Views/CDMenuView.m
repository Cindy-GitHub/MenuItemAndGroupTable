//
//  CDMenuView.m
//  CDMenuView
//
//  Created by Cindy on 16/4/19.
//  Copyright © 2016年 Cindy. All rights reserved.
//

#import "CDMenuView.h"
#import "CDCollectionItemCell.h"

@interface CDMenuView() <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionView;
}

@end


@implementation CDMenuView

#pragma mark
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //  初始化装载控件
        UICollectionViewFlowLayout *flowLayout= [[UICollectionViewFlowLayout alloc]init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
         flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _collectionView.collectionViewLayout = flowLayout;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor yellowColor];
         _collectionView.delegate = self;
         _collectionView.dataSource = self;
         [self addSubview:_collectionView];
    }
    return self;
}

- (void)layoutSubviews
{
    _collectionView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

#pragma mark - Setter Method
- (void)setShowMode:(CDMenuShowMode)showMode
{
    if (_showMode != showMode) {
        _showMode = showMode;
        [_collectionView reloadData];
    }
}

- (void)setItem:(NSArray *)item
{
    _item = item;
    [_collectionView reloadData];
}

- (void)setIconSize:(CGSize)iconSize
{
    if (CGSizeEqualToSize(_iconSize, iconSize) == NO) {
        _iconSize = iconSize;
        [_collectionView reloadData];
    }
}


#pragma mark  - UICollectionView Delegate
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"MyCollectionCellID";
    [_collectionView registerClass:[CDCollectionItemCell class] forCellWithReuseIdentifier:@"MyCollectionCellID"];
    CDCollectionItemCell * cell = (CDCollectionItemCell *)[_collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    [cell displayMenuItemData:[_item objectAtIndex:[indexPath row]] onMode:CDMenuShowModeText];
    
    if (self.showMode == CDMenuShowModeIconAndText) {
        CGRect rectOfText = [cell.labelName textRectForBounds:CGRectMake(0, 0, collectionView.frame.size.width/4.0, ItemHeight) limitedToNumberOfLines:0];
        cell.constraintImageViewCenterY.constant = rectOfText.size.height/2.0;
    }
    cell.constraintImageViewWidth.constant = self.iconSize.width;
    cell.constraintImageViewHeight.constant = self.iconSize.height;
    cell.constraintOnlyImageViewWidth.constant = self.iconSize.width;
    cell.constraintOnlyImageViewHeight.constant = self.iconSize.height;
    
    NSLog(@"%zi",[indexPath row]);
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"item  section=%zi row=%zi",[indexPath section],[indexPath row]);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((collectionView.frame.size.width - 3)/4.0, ItemHeight);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_item count];
}

@end
