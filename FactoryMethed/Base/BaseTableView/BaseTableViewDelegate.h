//
//  NYBaseTableViewDelegate.h
//  NuanYouAIO
//
//  Created by nuanyouMac on 17/9/19.
//  Copyright © 2017年 xiaoxueying. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>
@interface BaseTableViewDelegate : NSObject<UITableViewDelegate,UITableViewDataSource>
//DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>
@property (nonatomic,strong) NSMutableArray *dataSource;

/**
 只有一个section的tableView
 */
@property (nonatomic,assign) BOOL hasOneSection;
@end
