//
//  RoomDetailViewModel.m
//  TRProject
//
//  Created by JunChuanShi on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "RoomDetailViewModel.h"
#import "GameLiveNetManager.h"
@implementation RoomDetailViewModel
-(void)getRoomDetailDataCompletionhandler:(void (^)(NSError *))completionhandler{
    self.dataTask = [GameLiveNetManager getRoomDetailWIthUid:self.uid completionhandler:^(RoomDetailModel *model, NSError *error) {
        self.roomDetail = model;
    }];
}
-(instancetype)init{
    NSAssert(NO, @"must use initWithUid");
    return nil;
}
-(NSURL *)getHeaderImg{
    return [NSURL URLWithString:self.roomDetail.avatar];
}
-(NSString *)roomTitle{
    return self.roomDetail.title;
}
-(NSString *)roomHostName{
    return self.roomDetail.nick;
}
-(NSString *)roomViewCount{
    CGFloat count = self.roomDetail.view.floatValue;
    if (count>9999) {
        count = count/10000.0;
        NSString *viewCout = [NSString stringWithFormat:@"%1.1f万",count];
        return viewCout;
    }
    return self.roomDetail.view;
}
-(instancetype)initWithUid:(NSString *)uid{
    if (self = [super init]) {
        self.uid = uid;
    }
    return self;
}
- ( RoomDetailModel *)roomDetail {
    if(_roomDetail == nil) {
        _roomDetail = [[ RoomDetailModel alloc] init];
    }
    return _roomDetail;
}
@end
