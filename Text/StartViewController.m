//
//  StartViewController.m
//  Text
//
//  Created by app le on 2017/2/28.
//  Copyright © 2017年 app le. All rights reserved.
//

#import "StartViewController.h"
#import "MainTabBarController.h"
@interface StartViewController ()

@property (weak, nonatomic) IBOutlet UIButton *timeBtn;




@end

@implementation StartViewController{
    NSTimer *_timer;
    NSString *Str;
    NSInteger i;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   Str = @"".mutableCopy;
    i = 9;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(onclick:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    

}

- (void)onclick:(NSTimer *)timer {
    
    NSString *str = @"";
    if (i >=0) {
        
        Str = [str stringByAppendingFormat:@"%ld | 跳过",(long)i];
        NSLog(@"%@",Str);
        i --;
    }else {
        
       
        [_timer invalidate];
        _timer = nil;
         [self jumpBtnClick:nil];
    }
    
    
    [_timeBtn setTitle:Str forState:UIControlStateNormal];
    

}
- (IBAction)jumpBtnClick:(UIButton *)sender {
    
    
    UIApplication *application = [UIApplication sharedApplication];
    [application.delegate window].rootViewController = [[MainTabBarController alloc] init];
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
