//
//  QHStoryScrollTitleLabel.m
//  QiHaoBox
//
//  Created by xiaojie on 16/6/12.
//  Copyright © 2016年 QiHao. All rights reserved.
//

#import "QHStoryScrollTitleLabel.h"
#import "NSString+Extension.h"


#define textFont 15

@interface QHStoryScrollTitleLabel()

@property (strong, nonatomic) UILabel *titleLabel;

@property (strong, nonatomic) UIView *colTipView;

@end

@implementation QHStoryScrollTitleLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 添加Label
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.font = [UIFont systemFontOfSize:textFont];
        [titleLabel setTextAlignment:NSTextAlignmentCenter];
        titleLabel.userInteractionEnabled = YES;
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleLabelClick:)];
//        [titleLabel addGestureRecognizer:tap];
        titleLabel.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [self addSubview:titleLabel];
        self.titleLabel = titleLabel;
        
        UIView *colTipView = [[UIView alloc] init];
        colTipView.backgroundColor = [UIColor colorWithKey:kGeneralOrangeColorKey];
        colTipView.frame = CGRectMake(0 , self.frame.size.height - 2 ,self.frame.size.width, 2);
        colTipView.hidden = YES;
        [self addSubview:colTipView];
        self.colTipView = colTipView;
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    if (self.titleLabel.attributedText) {
        
        CGRect rect = [self.titleLabel.attributedText boundingRectWithSize:CGSizeMake(MAXFLOAT, 100) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
        self.colTipView.frame = CGRectMake((self.width - rect.size.width) * 0.5 , self.frame.size.height - 2, rect.size.width, 2);
        
    } else {
        
        CGSize  textize = [self.titleLabel.text sizeWithfont:[UIFont systemFontOfSize:textFont] maxSize:CGSizeMake(kScreenWidth, MAXFLOAT)];
        self.colTipView.frame = CGRectMake((self.width - textize.width) * 0.5 , self.frame.size.height - 2, textize.width, 2);
    }
}

- (void)setText:(NSString *)text
{
    _text = text;

    [self.titleLabel setText:text];
    CGSize  textize = [self.titleLabel.text sizeWithfont:[UIFont systemFontOfSize:textFont] maxSize:CGSizeMake(kScreenWidth, MAXFLOAT)];
    self.colTipView.frame = CGRectMake((self.width - textize.width) * 0.5 , self.frame.size.height - 2, textize.width, 2);
    
}

- (void)setAttributedString:(NSAttributedString *)attributedString
{
    _attributedString = attributedString;
    
    self.titleLabel.attributedText = attributedString;
    
    CGRect rect = [self.titleLabel.attributedText boundingRectWithSize:CGSizeMake(MAXFLOAT, 100) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    self.colTipView.frame = CGRectMake((self.width - rect.size.width) * 0.5 , self.frame.size.height - 2, rect.size.width, 2);
}



- (void)setSelected:(BOOL)selected
{
    _selected = selected;
    
    if (selected == YES) {
        self.titleLabel.textColor = [UIColor colorWithKey:kGeneralOrangeColorKey];
        self.colTipView.hidden = NO;
    } else {
        self.titleLabel.textColor = [UIColor colorWithKey:kGeneralTitleFontColorKey];
        self.colTipView.hidden = YES;
        
    }

}

- (void)setTitleFont:(NSInteger)titleFont
{
    _titleFont = titleFont;
    self.titleLabel.font = [UIFont systemFontOfSize:titleFont];
}



@end
