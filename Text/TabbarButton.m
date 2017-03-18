//
//  TabbarButton.m
//  Text
//
//  Created by app le on 2017/2/26.
//  Copyright © 2017年 app le. All rights reserved.
//

#import "TabbarButton.h"

@implementation TabbarButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame: frame]) {
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}

- (void)setTabbarItem:(UITabBarItem *)tabbarItem {
    
    NSString *titleStr = tabbarItem.title;
    UIImage *img = tabbarItem.image;
    UIImage *selImg = tabbarItem.selectedImage;
    [self setTitle:titleStr forState:UIControlStateNormal];
    [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    [self setImage:img forState:UIControlStateNormal];
    [self setImage:selImg forState:UIControlStateSelected];
    
    _tabbarItem = tabbarItem;
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = CGRectGetWidth(contentRect);
    CGFloat h = CGRectGetHeight(contentRect) * _ratio;
    return CGRectMake(x, y, w, h);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat x = 0;
    CGFloat y = CGRectGetHeight(contentRect) * _ratio;
    CGFloat w = CGRectGetWidth(contentRect);
    CGFloat h = CGRectGetHeight(contentRect) *(1-_ratio);
    return  CGRectMake(x, y, w, h);
}
@end
