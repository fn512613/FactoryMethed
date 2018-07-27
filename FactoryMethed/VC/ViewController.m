//
//  ViewController.m
//  FactoryMethed
//
//  Created by qianpanpan on 2018/7/26.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import "ViewController.h"
#import "FMMainTableViewDelegate.h"
#import "FMImageTableViewCellModel.h"

@interface ViewController ()<FMMainTableViewDelegateProtocol>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) FMMainTableViewDelegate *delegate;
@end

@implementation ViewController

- (FMMainTableViewDelegate *)delegate{
    if (_delegate == nil) {
        _delegate = [FMMainTableViewDelegate new];
        _delegate.hasOneSection = true;
        _delegate.delegate = self;
    }
    return _delegate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
}


- (void)setupTableView{
    self.delegate.dataSource = [self dataSource];
    self.tableView.delegate = self.delegate;
    self.tableView.dataSource = self.delegate;
    [DAUITool registerTableView:self.tableView name:@"FMImageTableViewCell"];
    [DAUITool setExtraCellLineHidden:self.tableView];
}

- (NSMutableArray *)dataSource{
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:4];
    FMImageTableViewCellModel *info = [FMImageTableViewCellModel new];
    info.title = @"支付宝";
    info.image = @"alipay";
    [arr addObject:info];
    FMImageTableViewCellModel *info2 = [FMImageTableViewCellModel new];
    info2.title = @"微信";
    info2.image = @"wechat";
    [arr addObject:info2];
    return arr;
}

#pragma mark - FMMainTableViewDelegateProtocol

- (void)didSelectItem:(NSIndexPath *)indexPath{
    FMImageTableViewCellModel *info = self.delegate.dataSource[indexPath.row];
    NSLog(@"点击了%@",info.title);
    
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
