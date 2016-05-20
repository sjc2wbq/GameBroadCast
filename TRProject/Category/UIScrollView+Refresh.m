//
//  UIScrollView+Refresh.m
//  Day08_Beauty
//
//  Created by tarena on 16/2/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "UIScrollView+Refresh.h"

@implementation UIScrollView (Refresh)
-(void)addAnimateHeaderRefresh:(MJRefreshComponentRefreshingBlock)block{
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingBlock:block];
    UIImage *one = [UIImage imageNamed:@"1"];
    UIImage *oneImg = [UIImage imageNamed:@"01"];
    
    UIImage *two = [UIImage imageNamed:@"2"];
    UIImage *twoImg = [UIImage imageNamed:@"02"];
    UIImage *three = [UIImage imageNamed:@"3"];
    UIImage *threeImg = [UIImage imageNamed:@"03"];
    UIImage *four = [UIImage imageNamed:@"4"];
    UIImage *fourImg = [UIImage imageNamed:@"04"];
    
    
    UIImage *five = [UIImage imageNamed:@"5"];
    UIImage *six = [UIImage imageNamed:@"6"];
    UIImage *seven = [UIImage imageNamed:@"7"];
    UIImage *eight = [UIImage imageNamed:@"8"];
    UIImage *nine = [UIImage imageNamed:@"9"];
    UIImage *ten = [UIImage imageNamed:@"10"];
    NSArray *progress = @[oneImg,twoImg,threeImg,fourImg];
    NSArray *begin = @[one,two,three,four,five,six,seven,eight,nine,ten];
    
    [header setImages:begin forState:MJRefreshStateIdle];
    [header setImages:@[[UIImage imageNamed:@"10"]] forState:MJRefreshStatePulling];
    [header setImages:progress forState:MJRefreshStateRefreshing];
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.hidden = YES;
    CGRect frame = header.frame;
    frame.size.width = 30;
    header.frame = frame;
    self.mj_header = header;
}
/** 添加头部刷新 */
- (void)addHeaderRefresh:(MJRefreshComponentRefreshingBlock)block{
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:block];
}
/** 添加脚部自动刷新 */
- (void)addAutoFooterRefresh:(MJRefreshComponentRefreshingBlock)block{
    self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:block];
}
/** 添加脚步返回刷新 */
- (void)addBackFooterRefresh:(MJRefreshComponentRefreshingBlock)block{
    self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:block];
}
/** 结束头部刷新 */
- (void)endHeaderRefresh{
    [self.mj_header endRefreshing];
}
/** 结束脚部刷新 */
- (void)endFooterRefresh{
    [self.mj_footer endRefreshing];
}
/** 开始头部刷新 */
- (void)beginHeaderRefresh{
    [self.mj_header beginRefreshing];
}
/** 开始脚部刷新 */
- (void)beginFooterRefresh{
    [self.mj_footer beginRefreshing];
}
@end












