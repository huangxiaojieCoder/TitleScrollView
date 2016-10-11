//
//  QHStoryTitleScrollerView.h
//  QiHaoBox
//
//  Created by xiaojie on 16/6/12.
//  Copyright © 2016年 QiHao. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "QHStoryFilterItem.h"

@class QHStoryTitleScrollerView;

typedef NS_ENUM(NSInteger,TitleLabelType) {
    TitleLabelTypeText,
    TitleLabelTypeAttributedText
};

@protocol QHStoryTitleScrollerViewDelegate <NSObject>

@optional
- (void)storyTitleScrollerView:(QHStoryTitleScrollerView *)storyTitleScrolllerView selectIndex:(NSInteger)selectIndex;

@end

@interface QHStoryTitleScrollerView : UIView


/**
 title数组
 */
@property (strong, nonatomic) NSArray *titleArray;

/**
 文本Label 设置内容的方式 默认是text模式
 */
@property (assign, nonatomic) TitleLabelType type;


/**
 文本标题的字体的大小
 */
@property (assign, nonatomic) NSInteger titleFont;

/**
 富文本模式的选中的文本字体大小
 */
@property (assign, nonatomic) NSInteger attributedFont;





@property (weak, nonatomic) id<QHStoryTitleScrollerViewDelegate>delegate;


- (instancetype)initWithLabelTextType:(TitleLabelType)type;
- (void)selectIndex:(NSInteger)selectIndex;

- (void)updateArray:(NSMutableArray *)titleArray;


@end
