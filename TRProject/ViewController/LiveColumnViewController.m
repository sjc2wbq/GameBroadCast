//
//  LiveColumnViewController.m
//  TRProject
//
//  Created by JunChuanShi on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//
#import "DetailViewController.h"
#import "LiveColumnViewController.h"
#import "ColumnVIewModel.h"
#import "ColumnViewCell.h"
@interface LiveColumnViewController()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic) UICollectionView *collectionView;
@property(nonatomic) UICollectionViewFlowLayout *flowLayOut;
@property(nonatomic) ColumnVIewModel *gameLiveModel;
@end
@implementation LiveColumnViewController
#pragma mark - UIcollectionView Delegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DetailViewController *vc = [[DetailViewController alloc]initWithKind:ListKindColumnDetail];
    vc.name = [self.gameLiveModel gameSlugAtRow:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES ];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.gameLiveModel columnNum];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ColumnViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.titleLb.text = [self.gameLiveModel titleAtRow:indexPath.row];
    [cell.coverImg setImageWithURL:[self.gameLiveModel coverImgAtRow:indexPath.row]];
    return cell;
}
#pragma mark - 生命周期 LifeCircle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"栏目";
    self.view.backgroundColor = [UIColor whiteColor];
    WK(weakSelf);
    [self.collectionView addAnimateHeaderRefresh:^{
        [weakSelf.gameLiveModel getDataWithRequestMode:RequestModeMore completionHanle:^(NSError *error) {
            if (!error) {
                [weakSelf.collectionView reloadData];
                [weakSelf.collectionView endHeaderRefresh];
            }
        }];
    }];
    [self.collectionView beginHeaderRefresh];
  
}
#pragma mark - 懒加载 Lazyload
- (UICollectionView *)collectionView {
    if(_collectionView == nil) {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.flowLayOut];
        _collectionView.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1];
        [_collectionView registerClass:[ColumnViewCell class] forCellWithReuseIdentifier:@"cell"];
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
        CGFloat width = (kScreenW -8*2 -6*2)/3;
        _flowLayOut.itemSize = CGSizeMake(width, width/233*379);
    }
    return _flowLayOut;
}

- (ColumnVIewModel *)gameLiveModel {
    if(_gameLiveModel == nil) {
        _gameLiveModel = [[ColumnVIewModel alloc] init];
    }
    return _gameLiveModel;
}

@end
