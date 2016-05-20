//
//  DetailViewController.h
//  TRProject
//
//  Created by JunChuanShi on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ListKind) {
    ListKindColumnDetail,
    ListKindLiveRoom,
};
@interface DetailViewController : UIViewController
@property(nonatomic) NSString *name;
@property(nonatomic) ListKind kind;
-(instancetype)initWithKind:(ListKind)kind;
@end
