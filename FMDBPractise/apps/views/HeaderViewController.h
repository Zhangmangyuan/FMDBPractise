//
//  HeaderViewController.h
//  FMDBPractise
//
//  Created by 张茫原 on 13-5-26.
//  Copyright (c) 2013年 张茫原. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface HeaderViewController : UIViewController<UISearchDisplayDelegate,UITableViewDataSource,UITableViewDelegate>
{

}

@property (nonatomic, retain)UITableView * tableView;
@property (nonatomic, retain)UISearchBar * searchBar;
@property (nonatomic, retain)UISearchDisplayController * searchDisPlayVC;


@end
