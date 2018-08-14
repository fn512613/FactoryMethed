
//责任链模式（Chain of Responsibility）：
//
//定义: 责任链模式（Chain of Responsibility Pattern）为请求创建了一个接收者对象的链。使多个对象都有机会处理请求，从而避免了请求的发送者和接受者之前的耦合关系。将这些对象连成一条链，并沿着这条链传递该请求，知道有对象处理它为止。
//
//使用场景： 有多个对象可以处理同一个请求，具体哪个对象处理该请求由运行时确定。
//
//具体实现： 这里举了一个实际中公司请假批假的例子，具体请点击这里查看
//
//优点： 1.低耦合：将请求和处理分开，请求者可以不用知道是谁处理的。2.新增和修改新的处理类比较容易
//
//缺点： 每个请求都是从链头遍历到链尾，如果链比较长会产生一定的性能问题，调试起来也比较麻烦。
//
//注意事项: 避免超长链的情况出现


#import <Foundation/Foundation.h>

@protocol Leave <NSObject>
- (void)handleLeaveApplication:(NSUInteger)dayCount;
@end
