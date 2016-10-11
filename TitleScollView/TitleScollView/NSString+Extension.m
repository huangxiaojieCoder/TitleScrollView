//
//  NSString+Extension.m
//
//
//  Created by apple on 30/06/14.
//  Copyright (c) 2014年 xiaojie. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

// 专门用来计算文本所占的空间宽和高
//- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)
- (CGSize)sizeWithfont:(UIFont *)font maxSize:(CGSize)maxSize
{
    //
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (NSString *)urlEncode {
    
     NSString *endocedString =  CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]", NULL, kCFStringEncodingUTF8));
    
    return endocedString;
//    NSString *urlEncode = [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    return urlEncode;
}



@end
