//
//  UIView+Extension.m
//  Community
//
//  Created by KWAME on 14-9-22.
//  Copyright (c) 2014年 sxw. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)
@dynamic minX , minY , midX , midY , maxX , maxY ,localMaxX,localMaxY,localMidX,localMidY,localMinX,localMinY ;
-(void)setX:(CGFloat)x

{
    
    CGRect frame = self.frame ;
    
    frame.origin.x = x;
    
    self.frame = frame ;
    
}

-(CGFloat)x

{
    
    return self.frame.origin.x ;
    
}



-(void)setY:(CGFloat)y

{
    
    CGRect frame = self.frame ;
    
    frame.origin.y = y ;
    
    self.frame = frame ;
    
}

-(CGFloat)y

{
    
    return self.frame.origin.y ;
    
}



-(void)setWidth:(CGFloat)width

{
    
    CGRect frame = self.frame ;
    
    frame.size.width = width ;
    
    self.frame = frame ;
    
}

-(CGFloat)width

{
    
    return self.frame.size.width ;
    
}



-(void)setHeight:(CGFloat)height

{
    
    CGRect frame = self.frame ;
    
    frame.size.height = height ;
    
    self.frame = frame ;
    
}

-(CGFloat)height

{
    
    return self.frame.size.height ;
    
}



-(void)setSize:(CGSize)size

{
    
    CGRect frame = self.frame ;
    
    frame.size = size ;
    
    self.frame = frame ;
    
}

-(CGSize)size

{
    
    return self.frame.size ;
    
}



-(void)setOrigin:(CGPoint)origin

{
    
    CGRect frame = self.frame ;
    
    frame.origin = origin ;
    
    self.frame = frame ;
    
}

-(CGPoint)origin

{
    
    return self.frame.origin ;
    
}



-(CGFloat)minX

{
    
    return CGRectGetMinX(self.frame) ;
    
}

-(CGFloat)minY

{
    
    return CGRectGetMinY(self.frame) ;
    
}

-(CGFloat)midX

{
    
    //    return self.center.x ;
    
    return CGRectGetMidX(self.frame) ;
    
}

-(CGFloat)midY

{
    
    //    return self.center.y ;
    
    return CGRectGetMidY(self.frame) ;
    
}

-(CGFloat)maxX

{
    
    return CGRectGetMaxX(self.frame) ;
    
}

-(CGFloat)maxY

{
    
    return CGRectGetMaxY(self.frame) ;
    
}



- (CGFloat)localMinX

{
    
    return CGRectGetMinX(self.bounds) ;
    
}

- (CGFloat)localMinY

{
    
    return CGRectGetMinY(self.bounds) ;
    
}

- (CGFloat)localMidX

{
    
    return CGRectGetMidX(self.bounds) ;
    
}

- (CGFloat)localMidY

{
    
    return CGRectGetMidY(self.bounds) ;
    
}

- (CGFloat)localMaxX

{
    
    return CGRectGetMaxX(self.bounds) ;
    
}

- (CGFloat)localMaxY

{
    
    return CGRectGetMaxY(self.bounds) ;
    
}


- (UIImage *)rn_screenshot {
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    // helps w/ our colors when blurring
    // feel free to adjust jpeg quality (lower = higher perf)
    NSData *imageData = UIImageJPEGRepresentation(image, 0.75);
    image = [UIImage imageWithData:imageData];
    
    return image;
}

- (UIImage *)rn_screenshotForScrollViewWithContentOffset:(CGPoint)contentOffset {
    UIGraphicsBeginImageContext(self.bounds.size);
    //need to translate the context down to the current visible portion of the scrollview
    CGContextTranslateCTM(UIGraphicsGetCurrentContext(), 0, -contentOffset.y);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // helps w/ our colors when blurring
    // feel free to adjust jpeg quality (lower = higher perf)
    NSData *imageData = UIImageJPEGRepresentation(image, 0.55);
    image = [UIImage imageWithData:imageData];
    
    return image;
}


-(void)addGestureRecognizer:(id)view action:(SEL)name{
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:name];
    [view addGestureRecognizer:gesture];
}

-(void)addGestureRecognizer{
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(finishEditing)];
    [self addGestureRecognizer:gesture];
}
-(void)finishEditing{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];//关闭键盘
}
@end
