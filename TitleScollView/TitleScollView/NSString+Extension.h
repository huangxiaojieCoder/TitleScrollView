//
//  NSString+Extension.h
//  
//
//  Created by apple on 30/06/14.
//  Copyright (c) 2014年 xiaojie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extension)

- (CGSize)sizeWithfont:(UIFont *)font maxSize:(CGSize)maxSize;
- (NSString *)urlEncode;


@end
