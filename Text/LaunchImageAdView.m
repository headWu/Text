//
//  LaunchImageAdView.m
//  Text
//
//  Created by app le on 2017/3/2.
//  Copyright © 2017年 app le. All rights reserved.
//

#import "LaunchImageAdView.h"

@interface LaunchImageAdView ()
{
    NSTimer *countDownTimer;
}

@property (nonatomic,copy)NSString *isClick;
@property (nonatomic,assign)NSInteger secondsCountDown;

@end

@implementation LaunchImageAdView

-(instancetype)initWithWindow:(UIWindow *)window andType:(NSInteger)type andImageUrl:(NSString *)url {
    if (self = [super init]) {
        self.window = window;
        _secondsCountDown = 0;
        [window makeKeyAndVisible];
        
        //获取启动图片
        CGSize viewSize = window.bounds.size;
        
        //设置竖屏
        NSString *viewOrientation = @"Portrait";
        NSString *launchImageName = nil;
        NSArray *imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
        for (NSDictionary *dict in imagesDict) {
            CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
            if (CGSizeEqualToSize(imageSize, viewSize)) {
                launchImageName = dict[@"UILaunchImageName"];
            }
        }
        
        UIImage *launchImage = [UIImage imageNamed:launchImageName];
        self.backgroundColor = [UIColor colorWithPatternImage:launchImage];
        self.frame = CGRectMake(0, 0, mainWidth, mainHeight);
        if (type == FullScreenAdType) {
            self.aDImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, mainWidth, mainHeight)];
            
        }else {
            self.aDImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, mainWidth, mainHeight - mainWidth /3)];
            
        }

        self.skipBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.skipBtn.frame = CGRectMake(mainWidth - 70, 20, 60, 30);
        self.skipBtn.backgroundColor = [UIColor brownColor];
        self.skipBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.skipBtn addTarget:self action:@selector(skipBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.aDImageView addSubview:self.skipBtn];
        
        UIBezierPath *makePath = [UIBezierPath bezierPathWithRoundedRect:self.skipBtn.bounds byRoundingCorners:UIRectCornerTopRight |UIRectCornerBottomRight cornerRadii:CGSizeMake(15, 15)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.skipBtn.bounds;
        maskLayer.path = makePath.CGPath;
        self.skipBtn.layer.mask = maskLayer;
        
        SDWebImageManager *manager = [SDWebImageManager sharedManager];
        [manager downloadImageWithURL:[NSURL URLWithString:url] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            
        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            if (image) {
                [self.aDImageView setImage:[self imageCompressForWidth:image targetWidth:mainWidth]];
            }
        }];
        
        self.aDImageView.tag = 1101;
        self.aDImageView.backgroundColor = [UIColor redColor];
        [self addSubview:self.aDImageView];
        
    }
    return self;
}

- (UIImage *)imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth{
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = defineWidth;
    CGFloat targetHeight = height/(width/targetWidth);
    CGSize size = CGSizeMake(targetWidth, targetHeight);
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnallPoint = CGPointMake(0.0, 0.0);
    
    if (CGSizeEqualToSize(imageSize, size) == NO) {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        if (widthFactor > heightFactor) {
            scaleFactor = widthFactor;
        }else {
            scaleFactor = heightFactor;
        }
        
        scaledWidth = width *scaleFactor;
        scaledHeight = height *scaleFactor;
        
        if (widthFactor > heightFactor) {
            thumbnallPoint.y = (targetHeight - scaledHeight)*0.5;
            
        }else if (widthFactor < heightFactor){
            thumbnallPoint.x = (targetWidth - scaledWidth)*0.5;
        }
    }
    
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnallPoint;
    thumbnailRect.size.width = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if (newImage == nil) {
        NSLog(@"scal image fall");
    }
    
    UIGraphicsEndImageContext();
    return newImage;
}

@end
