//
//  HeaderViewController.m
//  FMDBPractise
//
//  Created by 张茫原 on 13-5-26.
//  Copyright (c) 2013年 张茫原. All rights reserved.
//

#import "HeaderViewController.h"

@interface HeaderViewController ()

@end

@implementation HeaderViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.myTabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 460) style:UITableViewStylePlain];
//    [self.myTabelView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.myTabelView setDelegate:self];
    [self.myTabelView setDataSource:self];
    [self.view addSubview:self.myTabelView];
    

}

#pragma mark -
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView * backgroundview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
//    backgroundview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"qingchun.jpg"]];
//    self.myTabelView.tableHeaderView = backgroundview;
//    
//    return backgroundview;
//}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 40;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    return cell;
}

#pragma mark -
#pragma mark - UITableViewDelegate

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end












