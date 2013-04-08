//
//  MianViewController.h
//  FMDBPractise
//
//  Created by 张茫原 on 13-3-26.
//  Copyright (c) 2013年 张茫原. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullingRefreshTableView.h"

@interface MainViewController : UIViewController<PullingRefreshTableViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    
    
}

@property (nonatomic, retain) PullingRefreshTableView * tableView;
@property (nonatomic, assign) BOOL refreshing;
@property (nonatomic, retain) NSMutableArray * dataArray;

-(void)requestDoenNetworking;
-(void)requestUpNetworking;

@end





















