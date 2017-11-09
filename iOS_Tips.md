# 使用UIApplication的OpenURL:方法指定特定的协议来打开不同的系统应用

### 系统应用

在开发某些应用时可能希望能够调用iOS系统内置的电话、短信、邮件、浏览器应用，此时你可以直接使用UIApplication的OpenURL:方法指定特定的协议来打开不同的系统应用。常用的协议如下：

1. 打电话：tel:或者tel://、telprompt:或telprompt://(拨打电话前有提示)
2. 发短信：sms:或者sms://
3. 发送邮件：mailto:或者mailto://
4. 启动浏览器：http:或者http://

下面以一个简单的demo演示如何调用上面几种系统应用：
```
//
//  ViewController.m
//  iOSSystemApplication
//
//  Created by Kenshin Cui on 14/04/05.
//  Copyright (c) 2014年 cmjstudio. All rights reserved.
//
#import "ViewController.h"
@interface ViewController ()
@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
}
#pragma mark - UI事件
//打电话
- (IBAction)callClicK:(UIButton *)sender {
    NSString *phoneNumber=@"18500138888";
//    NSString *url=[NSString stringWithFormat:@"tel://%@",phoneNumber];//这种方式会直接拨打电话
    NSString *url=[NSString stringWithFormat:@"telprompt://%@",phoneNumber];//这种方式会提示用户确认是否拨打电话
    [self openUrl:url];
}
//发送短信
- (IBAction)sendMessageClick:(UIButton *)sender {
    NSString *phoneNumber=@"18500138888";
    NSString *url=[NSString stringWithFormat:@"sms://%@",phoneNumber];
    [self openUrl:url];
}
//发送邮件
- (IBAction)sendEmailClick:(UIButton *)sender {
    NSString *mailAddress=@"kenshin@hotmail.com";
    NSString *url=[NSString stringWithFormat:@"mailto://%@",mailAddress];
    [self openUrl:url];
}
//浏览网页
- (IBAction)browserClick:(UIButton *)sender {
    NSString *url=@"http://www.cnblogs.com/kenshincui";
    [self openUrl:url];
}
#pragma mark - 私有方法
-(void)openUrl:(NSString *)urlStr{
    //注意url中包含协议名称，iOS根据协议确定调用哪个应用，例如发送邮件是“sms://”其中“//”可以省略写成“sms:”(其他协议也是如此)
    NSURL *url=[NSURL URLWithString:urlStr];
    UIApplication *application=[UIApplication sharedApplication];
    if(![application canOpenURL:url]){
        NSLog(@"无法打开\"%@\"，请确保此应用已经正确安装.",url);
        return;
    }
    [[UIApplication sharedApplication] openURL:url];
}
@end
```
不难发现当openURL:方法只要指定一个URL Schame并且已经安装了对应的应用程序就可以打开此应用。当然，如果是自己开发的应用也可以调用openURL方法来打开。假设你现在开发了一个应用A，如果用户机器上已经安装了此应用，并且在应用B中希望能够直接打开A。那么首先需要确保应用A已经配置了Url Types，具体方法就是在plist文件中添加URL types节点并配置URL Schemas作为具体协议，配置URL identifier作为这个URL的唯一标识，如下图：


然后就可以调用openURL方法像打开系统应用一样打开第三方应用程序了：
```
//打开第三方应用
- (IBAction)thirdPartyApplicationClick:(UIButton *)sender {
    NSString *url=@"cmj://myparams";
    [self openUrl:url];
}
```
就像调用系统应用一样，协议后面可以传递一些参数（例如上面传递的myparams），这样一来在应用中可以在`AppDelegate`的`-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url
sourceApplication:(NSString *)sourceApplication annotation:(id)annotation`代理方法中接收参数并解析。
```
-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    NSString *str=[NSString stringWithFormat:@"url:%@,source application:%@,params:%@",url,sourceApplication,[url host]];
    NSLog(@"%@",str);
    return YES;//是否打开
}
```
