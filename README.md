# tableView工厂方法的实现

------

tableView是ios开发中最常用到的控件，而tableView的delegate和datasource的实现也是有很多的重复代码。运用我的工厂方法实现tableView的快速搭建，可以达到的效果
> * 可以省去每次实现delegate方法的麻烦，
> * 可以快速灵活的搭建tableView，
> * 可以有效的减少ViewController的代码
> * 封装代码减少暴露控件

现在我们来看具体的实现

### 1、首先创建tableViewCell基类、tableViewCellModel基类

```
//tableViewCell

#import <UIKit/UIKit.h>
#import "BaseTableViewCellModel.h"

@interface BaseTableViewCell : UITableViewCell
-(void)setModel:(BaseTableViewCellModel *)model;

@end

#import "BaseTableViewCell.h"
@implementation BaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setModel:(BaseTableViewCellModel *)model{
    
}

```

```
//tableViewCellModel

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BaseTableViewCellModel : NSObject
@end
#import "BaseTableViewCellModel.h"

@implementation BaseTableViewCellModel

@end

```
### 2、创建一个BaseTableViewDelegate
```
#import <UIKit/UIKit.h>
@interface BaseTableViewDelegate : NSObject<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *dataSource;
/**
 只有一个section的tableView
 */
@property (nonatomic,assign) BOOL hasOneSection;
@end


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

@end

```

以后你要实现tableView，可以创建一个类继承BaseTableViewDelegate 然后在里面实现delegate方法或者重写基类的方法
```
#import "BaseTableViewDelegate.h"

@protocol FMMainTableViewDelegateProtocol;
@interface FMMainTableViewDelegate : BaseTableViewDelegate
@property (nonatomic, weak) id<FMMainTableViewDelegateProtocol> delegate;
@end

@protocol FMMainTableViewDelegateProtocol <NSObject>
- (void)didSelectItem:(NSIndexPath *)indexPath;
@end

#import "FMMainTableViewDelegate.h"

@implementation FMMainTableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(didSelectItem:)]) {
        [self.delegate didSelectItem:indexPath];
    }
}


@end

```
你需要实现cell中的方法- (void)setModel:(BaseTableViewCellModel *)model;
```
#import "FMImageTableViewCell.h"
#import "FMImageTableViewCellModel.h"

@interface FMImageTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;

@end


@implementation FMImageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setModel:(BaseTableViewCellModel *)model{
    FMImageTableViewCellModel *info = (FMImageTableViewCellModel *)model;
    self.titleLbl.text = info.title;
    self.img.image = [UIImage imageNamed:info.image];
}

@end
```

在viewController中的实现
```
@property (nonatomic, strong) FMMainTableViewDelegate *delegate;

- (FMMainTableViewDelegate *)delegate{
    if (_delegate == nil) {
        _delegate = [FMMainTableViewDelegate new];
        _delegate.hasOneSection = true;
        _delegate.delegate = self;
    }
    return _delegate;
}

- (void)setupTableView{
    self.delegate.dataSource = [self dataSource];
    self.tableView.delegate = self.delegate;
    self.tableView.dataSource = self.delegate;
    [DAUITool registerTableView:self.tableView name:@"FMImageTableViewCell"];
    [DAUITool setExtraCellLineHidden:self.tableView];
}


#pragma mark - FMMainTableViewDelegateProtocol

- (void)didSelectItem:(NSIndexPath *)indexPath{
    FMImageTableViewCellModel *info = self.delegate.dataSource[indexPath.row];
    NSLog(@"点击了%@",info.title);
    
    
    
}


```

这种方法可以极大的减少ViewController的代码，可以使你的代码更简洁。
缺点是每个cell必须有一个对应的model，即使你的model里面没有任何的属性。