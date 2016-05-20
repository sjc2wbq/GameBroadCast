//
//  RoomDetailViewController.m
//  TRProject
//
//  Created by JunChuanShi on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "RoomDetailViewController.h"
#import "RoomDetailViewModel.h"
@import AVFoundation;

@interface RoomDetailViewController()
@property(nonatomic) RoomDetailViewModel *roomDetailVM;
@property(nonatomic) UIView *playView;
@property(nonatomic) UIView *RoomInfo;
@property(nonatomic) UIImageView *headImg;
@property(nonatomic) UILabel *hostNameLb;
@property(nonatomic) UILabel *roomTitleLb;
@property(nonatomic) UILabel *viewCountLabel;
@property(nonatomic) AVPlayer *tvPlayer;
@end
@implementation RoomDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor whiteColor];
//    [self.roomDetailVM getRoomDetailDataCompletionhandler:^(NSError *error) {
//    }];
//    self.title = [self.roomDetailVM roomTitle];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    NSString *playPath = [NSString stringWithFormat:kPlayPath,self.uid];
//    _tvPlayer = [AVPlayer playerWithURL:[NSURL URLWithString:playPath]];
//    self.title = [self.roomDetailVM roomTitle];
//    [self RoomInfo];
//    [_headImg setImageWithURL:[self.roomDetailVM getHeaderImg]];
//    _hostNameLb.text = [self.roomDetailVM roomHostName];
//    _roomTitleLb.text = [self.roomDetailVM roomTitle];
//    _viewCountLabel.text = [self.roomDetailVM roomViewCount];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (RoomDetailViewModel *)roomDetailVM {
    if(_roomDetailVM == nil) {
        _roomDetailVM = [[RoomDetailViewModel alloc] initWithUid:self.uid];
    }
    return _roomDetailVM;
}

- (UIView *)playView {
    if(_playView == nil) {
        _playView = [[UIView alloc] init];
        _playView.backgroundColor = [UIColor grayColor];
        [self.view addSubview:_playView];
        [_playView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            make.height.equalTo(200);
        }];
        UIView *view = [UIView new];
        [view.layer setCornerRadius:20];
        view.backgroundColor = [UIColor blackColor];
        [_playView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(8);
            make.bottom.equalTo(-10);
            make.width.equalTo(100);
            make.height.equalTo(40);
        }];
        _viewCountLabel = [UILabel new];
        _viewCountLabel.textColor = [UIColor whiteColor];
        [view addSubview:_viewCountLabel];
        [_viewCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.centerX.equalTo(0);
        }];
        
//        _tvPlayer = [AVPlayer new];
    }
    return _playView;
}

- (UIView *)RoomInfo {
    if(_RoomInfo == nil) {
        _RoomInfo = [[UIView alloc] init];
        [self.view addSubview:_RoomInfo];
        [_RoomInfo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.top.equalTo(self.playView.mas_bottom );
        }];
        
        UIView *view = [UIView new];
        [_RoomInfo addSubview:view];
        view.backgroundColor = [UIColor whiteColor];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            make.height.equalTo(80);
        }];
        
        _headImg = [UIImageView new];
        [_headImg.layer setCornerRadius:25];
        [_headImg.layer setMasksToBounds:YES];
        _headImg.contentMode = UIViewContentModeScaleAspectFill;
        [view addSubview:_headImg];
        _headImg.backgroundColor = [UIColor blueColor];
        [_headImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.centerY.equalTo(0);
            make.height.equalTo(_headImg.mas_width);
            make.height.equalTo(50);
        }];
        
        _hostNameLb = [UILabel new];
        _hostNameLb.text = @"hostName";
        _hostNameLb.font = [UIFont systemFontOfSize:20];
        //        _hostNameLb.backgroundColor = [UIColor grayColor];
        [view addSubview:_hostNameLb];
        [_hostNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_headImg.mas_right).equalTo(20);
            make.height.equalTo(20);
            make.top.equalTo(_headImg.mas_top);
        }];
        
        _roomTitleLb = [UILabel new];
        _roomTitleLb.text =@"roomTitle";
        _roomTitleLb.textColor = [UIColor lightGrayColor];
        _roomTitleLb.font = [UIFont systemFontOfSize:15];
        //        _roomTitleLb.backgroundColor = [UIColor grayColor];
        [view addSubview:_roomTitleLb];
        [_roomTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_headImg.mas_bottom);
            make.height.equalTo(20);
            
            make.left.equalTo(_headImg.mas_right).equalTo(20);
        }];
        
        UIView *line = [UIView new];
        line.backgroundColor = [UIColor lightGrayColor];
        [view addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(1);
        }];
        
        
    }
    return _RoomInfo;
}

@end
