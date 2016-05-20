//
//  GameLiveNetManager.h
//  TRProject
//
//  Created by JunChuanShi on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface GameLiveNetManager : BaseModel

+(id)getLiveColumnCompletionHandler:kCompetionHandlerBlock;
+(id)getLiveDetailDataWithPath:(NSString *)path completionhandler:kCompetionHandlerBlock;

+(id)getRoomDataWithPath:(NSString*)path CompletionHandler:kCompetionHandlerBlock;
+(id)getRoomDetailWIthUid:(NSString *)uid completionhandler:kCompetionHandlerBlock;
@end
