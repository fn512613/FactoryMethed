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
#import "BaseTitleSwitchCellModel.h"
#import "FMViewModel.h"

@interface ViewController ()<FMMainTableViewDelegateProtocol>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) FMMainTableViewDelegate *delegate;
@property (nonatomic, strong) FMViewModel *viewModel;
@end

@implementation ViewController

- (FMViewModel *)viewModel{
    if (_viewModel == nil) {
        _viewModel = [FMViewModel new];
    }
    return _viewModel;
}

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
    self.delegate.dataSource = [self.viewModel dataSource];
    self.tableView.delegate = self.delegate;
    self.tableView.dataSource = self.delegate;
    [DAUITool registerTableView:self.tableView name:@"FMImageTableViewCell"];
    [DAUITool registerTableView:self.tableView name:@"BaseTitleSwitchCell"];
    [DAUITool registerTableView:self.tableView name:@"BaseTitleTextFieldCell"];
    [DAUITool registerTableView:self.tableView name:@"BaseTitleIndicatorCell"];
    [DAUITool setExtraCellLineHidden:self.tableView];
}

#pragma mark - FMMainTableViewDelegateProtocol

- (void)didSelectItem:(NSIndexPath *)indexPath{
    FMImageTableViewCellModel *info = self.delegate.dataSource[indexPath.row];
    NSLog(@"点击了%@",info.title);
    
}

- (void)didSelectSwitchItem:(BaseTitleSwitchCellModel *)info{
    if (info.selected) {
        [self.viewModel addCell:self.delegate.dataSource];
        [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:3 inSection:0]] withRowAnimation:UITableViewRowAnimationTop];
    }else{
        [self.viewModel delectCell:self.delegate.dataSource];
        [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:3 inSection:0]] withRowAnimation:UITableViewRowAnimationTop];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
