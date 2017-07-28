//
//  DrawOutView.m
//  库存管理
//
//  Created by liuyang on 2017/7/19.
//  Copyright © 2017年 同牛科技. All rights reserved.
//

#import "DrawOutView.h"

@implementation DrawOutView
{
    CGFloat _with;
    CGFloat _hight;
}
+(id)drawOutView{
  return [[self alloc] initWithFrame:CGRectZero];
}

-(id)initWithFrame:(CGRect)frame
{
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        _with = 240*(kScreen_Width/375);
        _hight = _with;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.画图
    CGContextAddEllipseInRect(ctx, CGRectMake(20*(kScreen_Width/375), 20*(kScreen_Width/375), 200*(kScreen_Width/375), 200*(kScreen_Width/375)));
    [UIColorFromRGB(0xEE2041) set];
    
    // 3.渲染
    CGContextFillPath(ctx);
    
    //设置空心圆的线条宽度
    CGContextSetLineWidth(ctx, 34*(kScreen_Width/375));
    CGContextAddEllipseInRect(ctx, CGRectMake(20*(kScreen_Width/375), 20*(kScreen_Width/375), 200*(kScreen_Width/375), 200*(kScreen_Width/375)));
    [UIColoralpFromRGB(0xEE2041) set];
    
    CGContextStrokePath(ctx);
    
}
@end
