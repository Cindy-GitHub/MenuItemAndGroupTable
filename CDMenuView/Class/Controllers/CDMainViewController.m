//
//  CDMainViewController.m
//  CDMenuView
//
//  Created by Cindy on 16/4/19.
//  Copyright © 2016年 Cindy. All rights reserved.
//

#import "CDMainViewController.h"
#import "CDMenuView.h"
#import "CDTestGroupViewController.h"
#import "CDNewLinerHomeViewController.h"


#define SCREENBOUNDS  [[UIScreen mainScreen] bounds]
#define SCREEN_WIDTH  (SCREENBOUNDS.size.width)
#define SCREEN_HEIGHT (SCREENBOUNDS.size.height)


@interface CDMainViewController ()
{
    CDMenuView *menu;
    
//    UIView *_viewNavi;
    UIView *viewBg;
}
@end

@implementation CDMainViewController


- (IBAction)buttonEnterTableGroup:(UIButton *)sender
{
//    CDTestGroupViewController *group = [[CDTestGroupViewController alloc] init];
//    [self.navigationController pushViewController:group animated:YES];
    
    CDNewLinerHomeViewController *homeController = [[CDNewLinerHomeViewController alloc] init];
    [self.navigationController pushViewController:homeController animated:YES];
}


#pragma mark - View
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initNavigation];
    self.navigationItem.titleView = viewBg;
//    [self addMenuView];
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.view addSubview:menu];
}

- (void)addMenuView
{
    menu = [[CDMenuView alloc] initWithFrame:CGRectMake(0, 100, ScreenWidth, 200)];
    menu.showMode = CDMenuShowModeText;
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 15; i ++) {
        [tempArray addObject:@{MenuTextKey : [NSString stringWithFormat:@"item-%zi",i+1]}];
    }
    menu.item = [NSArray arrayWithArray:tempArray];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

#pragma mark 
- (void)initNavigation
{
    viewBg = [[UIView alloc] initWithFrame:CGRectInset(self.navigationController.navigationBar.bounds, 50.0, 0)];
    
    //  center view
    UIView *viewCenter = [[UIView alloc] initWithFrame:CGRectInset(viewBg.bounds, 0, 8.0)];
    viewCenter.layer.cornerRadius = 5;
    viewCenter.layer.borderWidth = 0.5;
    viewCenter.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3].CGColor;
    [viewBg addSubview:viewCenter];
    
    // 产品描述
    UILabel *description = [[UILabel alloc] init];
    description.text = @"邮轮";
    description.textAlignment = NSTextAlignmentCenter;
    description.textColor = [UIColor darkGrayColor];
    description.font = [UIFont systemFontOfSize:12.0];
    description.frame = CGRectMake(0, 0, [description textRectForBounds:CGRectMake(0, 0, 100.0, 100.0) limitedToNumberOfLines:0].size.width + 10.0, viewCenter.bounds.size.height);
    [viewCenter addSubview:description];
    
    UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(description.bounds.size.width, 5.0, 1.0, viewCenter.bounds.size.height - 5.0*2)];
    line.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [viewCenter addSubview:line];
    
    UILabel *keyWorld = [[UILabel alloc] init];
    keyWorld.text = @"目的地/邮轮关键字";
    keyWorld.textAlignment = NSTextAlignmentLeft;
    keyWorld.textColor = [UIColor lightGrayColor];
    keyWorld.font = [UIFont systemFontOfSize:12.0];
    keyWorld.frame = CGRectMake(description.bounds.size.width + 10.0, 0, [keyWorld textRectForBounds:CGRectMake(0, 0, 500.0, 100.0) limitedToNumberOfLines:0].size.width + 10.0, viewCenter.bounds.size.height);
    [viewCenter addSubview:keyWorld];
    
    [self.view addSubview:viewBg];
}

@end
