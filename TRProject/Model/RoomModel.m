//
//  RoomModel.m
//  TRProject
//
//  Created by JunChuanShi on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "RoomModel.h"

@implementation RoomModel


+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [RoomDataModel class]};
}
@end
@implementation RoomRecommendModel

+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [RoomDataModel class]};
}

@end


@implementation RoomRecommendDataModel

@end


@implementation RoomRecommendDataLink_ObjectModel

@end


@implementation RoomDataModel

@end


