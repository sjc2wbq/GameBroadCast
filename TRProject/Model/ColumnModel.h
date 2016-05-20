//
//  ColumnModel.h
//  TRProject
//
//  Created by JunChuanShi on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface ColumnModel : BaseModel

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *first_letter;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, assign) NSInteger prompt;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, copy) NSString *name;

@end
