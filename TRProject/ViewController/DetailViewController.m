//
//  DetailViewController.m
//  TRProject
//
//  Created by JunChuanShi on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailViewModel.h"
#import "LiveDetailViewCell.h"
#import "RoomDetailViewController.h"
@import AVFoundation;
@interface DetailViewController()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic) DetailViewModel *detailViewModel;
@property(nonatomic) UICollectionView *collectionView;
@property(nonatomic) UICollectionViewFlowLayout *flowLayOut;
@property(nonatomic) AVPlayer *tvPlayer;
@property(nonatomic) AVPlayerLayer *plaer;
@end
@implementation DetailViewController

#pragma mark - UIcollectionView Delegate

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    RoomDetailViewController *vc =[RoomDetailViewController new];
    NSString *uidTemp = [self.detailViewModel uidAtRow:indexPath.row];
    vc.uid = uidTemp;
     NSString *playPath = [NSString stringWithFormat:kPlayPath,uidTemp];
    _tvPlayer = [AVPlayer playerWithURL:[NSURL URLWithString:playPath]];
    _plaer = [AVPlayerLayer playerLayerWithPlayer:_tvPlayer];
    _plaer.frame = CGRectMake(0, 0, kScreenW, kScreenH);
    [vc.view.layer addSublayer:_plaer];
    [_tvPlayer play];
    [self presentViewController:vc animated:YES completion:nil];
    //[self.navigationController pushViewController:vc animated:YES];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.detailViewModel detailNum];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LiveDetailViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.tileLb.text = [self.detailViewModel titleAtRow:indexPath.row];
    [cell.coverImg setImageWithURL:[self.detailViewModel coverImgAtRow:indexPath.row]];
    cell.hostName.text = [self.detailViewModel hostNameAtRow:indexPath.row];
    cell.viewCount.text = [self.detailViewModel viewCountAtRow:indexPath.row];
    return cell;
}
#pragma mark - 生命周期 LifeCircle
- (void)viewDidLoad {
    [super viewDidLoad];
    //self.title = [self.name uppercaseString];
    self.view.backgroundColor = [UIColor whiteColor];
    
    switch (self.kind) {
        case ListKindColumnDetail: {
            self.detailViewModel.detailDataList = nil;
            WK(weakSelf);
            [self.collectionView addHeaderRefresh:^{
                [weakSelf.detailViewModel getDataWithRequestMode:RequestModeRefresh completionHanle:^(NSError *error) {
                    if (!error) {
                        [weakSelf.collectionView reloadData];
                    }
                    [weakSelf.collectionView endHeaderRefresh];
                }];
            }];
            [self.collectionView addAutoFooterRefresh:^{
                [weakSelf.detailViewModel getDataWithRequestMode:RequestModeMore completionHanle:^(NSError *error) {
                    if (!error) {
                        [weakSelf.collectionView reloadData];
                    }
                    [weakSelf.collectionView endFooterRefresh];
                }];
            }];
            [self.collectionView beginHeaderRefresh];
            break;
        }
        case ListKindLiveRoom: {
            self.tabBarItem.title = @"直播";

            self.detailViewModel.detailDataList = nil;
            WK(weakSelf);
            [self.collectionView addHeaderRefresh:^{
                [weakSelf.detailViewModel getRoomWithRequestMode:RequestModeRefresh completionHanle:^(NSError *error) {
                    [weakSelf.collectionView reloadData];
                    [weakSelf.collectionView endHeaderRefresh];
                }];
            }];
            [self.collectionView addAutoFooterRefresh:^{
                [weakSelf.detailViewModel getRoomWithRequestMode:RequestModeMore completionHanle:^(NSError *error) {
                    [weakSelf.collectionView reloadData];
                    [weakSelf.collectionView endFooterRefresh];
                }];
            }];
            [self.collectionView beginHeaderRefresh];
            break;
        }
    }
}
-(instancetype)init{
    NSAssert(NO, @"must use initWithKind");
    return nil;
}
-(instancetype)initWithKind:(ListKind)kind{
    if (self = [super init]) {
        self.kind = kind;
    }
    return self;
}

#pragma mark - 懒加载 Lazyload
- (UICollectionView *)collectionView {
    if(_collectionView == nil) {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.flowLayOut];
        _collectionView.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1];
        [_collectionView registerClass:[LiveDetailViewCell class] forCellWithReuseIdentifier:@"cell"];
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)flowLayOut {
    if(_flowLayOut == nil) {
        _flowLayOut = [[UICollectionViewFlowLayout alloc] init];
        _flowLayOut.minimumLineSpacing = 5;
        _flowLayOut.minimumInteritemSpacing = 6;
        _flowLayOut.sectionInset = UIEdgeInsetsMake(8, 6, 5, 8);
        CGFloat width = (kScreenW -8*2 -6)/2;
        _flowLayOut.itemSize = CGSizeMake(width, width/350*265);
    }
    return _flowLayOut;
}

- (DetailViewModel *)detailViewModel {
    if(_detailViewModel == nil) {
        _detailViewModel = [[DetailViewModel alloc] initWithName:self.name];;
    }
    return _detailViewModel;
}

- (NSString *)name {
    if(_name == nil) {
        _name = [[NSString alloc] init];
    }
    return _name;
}
@end
