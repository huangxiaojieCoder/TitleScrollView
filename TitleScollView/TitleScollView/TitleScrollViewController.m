//
//  TitleScrollViewController.m
//  TitleScollView
//
//  Created by xiaojie on 16/10/11.
//  Copyright © 2016年 QiHao. All rights reserved.
//

#import "TitleScrollViewController.h"
#import "QHStoryTitleScrollerView.h"

@interface TitleScrollViewController ()<QHStoryTitleScrollerViewDelegate>
@property (strong, nonatomic) QHStoryTitleScrollerView *titleScrollView;

@end

@implementation TitleScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    QHStoryTitleScrollerView *titleScrollView = [[QHStoryTitleScrollerView alloc] init];
    titleScrollView.delegate = self;
    titleScrollView.frame = CGRectMake(0, 0, kScreenWidth, 45);
    titleScrollView.backgroundColor = [UIColor whiteColor];
    titleScrollView.titleFont = 13;
    titleScrollView.attributedFont = 17;
    if (self.vcType == TitleScroVcTypeText) {
         titleScrollView.type = TitleLabelTypeText;
        titleScrollView.titleArray = [NSMutableArray arrayWithObjects:@"全部",@"知识",@"技能",@"价值观",@"包容",nil];
    }
   
    if (self.vcType == TitleScroVcTypeAttributeText) {
        titleScrollView.type = TitleLabelTypeAttributedText;
           titleScrollView.titleArray = [NSMutableArray arrayWithObjects:@"全部",@"知识50%",@"技能180%",@"价值观40%",nil];
    }
   
    
    
    [self.view addSubview:titleScrollView];
    self.titleScrollView = titleScrollView;
    
    [self.titleScrollView selectIndex:0];
    
    
    
}

- (void)storyTitleScrollerView:(QHStoryTitleScrollerView *)storyTitleScrolllerView selectIndex:(NSInteger)selectIndex
{
    NSLog(@"%ld", selectIndex);
}



@end
