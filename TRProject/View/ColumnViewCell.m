//
//  ColumnViewCell.m
//  TRProject
//
//  Created by JunChuanShi on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ColumnViewCell.h"

@implementation ColumnViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor colorWithRed:193/255.0 green:193/255.0 blue:193/255.0 alpha:1];
    }
    return self;
}
- (UIImageView *)coverImg {
    if(_coverImg == nil) {
        _coverImg = [[UIImageView alloc] init];
        [self.contentView addSubview:_coverImg];
        [_coverImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.titleLb.mas_top);
            make.left.right.top.equalTo(0);
        }];
    }
    return _coverImg;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.textAlignment = NSTextAlignmentCenter;
        _titleLb.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(30);
            make.left.right.equalTo(0);
            make.bottom.equalTo(-2);
        }];
    }
    return _titleLb;
}
-(void)awakeFromNib{
    self.contentView.backgroundColor = [UIColor grayColor];
}
@end
