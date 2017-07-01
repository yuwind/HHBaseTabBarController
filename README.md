# HHBaseTabBarController
一种简洁优雅的方式封装TabBarController，支持双击事件。
**说明：**
这个一个使用非常简单的自定义TabBarController，支持双击回到顶部事件。
只需要子控制遵守协议`DoubleClickProtocol`，实现协议方法即可回调双击事件。
改变字体配置信息在`HHCommonInitial.h`中

**使用方法：**
        

```objc
    HHTest0ViewController *vc1 = [HHTest0ViewController new];
    HHTest1ViewController *vc2 = [HHTest1ViewController new];
    HHTest2ViewController *vc3 = [HHTest2ViewController new];
    HHTest3ViewController *vc4 = [HHTest3ViewController new];
    
    self.viewControllers = @[vc1,vc2,vc3,vc4];
    
    [self.tableBarView configTableBarDisplay:@"主页" normalImage:@"icon_tab_my_nor" selectedImage:@"icon_tab_my_pressed" atIndex:0];
    [self.tableBarView configTableBarDisplay:@"好友" normalImage:@"icon_tab_my_nor" selectedImage:@"icon_tab_my_pressed" atIndex:1];
    [self.tableBarView configTableBarDisplay:@"发现" normalImage:@"icon_tab_my_nor" selectedImage:@"icon_tab_my_pressed" atIndex:2];
    [self.tableBarView configTableBarDisplay:@"个人" normalImage:@"icon_tab_my_nor" selectedImage:@"icon_tab_my_pressed" atIndex:3];
```
