//
//  TabbarView.h
//  Text
//
//  Created by app le on 2017/2/26.
//  Copyright © 2017年 app le. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabbarView : UIView

@property (nonatomic,strong)UITabBarItem *tabbarIt;

@property (nonatomic,copy) void(^Block)(NSInteger index);

@end
