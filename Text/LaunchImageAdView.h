//
//  LaunchImageAdView.h
//  Text
//
//  Created by app le on 2017/3/2.
//  Copyright © 2017年 app le. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"


#define mainHeight [[UIScreen mainScreen]bounds].size.height
#define mainWidth [[UIScreen mainScreen]bounds].size.width

typedef enum {
    
    FullScreenAdType = 1,
    LogoAdType = 0
}Adtype;

@interface LaunchImageAdView : UIView

@property (nonatomic,strong)UIImageView *aDImageView;
@property (nonatomic,strong)UIWindow *window;
@property (nonatomic,assign)NSInteger *adTime;
@property (nonatomic,strong)UIButton *skipBtn;


-(instancetype)initWithWindow:(UIWindow *)window andType:(NSInteger)type andImageUrl:(NSString *)url;

@end
