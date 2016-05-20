//
//  LiveDetailViewCell.m
//  TRProject
//
//  Created by JunChuanShi on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LiveDetailViewCell.h"

@implementation LiveDetailViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}
- (UIImageView *)coverImg {
    if(_coverImg == nil) {
        _coverImg = [[UIImageView alloc] init];
        _coverImg.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_coverImg];
        [_coverImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.tileLb.mas_top);
            make.left.right.top.equalTo(0);
        }];
    }
    return _coverImg;
}
- (UIView *)blackLine {
    if(_blackLine == nil) {
        _blackLine = [[UIView alloc] init];
        _blackLine.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        [self.coverImg addSubview:_blackLine];
        [_blackLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.bottom.equalTo(self.coverImg.mas_bottom);
            make.height.equalTo(25);
        }];
    }
    return _blackLine;
}

- (UILabel *)tileLb {
    if(_tileLb == nil) {
        _tileLb = [[UILabel alloc] init];
        _tileLb.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_tileLb];
        [_tileLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(30);
        }];
    }
    return _tileLb;
}

- (UILabel *)viewCount {
    if(_viewCount == nil) {
        _viewCount = [[UILabel alloc] init];
        _viewCount.textAlignment = NSTextAlignmentRight;
        _viewCount.backgroundColor = [UIColor clearColor];
        _viewCount.textColor = [UIColor whiteColor];
        _viewCount.font = [UIFont systemFontOfSize:12];
        [self.blackLine addSubview:_viewCount];
        [_viewCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.lessThanOrEqualTo(60);
            make.bottom.equalTo(0);
            make.right.equalTo(-5);
            make.height.equalTo(25);
        }];
    }
    return _viewCount;
}

- (UILabel *)hostName {
    if(_hostName == nil) {
        _hostName = [[UILabel alloc] init];
        _hostName.textColor  = [UIColor whiteColor];
        _hostName.backgroundColor = [UIColor clearColor];
        _hostName.font = [UIFont systemFontOfSize:12];
        [self.blackLine addSubview:_hostName];
        [_hostName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(0);
            make.left.equalTo(5);
            make.height.equalTo(25);
            make.right.mas_greaterThanOrEqualTo(self.viewCount.mas_left).mas_greaterThanOrEqualTo(10);
        }];
    }
    return _hostName;
}

@end
