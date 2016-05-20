//
//  ColumnVIewModel.h
//  TRProject
//
//  Created by JunChuanShi on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "PSCollectionViewCell.h"
#import "NSObject+ViewModel.h"

@interface ColumnVIewModel : PSCollectionViewCell
@property(nonatomic) NSInteger columnNum;
@property(nonatomic) NSArray *columnDataList;
-(NSString *)titleAtRow:(NSInteger)row;
-(NSURL *)coverImgAtRow:(NSInteger)row;
-(NSString *)gameSlugAtRow:(NSInteger)row;
@end
