//
//  QHStoryTitleScrollerView.m
//  QiHaoBox
//
//  Created by xiaojie on 16/6/12.
//  Copyright © 2016年 QiHao. All rights reserved.
//

#import "QHStoryTitleScrollerView.h"
#import "QHStoryScrollTitleLabel.h"
#import "NSString+Extension.h"

@interface QHStoryTitleScrollerView ()
@property (weak, nonatomic) UIScrollView *scrollerView;

@property (strong, nonatomic) NSMutableArray *titleLabels;

@property (strong, nonatomic) NSMutableArray *offLines;

@end

@implementation QHStoryTitleScrollerView

- (instancetype)initWithLabelTextType:(TitleLabelType)type
{
    self = [super init];
    if (self) {
        
        UIScrollView *scrllView = [[UIScrollView alloc] init];
        scrllView.scrollsToTop = NO;
        scrllView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        scrllView.showsHorizontalScrollIndicator = NO;
        scrllView.showsVerticalScrollIndicator = NO;
        [self addSubview:scrllView];
        self.scrollerView = scrllView;
        
        self.type = type;
        self.titleFont = 15;
        self.attributedFont = 17;
    }
    return self;
}

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        UIScrollView *scrllView = [[UIScrollView alloc] init];
//        scrllView.scrollsToTop = NO;
//        scrllView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
//        scrllView.showsHorizontalScrollIndicator = NO;
//        scrllView.showsVerticalScrollIndicator = NO;
//        [self addSubview:scrllView];
//        self.scrollerView = scrllView;
//        
//    }
//    return self;
//}

- (instancetype)init
{
    self = [super init];
    if (self) {
        UIScrollView *scrllView = [[UIScrollView alloc] init];
        scrllView.scrollsToTop = NO;
        scrllView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        scrllView.showsHorizontalScrollIndicator = NO;
        scrllView.showsVerticalScrollIndicator = NO;
        [self addSubview:scrllView];
        self.scrollerView = scrllView;
        
        // 设置初始值
        self.type = TitleLabelTypeText;
        self.titleFont = 15;
        self.attributedFont = 17;
        
        
    }
    return self;
}

- (void)layoutSubviews
{
    self.scrollerView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}


- (void)setTitleArray:(NSArray *)titleArray
{
    _titleArray = titleArray;
    if (self.titleLabels.count == titleArray.count) {
        [self updatLabels];
    } else {
        for (UIView *view in self.scrollerView.subviews) {
            NSLog(@"%@", [view class]);
            [view removeFromSuperview];
        }
        [self setTitleLabes];
    
    }

}

- (void)setTitleLabes
{
    self.titleLabels = [NSMutableArray array];
    self.offLines = [NSMutableArray array];
    
    BOOL isStatic  = YES;
    CGFloat staticW =  (kScreenWidth - 10 * 2 )/ self.titleArray.count ;
    if (kScreenWidth < 375) { // 屏幕小与iphone 6的
        isStatic = NO;
    }
    CGFloat totoalW = 0;
    CGFloat titleH = 40;
    CGFloat Y = 0;
    for (NSInteger i = 0; i < self.titleArray.count;  i ++) {
        QHStoryScrollTitleLabel *titleLabel = [[QHStoryScrollTitleLabel alloc] init];
        titleLabel.titleFont = self.titleFont;
        titleLabel.tag = i;
        titleLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleLabelClick:)];
        [titleLabel addGestureRecognizer:tap];
        //        QHStoryFilterItem *item = titleArray[i];
        //        CGSize textSize = [item.title sizeWithfont:[UIFont systemFontOfSize:15] maxSize:CGSizeMake(kScreenWidth, titleH)];
        
        NSString *title = self.titleArray[i];
        if (self.type == TitleLabelTypeText) {
            CGSize textSize = [title sizeWithfont:[UIFont systemFontOfSize:self.titleFont] maxSize:CGSizeMake(kScreenWidth, titleH)];
            CGFloat titleW = textSize.width + 30;
            [titleLabel setText:title];
            CGFloat X = totoalW;
            titleLabel.frame = CGRectMake(X, Y, titleW, titleH);
            totoalW = totoalW + titleW;
        } else {  // 富文本标签的iPhone 6 以上的直接写死
            
            NSString *pureNumbers = [[title componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet]] componentsJoinedByString:@""];
            
            NSRange range = [title rangeOfString:pureNumbers];
            NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc]initWithString:title];
            [attributeStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:self.attributedFont] range:range];
            
            titleLabel.attributedString = attributeStr;

            CGRect rect = [attributeStr boundingRectWithSize:CGSizeMake(MAXFLOAT, 100) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
            CGFloat titleW = isStatic ? staticW : (rect.size.width + 30) ;
            CGFloat X = totoalW;
            titleLabel.frame = CGRectMake(X, Y, titleW, titleH);
            totoalW = totoalW + titleW;
        
        }
        [self.scrollerView addSubview:titleLabel];
        [self.titleLabels addObject:titleLabel];
        
        if (i < self.titleArray.count - 1) {
            // 加中间的一条线
            UIView *offfLine = [[UIView alloc] init];
            offfLine.backgroundColor = [UIColor colorWithKey:kGeneralBackgroundGrayColorKey];
            offfLine.frame = CGRectMake(CGRectGetMaxX(titleLabel.frame), (titleH - 30) * 0.5, 1, 30);
            [self.scrollerView addSubview:offfLine];
            [self.offLines addObject:offfLine];
        }
        
    }
    if (totoalW >= kScreenWidth) {
        [self.scrollerView setContentSize:CGSizeMake(totoalW, 0)];
    } else {
        [self.scrollerView setContentSize:CGSizeMake(kScreenWidth, 0)];
    }
    
    
