//
//  ScanViewController.m
//  库存管理
//
//  Created by liuyang on 2017/7/7.
//  Copyright © 2017年 同牛科技. All rights reserved.
//

#import "ScanViewController.h"
#import "ScanBarCodeController.h"
#import "DrawIntoView.h"
#import "DrawOutView.h"
@interface ScanViewController ()
@property (nonatomic, copy) NSArray *results;

@end

@implementation ScanViewController
{
    UIImageView * _lineImg;
    CGFloat _with;
    CGFloat _hight;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self createUI];
}

-(void)createUI
{
    //话中间的分割线
    [self drawLine];
    //创建进库，入库
    [self drawIntoView];
    [self drawOutView];
    
}

-(void)drawLine
{
    // 创建一个imageView 高度是你想要的虚线的高度 一般设为2
    _lineImg = [[UIImageView alloc] init];
    _lineImg.frame = CGRectMake(66,(kScreen_Height-64-49)/2+64, kScreen_Width-66*2, 3);
    // 调用方法 返回的iamge就是虚线
    _lineImg.image = [self drawLineByImageView:_lineImg];
    // 添加到控制器的view上
    [self.view addSubview:_lineImg];

}

-(void)drawIntoView
{
    _with = 240*(kScreen_Width/375);
    _hight = _with;
    DrawIntoView * drawIntoView = [DrawIntoView drawIntoView];

    drawIntoView.frame = CGRectMake((kScreen_Width-_with)/2, (kScreen_Height-64-49)/2+64-_hight-18*(kScreen_Width/375), _with, _hight);
    [self.view addSubview:drawIntoView];
    
    UIImageView * scanImage = [[UIImageView alloc]init];
    scanImage.image = [UIImage imageNamed:@"扫码页面-扫码icon大图"];
    [drawIntoView addSubview:scanImage];
    scanImage.frame = CGRectMake(86*(kScreen_Width/375), 69*(kScreen_Width/375), 68*(kScreen_Width/375), 68*(kScreen_Width/375));
    scanImage.userInteractionEnabled = YES;
    UILabel * scanLab = [[UILabel alloc]init];
    scanLab.text = @"开始扫描";
    [drawIntoView addSubview:scanLab];
    scanLab.frame = CGRectMake(76*(kScreen_Width/375), 151*(kScreen_Width/375), 88*(kScreen_Width/375), 30*(kScreen_Width/375));
    scanLab.font = [UIFont systemFontOfSize:21*(kScreen_Width/375)];
    scanLab.textColor = [UIColor whiteColor];
    scanLab.textAlignment = NSTextAlignmentCenter;
    
        UIButton * intoLibraryBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        intoLibraryBtn.frame = CGRectMake(20*DeviceWH, 20*DeviceWH, 200*DeviceWH, 200*DeviceWH);
        [drawIntoView addSubview:intoLibraryBtn];
        [intoLibraryBtn setTitle:nil forState:UIControlStateNormal];
        [intoLibraryBtn addTarget:self action:@selector(intoLibraryBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [intoLibraryBtn setBackgroundColor:[UIColor clearColor]];
}

-(void)drawOutView
{
    DrawOutView * drawOutView = [DrawOutView drawOutView];

    drawOutView.frame = CGRectMake((kScreen_Width-_with)/2, (kScreen_Height-64-49)/2+18+64*(kScreen_Width/375), _with, _hight);
    [self.view addSubview:drawOutView];
    
    UIImageView * scanImage = [[UIImageView alloc]init];
    scanImage.image = [UIImage imageNamed:@"扫码页面-扫码icon大图"];
    [drawOutView addSubview:scanImage];
    scanImage.frame = CGRectMake(86*(kScreen_Width/375), 69*(kScreen_Width/375), 68*(kScreen_Width/375), 68*(kScreen_Width/375));
    scanImage.userInteractionEnabled = YES;
    UILabel * scanLab = [[UILabel alloc]init];
    scanLab.text = @"开始扫描";
    [drawOutView addSubview:scanLab];
    scanLab.frame = CGRectMake(76*(kScreen_Width/375), 151*(kScreen_Width/375), 88*(kScreen_Width/375), 30*(kScreen_Width/375));
    scanLab.font = [UIFont systemFontOfSize:21*(kScreen_Width/375)];
    scanLab.textColor = [UIColor whiteColor];
    scanLab.textAlignment = NSTextAlignmentCenter;
    
    UIButton * outLibraryBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    outLibraryBtn.frame = CGRectMake(20*DeviceWH, 20*DeviceWH, 200*DeviceWH, 200*DeviceWH);
    [drawOutView addSubview:outLibraryBtn];
    [outLibraryBtn setTitle:nil forState:UIControlStateNormal];
    [outLibraryBtn addTarget:self action:@selector(outLibraryBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [outLibraryBtn setBackgroundColor:[UIColor clearColor]];
}
// 返回虚线image的方法
- (UIImage *)drawLineByImageView:(UIImageView *)imageView {
    UIGraphicsBeginImageContext(imageView.frame.size);   //开始画线 划线的frame
    [imageView.image drawInRect:CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height)];
    //设置线条终点形状
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    // 5是每个虚线的长度  1是高度
    CGFloat arr[] = {8,3};
    CGContextRef line = UIGraphicsGetCurrentContext();
    // 设置颜色
    CGContextSetStrokeColorWithColor(line, UIColorFromRGB(0xD0D4DC).CGColor);
    
    CGContextSetLineDash(line, 0, arr, 2);  //画虚线
    CGContextMoveToPoint(line, 0.0, 2.0);    //开始画线
    CGContextAddLineToPoint(line, kScreen_Width - 10, 2.0);
    CGContextStrokePath(line);
    // UIGraphicsGetImageFromCurrentImageContext()返回的就是image
    return UIGraphicsGetImageFromCurrentImageContext();
}




-(void)intoLibraryBtnClick
{
    ScanBarCodeController * scVC = [[ScanBarCodeController alloc]init];
    [self.navigationController pushViewController:scVC animated:YES];

}

-(void)outLibraryBtnClick
{
    ScanBarCodeController * scVC = [[ScanBarCodeController alloc]init];
    [self.navigationController pushViewController:scVC animated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
     [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
