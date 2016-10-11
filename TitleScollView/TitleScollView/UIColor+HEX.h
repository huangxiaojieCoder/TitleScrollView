//
//  UIColor+HEX.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/** 奇好App 主题颜色 - 蓝色 2dbcef*/
FOUNDATION_EXTERN NSString *const kGeneralBlueColorKey;

/** 奇好App 通用白色 FFFFFF */
FOUNDATION_EXTERN NSString *const kGeneralWhiteColorKey;

/** 通用背景颜色 - 红色 ff5046 */
FOUNDATION_EXTERN NSString *const kGeneralBackgroundRedColorKey;

/** 通用背景颜色 - 副红色 ff7060 */
FOUNDATION_EXTERN NSString *const kGeneralBackgroundsubRedColorKey;

/** 通用背景颜色 - 黑色 - 1e1e1e*/
FOUNDATION_EXTERN NSString *const kGenearlBackgroundBlackColorKey;

/** 通用背景色-灰色 f2f2f2 */
FOUNDATION_EXTERN NSString *const kGeneralBackgroundGrayColorKey;

/** 通用灰色线条颜色 - 灰色 d5d5d5 */
FOUNDATION_EXTERN NSString *const kGeneralBackgroundLineGrayColorKey;
/** 通用的描述字体颜色 - 灰色 979797*/
FOUNDATION_EXTERN NSString *const kGeneralSubTitleFontColorKey;
/** 
 * 通用的主标题字体颜色 - 黑色 1e1e1e
 */
FOUNDATION_EXTERN NSString *const kGeneralTitleFontColorKey;

/** 通用绿颜色 - b6d45d*/
FOUNDATION_EXTERN NSString *const kGeneralGreenColorKey;

/** 通用绿颜色2 - 00aebb
 *
 *  故事推荐标题 - 小编推荐、讲故事达人
 */
FOUNDATION_EXTERN NSString *const kGeneralGreen2ColorKey;

/** 通用橙色2 - ed6d10 
 *
 *  故事推荐标题 - 最新上线、热门电台
 */
FOUNDATION_EXTERN  NSString *const kGeneralOrange2ColorKey;

/** 通用橙色 - f68a0e
 
 * 首页孩子名字/头像边框颜色
 */
FOUNDATION_EXTERN NSString *const kGeneralOrangeColorKey;


/** 播放列表 蓝色 - 60bbf0 */
FOUNDATION_EXTERN NSString *const  kGeneralTagBlueColorKey ;

/** 播放列表 进度条黄色 - ffbe37 */
FOUNDATION_EXTERN NSString *const kGeneralProgressOrginColorKey ;

/** 播放列表 进度条蓝色 - 33d4cb */
FOUNDATION_EXTERN NSString *const kGeneralProgressBlueColorKey;

/** 播放列表 进度条红色 - fb7a9d */
FOUNDATION_EXTERN NSString *const kGeneralProgressRedColorKey;

/** 播放列表 收听变数的颜色 - 9bc43a */
FOUNDATION_EXTERN NSString *const kGeneralplayListGreenColorKey;


#pragma mark - 日历
/** 通用背景色青色 - eaf8df 
 *
 * 日历选中的日期、夜间模式时间 cell 选中背景色，会话置顶背景色
 */
FOUNDATION_EXTERN NSString *const kGeneralCyanColorKey;

/** 通用黄色 - feedb1
 *
 * 孩子的播放列表容量视图背景色
 */
FOUNDATION_EXTERN NSString *const kGeneralYellowColorKey;


#pragma mark - 故事屋
/** 故事屋中知识体系标签的选中背景颜色 - eaf8df */
FOUNDATION_EXTERN NSString *const kGeneralHouseKnowlegeTagSelectOrigin;


/**
 *  UIColor 分类
 */
@interface UIColor (HEX)
+ (UIColor *)colorWithHex:(UInt32)hex;
+ (UIColor *)colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

- (NSString *)HEXString;

+ (UIColor *)colorWithWholeRed:(CGFloat)red
                         green:(CGFloat)green
                          blue:(CGFloat)blue
                         alpha:(CGFloat)alpha;

+ (UIColor *)colorWithWholeRed:(CGFloat)red
                         green:(CGFloat)green
                          blue:(CGFloat)blue;

/**
 *  根据不同的 key ，读取颜色值
 *
 *  @param colorKey 颜色 key
 *
 *  @return color
 */
+ (nullable UIColor *)colorWithKey:(NSString *)colorKey;
+ (nullable UIColor *)colorWithKey:(NSString *)colorKey alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
