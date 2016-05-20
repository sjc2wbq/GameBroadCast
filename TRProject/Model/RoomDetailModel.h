//
//  RoomDetailModel.h
//  TRProject
//
//  Created by JunChuanShi on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class Live,Ws,Hls,LiveWsFlvThree,LiveWsFlvFour,LiveWsFlvTwo,LiveWsFlvFive,Rtmp,LiveWsHlsThree,LiveWsHlsFour,LiveWsHlsTwo,LiveWsHlsFive,Flv,LiveWsRtmpThree,LiveWsRtmpFour,LiveWsRtmpTwo,LiveWsRtmpFive,Rank_Total,Cross,Admins,Rank_Week;
@interface RoomDetailModel : BaseModel

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *weight;

@property (nonatomic, copy) NSString *last_play_at;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) BOOL play_status;

@property (nonatomic, copy) NSString *category_name;

@property (nonatomic, strong) Live *live;

@property (nonatomic, assign) BOOL forbid_status;

@property (nonatomic, strong) NSArray *hot_word;

@property (nonatomic, strong) NSArray<Admins *> *admins;

@property (nonatomic, strong) NSArray<Cross *> *cross;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, strong) NSArray<Rank_Week *> *rank_week;

@property (nonatomic, assign) BOOL is_star;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *nick;

@property (nonatomic, strong) NSArray *notice;

@property (nonatomic, strong) NSArray<Rank_Total *> *rank_total;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *video_quality;

@property (nonatomic, copy) NSString *category_id;

@property (nonatomic, assign) NSInteger follow;

@end
@interface Live : NSObject

@property (nonatomic, strong) Ws *ws;

@end

@interface Ws : NSObject

@property (nonatomic, copy) NSString *def_mobile;

@property (nonatomic, strong) Rtmp *rtmp;

@property (nonatomic, copy) NSString *def_pc;

@property (nonatomic, strong) Hls *hls;

@property (nonatomic, strong) Flv *flv;

@end

@interface Hls : NSObject

@property (nonatomic, strong) LiveWsHlsThree *hlsThree;

@property (nonatomic, strong) LiveWsHlsFive *hlsFive;

@property (nonatomic, strong) LiveWsHlsFour *hlsFour;

@property (nonatomic, assign) NSInteger main_pc;

@property (nonatomic, strong) LiveWsHlsTwo *hlsTwo;

@property (nonatomic, assign) NSInteger main_mobile;

@end
@interface LiveWsHlsTwo : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *src;
@end
@interface LiveWsHlsThree : LiveWsHlsTwo
@end
@interface LiveWsHlsFour : LiveWsHlsTwo
@end
@interface LiveWsHlsFive : LiveWsHlsTwo

@end

@interface Rtmp : NSObject

@property (nonatomic, strong) LiveWsRtmpThree *rtmpThree;

@property (nonatomic, strong) LiveWsRtmpFive *rtmpFive;

@property (nonatomic, strong) LiveWsHlsFour *rtmpFour;

@property (nonatomic, assign) NSInteger main_pc;

@property (nonatomic, strong) LiveWsRtmpTwo *rtmpTwo;

@property (nonatomic, assign) NSInteger main_mobile;

@end

@interface LiveWsRtmpThree : LiveWsHlsTwo
@end
@interface LiveWsRtmpFive : LiveWsHlsTwo
@end
@interface LiveWsRtmpTwo : LiveWsHlsTwo
@end
@interface LiveWsRtmpFour : LiveWsHlsTwo
@end

@interface Flv : NSObject

@property (nonatomic, strong) LiveWsFlvThree *flvThree;

@property (nonatomic, strong) LiveWsFlvFive *flvFive;

@property (nonatomic, strong) LiveWsFlvFour *flvFour;

@property (nonatomic, assign) NSInteger main_pc;

@property (nonatomic, strong) LiveWsFlvTwo *flvTwo;

@property (nonatomic, assign) NSInteger main_mobile;

@end

@interface LiveWsFlvTwo : LiveWsHlsTwo
@end
@interface LiveWsFlvThree : LiveWsHlsTwo
@end
@interface LiveWsFlvFour : LiveWsHlsTwo
@end
@interface LiveWsFlvFive : LiveWsHlsTwo
@end

@interface Rank_Total : NSObject

@property (nonatomic, copy) NSString *score;

@property (nonatomic, copy) NSString *rank;

@property (nonatomic, copy) NSString *send_uid;

@property (nonatomic, copy) NSString *send_nick;

@end

@interface Cross : NSObject

@property (nonatomic, copy) NSString *nick;

@property (nonatomic, copy) NSString *weight_add;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *level;

@property (nonatomic, copy) NSString *follow_add;

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *check;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, copy) NSString *play_count;

@property (nonatomic, copy) NSString *negative_view;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *grade;

@property (nonatomic, copy) NSString *coin;

@property (nonatomic, copy) NSString *coin_add;

@property (nonatomic, copy) NSString *default_image;

@property (nonatomic, copy) NSString *create_at;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *category_name;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *recommend_image;

@property (nonatomic, copy) NSString *locked_view;

@property (nonatomic, copy) NSString *last_end_at;

@property (nonatomic, copy) NSString *video_quality;

@property (nonatomic, copy) NSString *first_play_at;

@property (nonatomic, copy) NSString *follow;

@property (nonatomic, copy) NSString *follow_bak;

@property (nonatomic, copy) NSString *play_at;

@property (nonatomic, copy) NSString *weight;

@property (nonatomic, copy) NSString *app_shuffling_image;

@property (nonatomic, copy) NSString *category_id;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *category_slug;

@end

@interface Admins : NSObject

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, copy) NSString *create_at;

@property (nonatomic, copy) NSString *nick;

@end

@interface Rank_Week : NSObject

@property (nonatomic, copy) NSString *score;

@property (nonatomic, copy) NSString *rank;

@property (nonatomic, copy) NSString *send_uid;

@property (nonatomic, copy) NSString *send_nick;

@end

