//
//  DetailModel.h
//  TRProject
//
//  Created by JunChuanShi on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class DetailDataModel;
@interface DetailModel : BaseModel

@property (nonatomic, assign) NSInteger page;

@property (nonatomic, strong) NSArray<DetailDataModel *> *data;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, assign) NSInteger size;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger pageCount;

@end
@interface DetailDataModel : NSObject

@property (nonatomic, copy) NSString *nick;

@property (nonatomic, copy) NSString *weight_add;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *level;

@property (nonatomic, copy) NSString *follow_add;

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *check;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, copy) NSString *play_count;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *negative_view;

@property (nonatomic, copy) NSString *grade;

@property (nonatomic, copy) NSString *coin;

@property (nonatomic, copy) NSString *coin_add;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *create_at;

@property (nonatomic, copy) NSString *category_name;

@property (nonatomic, copy) NSString *default_image;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *recommend_image;

@property (nonatomic, copy) NSString *locked_view;

@property (nonatomic, copy) NSString *last_end_at;

@property (nonatomic, copy) NSString *video_quality;

@property (nonatomic, copy) NSString *first_play_at;

@property (nonatomic, assign) NSInteger follow;

@property (nonatomic, copy) NSString *follow_bak;

@property (nonatomic, copy) NSString *app_shuffling_image;

@property (nonatomic, copy) NSString *category_id;

@property (nonatomic, copy) NSString *weight;

@property (nonatomic, copy) NSString *play_at;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *category_slug;

@end

