//
//  MianViewController.m
//  FMDBPractise
//
//  Created by 张茫原 on 13-3-26.
//  Copyright (c) 2013年 张茫原. All rights reserved.
//

#import "MainViewController.h"
#import "AFHTTPRequestOperation.h"
#import "JSONKit.h"
#import "UIImageView+AFNetworking.h"
#import "MyCustomCell.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    self.title = @"主页";
    self.dataArray = [[NSMutableArray alloc]init];
    
    
    self.tableView = [[PullingRefreshTableView alloc]initWithFrame:CGRectMake(0, 0, 320, 416) pullingDelegate:self];
    self.tableView.delegate =self;
    self.tableView.dataSource =self;
    self.tableView.delegate =self;
    [self.view addSubview:self.tableView];
    
    
    [self requestDoenNetworking];
}

-(void)requestDoenNetworking
{
    NSURL * url = [NSURL URLWithString:@"http://star.eliteworkltd.com:8002/?json=1&cat=5&page=1"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation * operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary * dic_json = [operation.responseString objectFromJSONString];
        DLog(@"dic_json = %@",dic_json);
        NSArray * posts = [dic_json valueForKey:@"posts"];
        for (NSDictionary * item in posts) {
            NSMutableDictionary * allDic = [[NSMutableDictionary alloc]init];
            //标题
            NSString * title = [item valueForKey:@"title"];
            //文章
            NSString * content = [item valueForKey:@"content"];
            NSString * tempStr = [content stringByReplacingOccurrencesOfString:@"<p>" withString:@" "];
            NSString * finalStr = [tempStr stringByReplacingOccurrencesOfString:@"</p>" withString:@" "];
            //文章标题
            
            //图片
            NSArray * attachments = [item valueForKey:@"attachments"];
            NSDictionary * items = [attachments objectAtIndex:0];
            NSDictionary * images = [items valueForKey:@"images"];
            //缩略图
            NSDictionary * thumbnail = [images valueForKey:@"thumbnail"];
            NSString * thumbnailurl = [thumbnail valueForKey:@"url"];
            //大图
            NSDictionary * medium = [images valueForKey:@"medium"];
            NSString * mediumurl = [medium valueForKey:@"url"];
            
            [allDic setValue:title forKey:@"title"];
            [allDic setValue:finalStr forKey:@"content"];
            [allDic setValue:thumbnailurl forKey:@"thumbnailurl"];
            [allDic setValue:mediumurl forKey:@"mediumurl"];
            [self.dataArray addObject:allDic];
        }
        [self.tableView reloadData];
        [self.tableView tableViewDidFinishedLoading];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DLog(@"Failure : %@",error);
    }];
     
    [operation start];
}

-(void)requestUpNetworking
{
    
}

#pragma mark - 
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    MyCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[MyCustomCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }

    [cell.imageView setImageWithURL:[NSURL URLWithString:[[self.dataArray objectAtIndex:indexPath.row] valueForKey:@"thumbnailurl"]] placeholderImage:nil];
    cell.label1.text = [[self.dataArray objectAtIndex:indexPath.row] valueForKey:@"title"];
    cell.label2.text = [[self.dataArray objectAtIndex:indexPath.row] valueForKey:@"content"];
    
    
    return cell;
}


#pragma mark -
#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark -
#pragma mark - PullingRefresh  TableView   Delegate

- (void)loadData
{
    self.tableView.reachedTheEnd  = NO;
    [self.tableView tableViewDidFinishedLoading];//下拉刷新结束，以后不写这个方法里
    [self.tableView reloadData];
}

//下拉刷新时走的方法
- (void)pullingTableViewDidStartRefreshing:(PullingRefreshTableView *)tableView{
    DLog(@"和大家按考核等级");
    DLog(@"%s - [%d]",__FUNCTION__,__LINE__);
    [self requestDoenNetworking];
    [self performSelector:@selector(loadData) withObject:nil afterDelay:1.f];
}


- (NSDate *)pullingTableViewRefreshingFinishedDate{
    DLog(@"%s - [%d]",__FUNCTION__,__LINE__);
    NSDateFormatter *df = [[NSDateFormatter alloc] init ];
    df.dateFormat = @"yyyy-MM-dd HH:mm";
    NSString *dateStr = [df stringFromDate:[NSDate date]];
    NSDate *date = [df dateFromString:dateStr];
    //DLog(@"%@",dateStr);
    return date;
}

//上拉刷新时走的方法
- (void)pullingTableViewDidStartLoading:(PullingRefreshTableView *)tableView{
    DLog(@"%s - [%d]",__FUNCTION__,__LINE__);
    self.refreshing = YES;
//    [self RequesetUpNetWork];
    [self performSelector:@selector(loadData) withObject:nil afterDelay:1.f];
}

#pragma mark - 下拉刷新里固定代理方法

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.tableView tableViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self.tableView tableViewDidEndDragging:scrollView];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end






















