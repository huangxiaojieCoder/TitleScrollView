//
//  UIColor+HEX.m
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIColor+HEX.h"

static NSDictionary *colorKeys = nil;

/** 奇好App 主题颜色 - 蓝色 2dbcef*/
NSString *const kGeneralBlueColorKey = @"2dbcef";

/** 奇好App 通用白色 FFFFFF */
NSString *const kGeneralWhiteColorKey = @"ffffff";

/** 通用背景颜色 - 红色 ff5046 */
NSString *const kGeneralBackgroundRedColorKey = @"ff5046";

/** 通用背景颜色 - 副红色 ff7060 */
NSString *const kGeneralBackgroundsubRedColorKey = @"ff7060";

/** 通用背景颜色 - 黑色 - 1e1e1e*/
NSString *const kGenearlBackgroundBlackColorKey = @"1e1e1e";

/** *通用背景色-灰色 */
NSString *const kGeneralBackgroundGrayColorKey = @"f2f2f2";
/** 通用灰色线条颜色 - 灰色 d5d5d5 */
NSString *const kGeneralBackgroundLineGrayColorKey = @"d5d5d5";


/** 通用的副标题字体颜色- 黑灰色*/
NSString *const kGeneralSubTitleFontColorKey = @"979797";

/* 
 * 通用的主标题字体颜色 - 黑色 1e1e1e
 */
NSString *const kGeneralTitleFontColorKey = @"1e1e1e";

/** 通用绿颜色 - b6d45d*/
NSString *const kGeneralGreenColorKey = @"b6d45d";

/** 通用绿颜色2 - 00aebb*/
NSString *const kGeneralGreen2ColorKey = @"00aebb";

/** 首页孩子名字/头像边框颜色-橙色 f68a0e */
NSString *const kGeneralOrangeColorKey = @"f68a0e";

/** 通用橙色2 - ed6d10 */
NSString *const kGeneralOrange2ColorKey = @"ed6d10";

/** 通用黄色 - feedb1 */
NSString *const kGeneralYellowColorKey = @"feedb1";


/** 播放列表 蓝色 - 60bbf0 */
NSString *const kGeneralTagBlueColorKey = @"60bbf0";

/** 播放列表 进度条黄色 - ffbe37 */
NSString *const kGeneralProgressOrginColorKey = @"ffbe37";

/** 播放列表 进度条蓝色 - 33d4cb */
NSString *const kGeneralProgressBlueColorKey = @"33d4cb";

/** 播放列表 进度条红色 - fb7a9d */
NSString *const kGeneralProgressRedColorKey = @"fb7a9d";

/** 播放列表 收听变数的颜色 - 9bc43a */
NSString *const kGeneralplayListGreenColorKey = @"9bc43a";

#pragma mark - 日历
/** 日历选中的日期背景色 青色 - eaf8df */
NSString *const kGeneralCyanColorKey = @"eaf8fd";


#pragma mark - 故事屋
/** 故事屋中知识体系标签的选中背景颜色 - eaf8df */
NSString *const kGeneralHouseKnowlegeTagSelectOrigin = @"fef3e6";



