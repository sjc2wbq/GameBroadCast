//
//  ColumnVIewModel.m
//  TRProject
//
//  Created by JunChuanShi on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ColumnVIewModel.h"
#import "ColumnModel.h"
#import "GameLiveNetManager.h"
@implementation ColumnVIewModel

-(NSInteger )columnNum{
   return self.columnDataList.count;
}

-(ColumnModel*)columnModelAtRow:(NSInteger)row{
    return self.columnDataList[row];
}
-(NSString *)titleAtRow:(NSInteger)row{
    return [self columnModelAtRow:row].name;
}
-(NSURL *)coverImgAtRow:(NSInteger)row{
    NSString *imgPath = [self columnModelAtRow:row].image;
    return [NSURL URLWithString:imgPath];
}
-(NSString *)gameSlugAtRow:(NSInteger)row{
    return [self columnModelAtRow:row].slug;
}
-(void)getDataWithRequestMode:(RequestMode)requestMode completionHanle:(void (^)(NSError *))completionHandle{
    self.dataTask = [GameLiveNetManager getLiveColumnCompletionHandler:^(NSArray *model, NSError *error) {
        self.columnDataList = model;
        completionHandle(error);
    }];
}


@end
