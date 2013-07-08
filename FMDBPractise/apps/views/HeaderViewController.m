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

#define RGB_COLOR colorWithRed:152.0/255.0 green:164.0/255.0 blue:174.0/255.0 alpha:1.0

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
    
    self.searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [[self.searchBar.subviews objectAtIndex:0]removeFromSuperview];
    self.searchBar.backgroundColor = [UIColor RGB_COLOR];
    self.searchBar.placeholder = @"please input password";
    
//    //tableview
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height -20 -44) style:UITableViewStylePlain];
    self.tableView.delegate =self;
    self.tableView.dataSource =self;
    [self.view addSubview:self.tableView];
    
    self.searchDisPlayVC = [[UISearchDisplayController alloc]initWithSearchBar:self.searchBar contentsController:self];
    self.searchDisPlayVC.delegate =self;
    self.searchDisPlayVC.searchResultsDataSource =self;
    self.searchDisPlayVC.searchResultsDelegate =self;
    self.tableView.tableHeaderView =self.searchBar;
    
}

#pragma mark -
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    NSString *identifier = @"cell";
    cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    }

    return cell;
}

#pragma mark -
#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


#pragma mark -
#pragma mark - UITableViewDelegate

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end












