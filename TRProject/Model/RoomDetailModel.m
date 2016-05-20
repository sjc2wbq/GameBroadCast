//
//  RoomDetailModel.m
//  TRProject
//
//  Created by JunChuanShi on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "RoomDetailModel.h"

@implementation RoomDetailModel


+ (NSDictionary *)objectClassInArray{
    return @{@"rank_total" : [Rank_Total class], @"cross" : [Cross class], @"admins" : [Admins class], @"rank_week" : [Rank_Week class]};
}
@end
@implementation Live

@end


@implementation Ws

@end


@implementation Hls
+(NSDictionary *)replaceKeyFromPropertyName{
    return @{@"hlsTwo":@"2",@"hlsThree":@"3",@"hlsFour":@"4",@"hlsFive":@"5"};
}
@end

@implementation LiveWsHlsThree
@end
@implementation LiveWsHlsFour
@end
@implementation LiveWsHlsFive
@end
@implementation LiveWsHlsTwo
@end


@implementation Rtmp
+(NSDictionary *)replaceKeyFromPropertyName{
    return @{@"rtmpTwo":@"2",@"rtmpThree":@"3",@"rtmpFour":@"4",@"rtmpFive":@"5"};
}
@end

@implementation LiveWsRtmpTwo
@end
@implementation LiveWsRtmpThree
@end
@implementation LiveWsRtmpFour
@end

@implementation LiveWsRtmpFive
@end


@implementation Flv
+(NSDictionary *)replaceKeyFromPropertyName{
    return @{@"flvTwo":@"2",@"flvThree":@"3",@"flvFour":@"4",@"flvFive":@"5"};
}
@end


@implementation LiveWsFlvTwo
@end
@implementation LiveWsFlvThree
@end
@implementation LiveWsFlvFour
@end
@implementation LiveWsFlvFive
@end


@implementation Rank_Total

@end


@implementation Cross

@end


@implementation Admins

@end


@implementation Rank_Week

@end


