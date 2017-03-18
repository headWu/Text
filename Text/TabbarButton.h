//
//  TabbarButton.h
//  Text
//
//  Created by app le on 2017/2/26.
//  Copyright © 2017年 app le. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabbarButton : UIButton

@property (nonatomic,strong)UITabBarItem *tabbarItem;

//图片和文字的比例
@property (nonatomic,assign)CGFloat ratio;

@end
