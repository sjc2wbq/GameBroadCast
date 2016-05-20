//
//  RoomDetailViewModel.h
//  TRProject
//
//  Created by JunChuanShi on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RoomDetailModel.h"
#import "NSObject+ViewModel.h"
@interface RoomDetailViewModel : NSObject
@property(nonatomic)  RoomDetailModel *roomDetail;
@property(nonatomic) NSString *roomHostName;
@property(nonatomic) NSString *roomTitle;
@property(nonatomic) NSString *roomViewCount;
@property(nonatomic) NSString *uid;
-(NSURL *)getHeaderImg;
-(void)getRoomDetailDataCompletionhandler:(void(^)(NSError *error))completionhandler;
-(instancetype)initWithUid:(NSString *)uid;


@end
