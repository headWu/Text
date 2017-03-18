//
//  TabbarView.m
//  Text
//
//  Created by app le on 2017/2/26.
//  Copyright © 2017年 app le. All rights reserved.
//

#import "TabbarView.h"
#import "TabbarButton.h"

@interface TabbarView ()

@property (nonatomic,strong) NSMutableArray *TabArr;

@property (nonatomic,strong)TabbarButton *selectedBtn;

@end
@implementation TabbarView{
    NSInteger oldindex;
}


-(NSMutableArray *)TabArr {
    if (!_TabArr) {
        _TabArr = @[].mutableCopy;
    }
    return _TabArr;
}

-(void)setTabbarIt:(UITabBarItem *)tabbarIt {
    
    TabbarButton *btn = [TabbarButton buttonWithType:UIButtonTypeCustom];
    btn.ratio = 0.5;
    btn.tabbarItem = tabbarIt;
    
    [btn addTarget:self action:@selector(btnSelectDown:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:btn];
    [self.TabArr addObject:btn];
    
}

//按下的事件
- (void)btnSelectDown:(TabbarButton *)btn {
    NSInteger index = [self.TabArr indexOfObject:btn];
    
    if (index == oldindex) {
        
        
    }else {
        
        for (int i = 0; i <_TabArr.count; i ++) {
            TabbarButton *btn = _TabArr[i];
            btn.userInteractionEnabled = YES;
            //在layout方法里设置的启动时自动选中第一个界面，点其他按钮是会取消以前选中的
            btn.selected = NO;
        }
    }
    
    oldindex = index;
    
    TabbarButton *oldBtn = _TabArr[index];
    oldBtn.userInteractionEnabled = NO;
    
        self.selectedBtn.selected = NO;
        btn.selected = YES;
    

        self.selectedBtn = btn;
    
    if (_Block) {
        _Block(index);
    }
    
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat w = CGRectGetWidth(self.frame) / 4.0;
    CGFloat h = CGRectGetHeight(self.frame);
    
    for (int i = 0; i <self.TabArr.count; i ++) {
        TabbarButton *btn = self.TabArr[i];
        CGFloat x = w * i;

        btn.frame = CGRectMake(x, 0, w, h);
    }
    
    //代码只执行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        TabbarButton *btn = _TabArr[0];
        btn.selected = YES;
    });
    
}

@end
