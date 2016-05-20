//
//  AppDelegate.m
//  TRProject
//
//  Created by jiyingxin on 16/2/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+System.h"
#import "GameLiveNetManager.h"
#import "ColumnVIewModel.h"
#import "LiveColumnViewController.h"
#import "ViewController.h"
#import "DetailViewController.h"
#import "HuanXinViewController.h"
@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //全局默认配置
    [self setupGlobalConfig];
    //    [[ColumnVIewModel new]getDataWithRequestMode:RequestModeMore completionHanle:^(NSError *error) {
    //        
    //    }];
    //    [GameLiveNetManager getRoomDataCompletionHandler:^(id model, NSError *error) {
    //        
    //    }];
    //    [GameLiveNetManager getRoomDetailWIthUid:@"263925" completionhandler:^(id model, NSError *error) {
    //        
    //    }];
    [UINavigationBar appearance].translucent = NO;
    [[UINavigationBar appearance]setBarTintColor:[UIColor colorWithRed:251/255.0 green:51/255.0 blue:41/255.0 alpha:1]];
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil];
    [[UINavigationBar appearance]setTitleTextAttributes:attributes];
    UINavigationController *navColumn = [[UINavigationController alloc]initWithRootViewController:[LiveColumnViewController new]];
    navColumn.tabBarItem.title = @"栏目";
    
    navColumn.navigationBar.backgroundColor = [UIColor orangeColor];
    UINavigationController *navRecommd = [[UINavigationController alloc]initWithRootViewController:[ViewController new]];
    navRecommd.tabBarItem.title = @"推荐";
    
    DetailViewController *detailVc = [[DetailViewController alloc]initWithKind:ListKindLiveRoom];
    UINavigationController *navLive = [[UINavigationController alloc]initWithRootViewController: detailVc];
    navLive.tabBarItem.title = @"直播";
    
    UINavigationController *navSetting= [[UINavigationController alloc]initWithRootViewController:[ViewController new]];
    navSetting.tabBarItem.title = @"我的";
    
    HuanXinViewController *huanxin = [HuanXinViewController new];
    UINavigationController *navHuanxin = [[UINavigationController alloc]initWithRootViewController:huanxin];
    navHuanxin.tabBarItem.title = @"聊";
    
    
    UITabBarController *tab = [[UITabBarController alloc]init];
    tab.viewControllers = @[navColumn,navRecommd,navLive,huanxin,navSetting];
    
    //    [GameLiveNetManager getLiveDetailDataWithName:@"lol" completionhandler:^(id model, NSError *error) {
    //        
    //    }];
    
    _window.rootViewController = tab;
    [_window makeKeyAndVisible];
    
    return YES;
}

@end