//    QHStoryScrollTitleLabel *titleLabel = self.titleLabels[0];
//    [self selectTitle:titleLabel.gestureRecognizers[0]];
}

- (void)updatLabels
{
    BOOL isStatic  = YES;
    CGFloat staticW =  (kScreenWidth - 10 * 2 )/ self.titleArray.count ;
    if (kScreenWidth < 375) { // 屏幕小与iphone 6的
        isStatic = NO;
    }
    
    CGFloat totoalW = 10;
    CGFloat titleH = 40;
    CGFloat Y = 0;
    for (NSInteger i = 0; i < self.titleLabels.count; i ++) {
        
         NSString *title = self.titleArray[i];
         QHStoryScrollTitleLabel *titleLabel = self.titleLabels[i];
        
        if (self.type == TitleLabelTypeText) {
            CGSize textSize = [title sizeWithfont:[UIFont systemFontOfSize:self.titleFont] maxSize:CGSizeMake(kScreenWidth, titleH)];
            CGFloat titleW = textSize.width + 30;
            [titleLabel setText:title];
            CGFloat X = totoalW;
            titleLabel.frame = CGRectMake(X, Y, titleW, titleH);
            totoalW = totoalW + titleW;
        } else {
            
            NSString *pureNumbers = [[title componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet]] componentsJoinedByString:@""];
            
            NSRange range = [title rangeOfString:pureNumbers];
            NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc]initWithString:title];
            [attributeStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:self.attributedFont] range:range];
            
            titleLabel.attributedString = attributeStr;
            CGRect rect = [attributeStr boundingRectWithSize:CGSizeMake(MAXFLOAT, 100) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
            CGFloat titleW = isStatic ? staticW : (rect.size.width + 30) ;
            CGFloat X = totoalW;
            titleLabel.frame = CGRectMake(X, Y, titleW, titleH);
            totoalW = totoalW + titleW;
            
        }
        
        if (i < self.offLines.count) {
            UIView *offfLine = self.offLines [i];
             offfLine.frame = CGRectMake(CGRectGetMaxX(titleLabel.frame), (titleH - 30) * 0.5, 1, 30);
        }
        
        
    }
    
    if (totoalW >= kScreenWidth) {
        [self.scrollerView setContentSize:CGSizeMake(totoalW, 0)];
    } else {
        [self.scrollerView setContentSize:CGSizeMake(kScreenWidth, 0)];
    }
    
}

- (void)titleLabelClick:(UITapGestureRecognizer *)tap
{
    QHStoryScrollTitleLabel *label = (QHStoryScrollTitleLabel *)tap.view;

    [self selectTitle:tap];
    
    if ([self.delegate respondsToSelector:@selector(storyTitleScrollerView:selectIndex:)]) {
        [self.delegate storyTitleScrollerView:self selectIndex:label.tag];
    }
}

- (void)selectTitle:(UITapGestureRecognizer *)tap
{
    QHStoryScrollTitleLabel *label = (QHStoryScrollTitleLabel *)tap.view;
    label.selected = YES;
   
    // 让对应的顶部标题居中显示
    CGPoint titleOffset = self.scrollerView.contentOffset;
    titleOffset.x = label.center.x - kScreenWidth * 0.5;
    // 左边超出处理
    if (titleOffset.x < 0) titleOffset.x = 0;
    // 右边超出处理
    CGFloat maxTitleOffsetX = self.scrollerView.contentSize.width - kScreenWidth;
    if (titleOffset.x > maxTitleOffsetX ) titleOffset.x = maxTitleOffsetX;
    
    
    
    [self.scrollerView setContentOffset:titleOffset animated:YES];
    
    for (QHStoryScrollTitleLabel *otherlabel in self.titleLabels) {
        if ([otherlabel isKindOfClass:[QHStoryScrollTitleLabel class]]) {
            if (otherlabel != label) {
                otherlabel.selected = NO;
            }
        }
        
    }
}

- (void)selectIndex:(NSInteger)selectIndex
{
    QHStoryScrollTitleLabel *titleLabel = self.titleLabels[selectIndex];
    [self selectTitle:titleLabel.gestureRecognizers[0]];

}

- (void)updateArray:(NSMutableArray *)titleArray
{
    
    
}




@end
