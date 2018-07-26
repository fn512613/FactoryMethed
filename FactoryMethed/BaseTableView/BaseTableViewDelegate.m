//
//  NYBaseTableViewDelegate.m
//  NuanYouAIO
//
//  Created by nuanyouMac on 17/9/19.
//  Copyright © 2017年 xiaoxueying. All rights reserved.
//

#import "BaseTableViewDelegate.h"
#import "BaseTableViewCell.h"
#import "BaseTableViewCellModel.h"

@implementation BaseTableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.hasOneSection){
        return 1;
    }else{
        return self.dataSource.count;
    }
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.hasOneSection){
        return self.dataSource.count;
    }else{
        NSMutableArray *arr=self.dataSource[section];
        return arr.count;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.hasOneSection){
        BaseTableViewCellModel *model=self.dataSource[indexPath.row];
        NSString *modelName = [NSString stringWithUTF8String:object_getClassName(model)];
        modelName = [modelName stringByReplacingOccurrencesOfString:@"Model" withString:@""];
        BaseTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:modelName];
        [cell setModel:model];
        return cell;
    }else{
        NSMutableArray *arr=self.dataSource[indexPath.section];
        BaseTableViewCellModel *model=arr[indexPath.row];
        NSString *modelName = [NSString stringWithUTF8String:object_getClassName(model)];
        modelName = [modelName stringByReplacingOccurrencesOfString:@"Model" withString:@""];
        BaseTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:modelName];
        [cell setModel:model];
        return cell;
    }
    
    
}

#pragma mark - 占位图暂时不用


//- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
//    NSString *title = Localized(@"LOKEY_Empty_Data");
//    NSDictionary *attributes = @{
//                                 NSFontAttributeName:[UIFont systemFontOfSize:14.0f],
//                                 NSForegroundColorAttributeName:[UIColor lightGrayColor],
//                                 };
//    return [[NSAttributedString alloc] initWithString:title attributes:attributes];
//}
//
//- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView{
//    return true;
//}



//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    NSMutableArray *arr=self.dataSource[section];
//    if(section==0 && arr.count == 0 && self.showNoData){
//        NYBaseTableViewFooterView *footer=[tableView  dequeueReusableHeaderFooterViewWithIdentifier:@"footv"];
//        if (!footer) {
//            footer=[[NYBaseTableViewFooterView alloc]initWithReuseIdentifier:@"footv"];
//        }
//        return footer;
//    }else{
//        return nil;
//    }
//    
//}
//    
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    NSMutableArray *arr=self.dataSource[section];
//    if(section==0 && arr.count == 0 && self.showNoData){
//        return tableView.frame.size.height;
//    }else{
//        return 0;
//    }
//}

//-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    if (self.dataSource.count>0){
//        NSUInteger count= ((NSMutableArray *)self.dataSource[0]).count;
//        if (count == 0 && self.showNoData) {
//            scrollView.contentOffset = CGPointZero;
//        }
//    }
//
//}
    
    
    
    
    
    




@end
