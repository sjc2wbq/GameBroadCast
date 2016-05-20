//
//  GameLiveNetManager.m
//  TRProject
//
//  Created by JunChuanShi on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "GameLiveNetManager.h"
#import "ColumnModel.h"
#import "DetailModel.h"
#import "RoomModel.h"
#import "RoomDetailModel.h"
@implementation GameLiveNetManager
+(id)getLiveColumnCompletionHandler:(void (^)(id, NSError *))completionHandler{
    return [self GET:kColumnPath parameters:nil progress:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([ColumnModel parse:responseObj],error);
    }];
}
//+(id)getLiveDetailDataWithName:(NSString *)name completionhandler:(void (^)(id, NSError *))completionHandler{
//    NSString *path = [NSString stringWithFormat:kLiveDetailPath,name];
//    return [self GET:path parameters:nil progress:nil completionHandler:^(id responseObj, NSError *error) {
//        completionHandler([DetailModel parse:responseObj],error);
//    }];
//}
+(id)getLiveDetailDataWithPath:(NSString *)path completionhandler:(void (^)(id, NSError *))completionHandler{
    return [self GET:path parameters:nil progress:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([DetailModel parse:responseObj],error);
    }];
}
+(id)getRoomDataWithPath:(NSString *)path CompletionHandler:(void (^)(id, NSError *))completionHandler{
    return [self GET:path parameters:nil progress:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([RoomModel parse:responseObj],error);
    }];
}
+(id)getRoomDetailWIthUid:(NSString *)uid completionhandler:(void (^)(id, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:kRoomDetailPath,uid];
    return [self GET:path parameters:nil progress:nil completionHandler:^(id responseObj, NSError *error) {
        id model = [RoomDetailModel parse:responseObj];
        completionHandler([RoomDetailModel parse:responseObj],error);
    }];
}
@end
