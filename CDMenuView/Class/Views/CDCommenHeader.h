//
//  CDCommenHeader.h
//  CDMenuView
//
//  Created by Cindy on 16/4/19.
//  Copyright © 2016年 Cindy. All rights reserved.
//

#ifndef CDCommenHeader_h
#define CDCommenHeader_h

#import <UIKit/UIKit.h>


/**
 *  获得当前设备的高 和 宽
 */
#define ScreenWidth  ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)

#define ScreenHeight  ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)



typedef NS_ENUM(NSInteger,CDMenuShowMode) {
    CDMenuShowModeText = 0,         //  纯文字类型
    CDMenuShowModeIcon,                //  纯图标类型
    CDMenuShowModeIconAndText,  //  图文混排类型
};

//
#define MenuTextKey @"title"
#define MenuIconKey @"icon"

//
//#define ItemWidth ScreenWidth/4.0
#define ItemHeight  100.0f


#endif /* CDCommenHeader_h */
