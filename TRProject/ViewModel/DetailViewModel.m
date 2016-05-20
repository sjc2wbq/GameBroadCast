//
//  DetailViewModel.m
//  TRProject
//
//  Created by JunChuanShi on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DetailViewModel.h"
#import "DetailModel.h"
#import "GameLiveNetManager.h"
#import "RoomModel.h"
@implementation DetailViewModel
-(instancetype)initWithName:(NSString *)name{
    if (self =[super init]) {
        self.gameName = name;
        self.page = 0;
    }
    return self;
}
-(instancetype)init{
    NSAssert(NO, @"must use initWithName to init");
    return nil;
}
-(NSInteger)detailNum{
    return self.detailDataList.count;
}
-(NSString *)titleAtRow:(NSInteger)row{
    return [self detailModelAtRow:row].title;
}
-(NSString *)hostNameAtRow:(NSInteger)row{
    return  [self detailModelAtRow:row].nick;
}

-(NSString *)viewCountAtRow:(NSInteger)row{
    CGFloat count = [self detailModelAtRow:row].view.floatValue;
    if (count>9999) {
        count = count/10000.0;
        NSString *viewCount = [NSString stringWithFormat:@"%1.1f万",count];
        return viewCount;
    }else{
        return [self detailModelAtRow:row].view;
    }
    
}

-(NSURL *)coverImgAtRow:(NSInteger)row{
    NSString *imgPath = [self detailModelAtRow:row].thumb;
    return [NSURL URLWithString:imgPath];
}
//Room(直播列表的model)包含了栏目（column）的详情页model（DetailModel）
-(RoomDataModel *)detailModelAtRow:(NSInteger)row{
    return self.detailDataList[row];
}
-(void)getDataWithRequestMode:(RequestMode)requestMode completionHanle:(void (^)(NSError *))completionHandle{
    NSString *path = [NSString stringWithFormat:kLiveDetailPath,self.gameName,@""];
    switch (requestMode) {
        case RequestModeRefresh: {
            self.page = 0;
            path = [NSString stringWithFormat:kLiveDetailPath,self.gameName,@""];
            [self.detailDataList removeAllObjects];
            break;
        }
        case RequestModeMore: {
            self.page ++;
                path =  [NSString stringWithFormat:kLiveDetailPath,self.gameName,[NSString stringWithFormat:@"_%ld",self.page]];
            break;
        }
    }
    self.dataTask = [GameLiveNetManager getLiveDetailDataWithPath:path completionhandler:^(DetailModel *model, NSError *error) {
        if (!error) {
            //self.pageCount = model.pageCount;
                [self.detailDataList addObjectsFromArray:model.data];
        }
        completionHandle(error);
    }];
}




-(void)getRoomWithRequestMode:(RequestMode)requestMode completionHanle:(void (^)(NSError *))completionHandle{
    NSString *path = [NSString stringWithFormat:kLiveRoomPath,@""];
    switch (requestMode) {
        case RequestModeRefresh: {
            self.page = 0;
            path = [NSString stringWithFormat:kLiveRoomPath,@""];
            [self.detailDataList removeAllObjects];
            break;
        }
        case RequestModeMore: {
            self.page ++;
            if (self.pageCount>1) {
                path =  [NSString stringWithFormat:kLiveRoomPath,[NSString stringWithFormat:@"_%ld",self.page]];
            }
            break;
        }
    }
    self.dataTask = [GameLiveNetManager getRoomDataWithPath:path CompletionHandler:^(RoomModel *model, NSError *error) {
        self.pageCount = model.pageCount;
        if (self.page<self.pageCount) {
            [self.detailDataList addObjectsFromArray:model.data];
        }
        completionHandle(error);
    }];
    
}

-(NSString *)uidAtRow:(NSInteger)row{
    return [self detailModelAtRow:row].uid;
}
- ( NSMutableArray *)detailDataList {
    if(_detailDataList == nil) {
        _detailDataList = [[ NSMutableArray alloc] init];
    }
    return _detailDataList;
}

@end
