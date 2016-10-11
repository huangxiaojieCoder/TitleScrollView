//
//  QHStoryScrollTitleLabel.h
//  QiHaoBox
//
//  Created by xiaojie on 16/6/12.
//  Copyright © 2016年 QiHao. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface QHStoryScrollTitleLabel : UIView


@property (copy, nonatomic) NSString *text;

@property (assign, nonatomic) NSInteger titleFont;

@property (assign, nonatomic) BOOL selected;

@property (strong, nonatomic) NSAttributedString *attributedString;

@end