CGFloat colorComponentFrom(NSString *string, NSUInteger start, NSUInteger length) {
    NSString *substring = [string substringWithRange:NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    
    return hexComponent / 255.0;
}

@implementation UIColor (HEX)

+ (void)load {
    colorKeys = @{kGeneralBlueColorKey:kGeneralBlueColorKey,
                  kGeneralWhiteColorKey:kGeneralWhiteColorKey,
                  kGeneralBackgroundRedColorKey:kGeneralBackgroundRedColorKey,
                  kGeneralBackgroundsubRedColorKey:kGeneralBackgroundsubRedColorKey,
                  kGenearlBackgroundBlackColorKey:kGenearlBackgroundBlackColorKey,
                  kGeneralBackgroundGrayColorKey:kGeneralBackgroundGrayColorKey,
                  kGeneralBackgroundLineGrayColorKey:kGeneralBackgroundLineGrayColorKey,
                  kGeneralTitleFontColorKey:kGeneralTitleFontColorKey,
                  kGeneralSubTitleFontColorKey:kGeneralSubTitleFontColorKey,
                  kGeneralGreenColorKey:kGeneralGreenColorKey,
                  kGeneralGreen2ColorKey:kGeneralGreen2ColorKey,
                  kGeneralOrangeColorKey: kGeneralOrangeColorKey,
                  kGeneralOrange2ColorKey:kGeneralOrange2ColorKey,
                  kGeneralCyanColorKey:kGeneralCyanColorKey,
                  kGeneralYellowColorKey:kGeneralYellowColorKey,
                  kGeneralTagBlueColorKey:kGeneralTagBlueColorKey,
                  kGeneralProgressBlueColorKey:kGeneralProgressBlueColorKey,
                  kGeneralProgressRedColorKey:kGeneralProgressRedColorKey,
                  kGeneralProgressOrginColorKey:kGeneralProgressOrginColorKey,
                  kGeneralplayListGreenColorKey:kGeneralplayListGreenColorKey,
                  kGeneralHouseKnowlegeTagSelectOrigin:kGeneralHouseKnowlegeTagSelectOrigin};

}

+ (UIColor *)colorWithKey:(NSString *)colorKey {
    return [self colorWithKey:colorKey alpha:1.0];
}

+ (UIColor *)colorWithKey:(NSString *)colorKey alpha:(CGFloat)alpha {
    
    if (colorKey.length > 0) {
        return [self colorWithHexString:colorKeys[colorKey] alpha:alpha];
    }
    return nil;
}


+ (UIColor *)colorWithHex:(UInt32)hex{
    return [UIColor colorWithHex:hex andAlpha:1];
}
+ (UIColor *)colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha{
    return [UIColor colorWithRed:((hex >> 16) & 0xFF)/255.0
                           green:((hex >> 8) & 0xFF)/255.0
                            blue:(hex & 0xFF)/255.0
                           alpha:alpha];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString {
    
    return [self colorWithHexString:hexString alpha:1.0];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    CGFloat alphaValue, red, blue, green;
    
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    switch ([colorString length]) {
        case 3: // #RGB
            alphaValue = alpha;
            red   = colorComponentFrom(colorString, 0, 1);
            green = colorComponentFrom(colorString, 1, 1);
            blue  = colorComponentFrom(colorString, 2, 1);
            break;
            
        case 4: // #ARGB
            alphaValue = colorComponentFrom(colorString, 0, 1);
            red   = colorComponentFrom(colorString, 1, 1);
            green = colorComponentFrom(colorString, 2, 1);
            blue  = colorComponentFrom(colorString, 3, 1);
            break;
            
        case 6: // #RRGGBB
            red   = colorComponentFrom(colorString, 0, 2);
            green = colorComponentFrom(colorString, 2, 2);
            blue  = colorComponentFrom(colorString, 4, 2);
            alphaValue = alpha;
            break;
        case 8: // #AARRGGBB
            alphaValue = colorComponentFrom(colorString, 0, 2);
            red   = colorComponentFrom(colorString, 2, 2);
            green = colorComponentFrom(colorString, 4, 2);
            blue  = colorComponentFrom(colorString, 6, 2);
            break;
            
        default:
            return nil;
    }
    return [UIColor colorWithRed:red green:green blue:blue alpha:alphaValue];

}

- (NSString *)HEXString{
    UIColor* color = self;
    if (CGColorGetNumberOfComponents(color.CGColor) < 4) {
        const CGFloat *components = CGColorGetComponents(color.CGColor);
        color = [UIColor colorWithRed:components[0]
                                green:components[0]
                                 blue:components[0]
                                alpha:components[1]];
    }
    if (CGColorSpaceGetModel(CGColorGetColorSpace(color.CGColor)) != kCGColorSpaceModelRGB) {
        return [NSString stringWithFormat:@"#FFFFFF"];
    }
    return [NSString stringWithFormat:@"#%02X%02X%02X", (int)((CGColorGetComponents(color.CGColor))[0]*255.0),
            (int)((CGColorGetComponents(color.CGColor))[1]*255.0),
            (int)((CGColorGetComponents(color.CGColor))[2]*255.0)];
}

+ (UIColor *)colorWithWholeRed:(CGFloat)red
                         green:(CGFloat)green
                          blue:(CGFloat)blue
                         alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red/255.f
                           green:green/255.f
                            blue:blue/255.f
                           alpha:alpha];
}

+ (UIColor *)colorWithWholeRed:(CGFloat)red
                         green:(CGFloat)green
                          blue:(CGFloat)blue
{
    return [self colorWithWholeRed:red
                             green:green
                              blue:blue
                             alpha:1.0];
}
@end
