//
//  TitleScrollViewController.h
//  TitleScollView
//
//  Created by xiaojie on 16/10/11.
//  Copyright © 2016年 QiHao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TitleScroVcType) {
    TitleScroVcTypeText,
    TitleScroVcTypeAttributeText
};


@interface TitleScrollViewController : UIViewController

@property (assign, nonatomic) TitleScroVcType vcType;

@end
