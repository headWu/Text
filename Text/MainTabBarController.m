//
//  MainTabBarController.m
//  Text
//
//  Created by app le on 2017/2/25.
//  Copyright © 2017年 app le. All rights reserved.
//

#import "MainTabBarController.h"

#import "FirstViewController.h"
#import "SeconedViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"

#import "TabbarView.h"

@interface MainTabBarController ()

@property (nonatomic,strong)TabbarView *customTabbar;

@end

@implementation MainTabBarController

- (TabbarView *)customTabbar {
    if (!_customTabbar) {
        TabbarView *tabbar = [[TabbarView alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, 49)];
        self.customTabbar = tabbar;
        
        __weak typeof (self) weakSelf = self;
        _customTabbar.Block = ^(NSInteger index){
        
            weakSelf.selectedIndex = index;
        
        };
        
        [self.tabBar addSubview:tabbar];
    }
    return _customTabbar;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    for (UIView *view in self.tabBar.subviews) {
        Class tabBarButtonClass = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:tabBarButtonClass]) {
            [view removeFromSuperview];
        }

    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSArray *name = @[@"FirstViewController",@"SeconedViewController",@"ThirdViewController",@"FourthViewController"];
    NSArray *imgName = @[@"tabbar_home",@"tabbar_message_center",@"tabbar_discover",@"tabbar_profile"];
    NSArray *selImgName = @[@"tabbar_home_selected",@"tabbar_message_center_highlighted",@"tabbar_discover_selected",@"tabbar_profile_highlighted"];
    NSArray *titleName = @[@"首页",@"消息",@"发现",@"个人"];
    for (NSString *VCname in name) {
        Class vcClass = NSClassFromString(VCname);
        UIViewController *VC = [[vcClass alloc] init];
        
        
        NSInteger index = [name indexOfObject:VCname];
        VC.title = titleName[index];
        [VC.tabBarItem setImage:[[UIImage imageNamed:imgName[index]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [VC.tabBarItem setSelectedImage:[[UIImage imageNamed:selImgName[index]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:VC];
        
        
        [VC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor],NSFontAttributeName:[UIFont systemFontOfSize:14]} forState:UIControlStateNormal];
        
        [VC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor],NSFontAttributeName:[UIFont systemFontOfSize:14]} forState:UIControlStateSelected];
        
        self.customTabbar.tabbarIt = VC.tabBarItem;
        
        [self addChildViewController:nav];
    }
    
    
    // Do any additional setup after loading the view.
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
