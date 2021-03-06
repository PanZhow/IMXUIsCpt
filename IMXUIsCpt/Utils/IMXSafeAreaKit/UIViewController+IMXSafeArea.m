//
//  UIViewController+IMXSafeArea.m
//  IMXBaseCpt
//
//  Created by zhoupanpan on 2017/12/1.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import "UIViewController+IMXSafeArea.h"
#import "UIView+IMXSafeArea.h"
#import "IMXUIKitExtUtil.h"

#define IMX_SAFEAREA_PRECACHED @"imx_safearea_pre_cached"

@implementation UIViewController (IMXSafeArea)
- (UIEdgeInsets)imx_safeArea2Cache{
    if(@available(iOS 11.0, *)){
        UIEdgeInsets insets = self.view.imx_safeArea;
        [[NSUserDefaults standardUserDefaults] setObject:NSStringFromUIEdgeInsets(insets) forKey:IMX_SAFEAREA_PRECACHED];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return insets;
    }
    return UIEdgeInsetsZero;
}
- (UIEdgeInsets)imx_safeAreaFromCache{
    NSString *insetsString = [[NSUserDefaults standardUserDefaults] objectForKey:IMX_SAFEAREA_PRECACHED];
    UIEdgeInsets insets = UIEdgeInsetsFromString(insetsString);
    return insets;
}
- (CGRect)imx_safeContent{
    UIEdgeInsets insets = [self.view imx_safeArea];
    CGFloat x = self.view.imxWidth - insets.left;
    CGFloat y = self.view.imxHeight - insets.top;
    CGFloat width = self.view.imxWidth - insets.left - insets.right;
    CGFloat height = self.view.imxHeight - insets.top - insets.bottom;
    return CGRectMake(x, y, width, height);
}
- (CGRect)imx_safeContentFromCache{
    UIEdgeInsets insets = [self imx_safeAreaFromCache];
    CGFloat x = IMX_SCREEN_WIDTH_UIKIT - insets.left;
    CGFloat y = IMX_SCREEN_HEIGHT_UIKIT - insets.top;
    CGFloat width = IMX_SCREEN_WIDTH_UIKIT - insets.left - insets.right;
    CGFloat height = IMX_SCREEN_HEIGHT_UIKIT - insets.top - insets.bottom;
    return CGRectMake(x, y, width, height);
}
- (CGFloat)imx_safeTopFromCache{
    if(@available(iOS 11.0, *)){
        CGFloat retValue = [self.view imx_safeTop];
        if(retValue <= 0){
            retValue = [self imx_safeAreaFromCache].top;
        }
        return  retValue;
    }else{
        return 0;
    }
}
- (CGFloat)imx_safeBottomFromCache{
    if(@available(iOS 11.0, *)){
        CGFloat retValue = [self.view imx_safeBottom];
        if(retValue <= 0){
            retValue = [self imx_safeAreaFromCache].bottom;
        }
        return  retValue;
    }else{
        return 0;
    }
}
- (CGFloat)imx_safeLeftFromCache{
    if(@available(iOS 11.0, *)){
        CGFloat retValue = [self.view imx_safeLeft];
        if(retValue <= 0){
            retValue = [self imx_safeAreaFromCache].left;
        }
        return  retValue;
    }else{
        return 0;
    }
}
- (CGFloat)imx_safeRightFromCache{
    if(@available(iOS 11.0, *)){
        CGFloat retValue = [self.view imx_safeRight];
        if(retValue <= 0){
            retValue = [self imx_safeAreaFromCache].right;
        }
        return  retValue;
    }else{
        return 0;
    }
}
@end
