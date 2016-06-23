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

@interface CDMainViewController ()
{
    CDMenuView *menu;
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
