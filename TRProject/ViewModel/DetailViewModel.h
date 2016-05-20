//
//  DetailViewModel.h
//  TRProject
//
//  Created by JunChuanShi on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+ViewModel.h"
@interface DetailViewModel : NSObject
@property(nonatomic) NSInteger page;
@property(nonatomic)  NSMutableArray *detailDataList;
@property(nonatomic) NSInteger detailNum;
@property(nonatomic) NSInteger pageCount;
//栏目详情页的参数：name
@property(nonatomic) NSString *gameName;

-(NSString *)titleAtRow:(NSInteger)row;
-(NSString *)hostNameAtRow:(NSInteger)row;
-(NSString *)viewCountAtRow:(NSInteger)row;

-(NSURL *)coverImgAtRow:(NSInteger)row;
-(instancetype)initWithName:(NSString *)name;

//直播详情页的参数uid
-(NSString *)uidAtRow:(NSInteger)row;
-(void)getRoomWithRequestMode:(RequestMode)requestMode completionHanle:(void (^)(NSError *error))completionHandle;

@end
