tableview或者collectionView列表滑动到顶部的三种方法

```
//第一种：
collectionView.contentOffset=CGPointMake(0, 0);
//第二种：
[collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionTop animated:YES]; 
//第三种：
 [collectionView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
```

$(SRCROOT)/PchText/pch
$(SRCROOT)/name/pchName

输家总是抱怨他们已经尽力了。

Bugtags，最适合移动应用的智能 Bug 管理系统
[iOS利用storyboard修改UITextField的placeholder文字颜色](http://blog.csdn.net/mmoaay/article/details/41083557)

设置这个类为ARC的 用：`-fobjc-arc`   
设置这个类非ARC的：`-fno-objc-arc`

<<iOS应用逆向工程>>
从之前 Autolayout 和 iPhone 5 屏幕拉长的时间点来看，iOS 8 推 Adaptive UI 时我猜想后面可能有大招，没想到是多任务，还挺惊喜的。从这一串的变化来看，我比较倾向于完全按照 Apple 推的技术来做 UI，这样能够在后面比较长的时间里面得到挺多的好处，就如喵大说的“会是一件很合算的事情”。

scheme : 协议头 URL Scheme
statusBar颜色

status bar可以根据你的应用的需要设置为三种样式（UIStatusBarStyle）：
UIStatusBarStyleBlackTranslucent 黑色透明
UIStatusBarStyleBlackOpaque 黑色不透明
UIStatusBarStyleDefault 默认白色
[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent animated:NO];

Vendor 供应商
wrapper 包装材料  包装类
nestable 可套上的
dependency 依赖 从属
coupled
adj. 耦合的；联接的；成对的；共轭的 （couple的过去分词形式）

AOP 面向切片编程
IOP
DateTool


它对我的神秘感一直保持到今天下午。今天下午负责UI设计的同事在设计，我没有素材，比较清闲，于是发个狠，专门看了一下UIApplication这个类。果然是难者不会，会者不难，看完之后，这个类的神秘感一下子没了。下面让我来揭开它的神秘面纱。
tags
/Users/iamnowhere/Desktop/XYHereAndNow/XYHereAndNow/Weibo/XYWbCell.m:34:40: Auto property synthesis will not synthesize property 'textLabel' because it is 'readwrite' but it will be synthesized 'readonly' via another property


一般我们向cell中添加子视图，有两种方式
1、[cell addSubview:]
2、[cell.contentView addSubview:]
区别在于进行cell编辑时，比如cell内容向左移或者右移时，第一种方式子视图不会移动，第二可以，所以这种情况一般使用第二种方式。
    还有在设置backgroundColor时，使用cell设置时左移或者右移颜色是不会变的，而用cell.contentCell设置时，移动后的空白会显示cell的默认颜色，这种情况视实际情况选择。
    其实这两种方式在大多数情况是一样，不用纠结。

@property (nonatomic) BOOL scalesPageToFit;//设置为YES，这样web页面会根据屏幕大小进行自动缩放。

//截取图片
UIImageView *zombIV = [[UIImageViewalloc]initWithFrame:CGRectMake(100, 100, 60, 100)];
UIImage *zombImage = [UIImage imageNamed:@"zomb_4.png"];
//截取图片
CGImageRef subImage = CGImageCreateWithImageInRect(zombImage.CGImage, CGRectMake(0, 0, zombImage.size.width/8, zombImage.size.height));
zombIV.image = [UIImage imageWithCGImage:subImage];
//释放内存
CGImageRelease(subImage);

```
#import <Foundation/Foundation.h>

int main(int argc, const char
* argv[])
{
   
@autoreleasepool
{
       
NSString* ID = @"230119197007010200"
;
       
NSRange yearRange = {6,4
};
       
NSString* year = [ID substringWithRange:yearRange];
       
NSRange monthRange = {10,2};
       
NSString* month = [ID substringWithRange:monthRange];
       
NSRange dayRange = {12,2};
       
NSString* day = [ID substringWithRange:dayRange];
       
NSLog(@"ID:%@ %@年%@月%@日",ID,year,month,day);//ID:230119197007010200 1970年07月01日}
   return 0;
}

ARC
//引用计时器仅仅是对内存管理的一个提示作用RC并不准确
#import <Foundation/Foundation.h>

#import
"TRStudent.h"
int main(int argc, const char
* argv[])
{   
@autoreleasepool
{
       TRStudent* stu = [[TRStudent alloc]init];
       
TRStudent* stu2 = stu;
        [stu2 retain];
        [stu release];
        [stu2 release];
        stu= nil;//空指针解决野指针问题
  
//可以查看对象引用计数器的值

NSUInteger rcCount = [stu retainCount];
NSLog(@"rcCount:%lu",rcCount);//0
 }
   return 0;
}
```
/滑动到TextView最下面  %% scrollview也有这个类似属性吧？
    [self.textView scrollRangeToVisible:range];

 self.textView.text = @"Now is the time for all good developers to come to serve their country.\n\nNow is the time for all good developers to come to serve their country.";
self.textView=[[UITextView alloc] initWithFrame:self.view.frame] ;
self.textView.textColor = [UIColor blackColor];//设置textview里面的字体颜色 
self.textView.font = [UIFont fontWithName:@"Arial"size:18.0];//设置字体名字和字体大小
self.textView.delegate = self;//设置它的委托方法 
self.textView.backgroundColor = [UIColor whiteColor];//设置它的背景颜色               
self.textView.text = @"abcdefghi\nkjhk\nhkjhkjhksaejodslkae\nnfdkshekhfkdsae\nfdhskejhkfhskejh\ngfdhsgaejhgfjhdsgaejhgfjhdsgaejhgfdjsagejhgfhjsagejhgfdsjahgejhfgdsjha";//设置它显示的内容
self.textView.returnKeyType = UIReturnKeyDefault;//返回键的类型
self.textView.keyboardType = UIKeyboardTypeDefault;//键盘类型
self.textView.scrollEnabled = YES;//是否可以拖动           
self.textView.editable =NO;//禁止编辑
self.textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;//自适应高度           
[self.view addSubview: self.textView];//加入到整个页面中

// Returns a color in the same color space as the receiver with the specified alpha component.
- (UIColor *)colorWithAlphaComponent:(CGFloat)alpha;

// Set the fill or stroke colors individually. These should be implemented by subclassers.
- (void)setFill;//填充
- (void)setStroke;//描边
  iOS 7 兼容问题
        精选页面需要将下面代码加在初始化方法内部
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
                    self.automaticallyAdjustsScrollViewInsets = NO;
                    self.edgesForExtendedLayout = UIRectEdgeNone;
            }

 for (UIView *currentView in cell.subviews
){
           
if([currentView isKindOfClass:[UIScrollView class
]]){
                ((
UIScrollView *)currentView).delaysContentTouches =false
;
               
break
;
            }
        }

for (UIView *currentView in _zhaiYouTableView.subviews
){
       
if([currentView isKindOfClass:[UIScrollView class
]]){
            ((
UIScrollView *)currentView).delaysContentTouches =false
;
           
break
;
        }
    }
UIViewContentModeScaleToFill,//图片视图里的图片将图片视图填满
    UIViewContentModeScaleAspectFit,//确保图片视图里的图片有正确的长宽比，并且会确保图片适应图片视图的边界
    UIViewContentModeScaleAspectFill ,//确保长宽比，并且使图片充满整个视图边界，为了能使这个值正常工作，确保将 clipsToBounds这个属性设为YES。

    /* + (void)load 会在应用启动的时候自动被runtime调用，通过重载这个方法来实现最小的对业务方的“代码入侵” */

刚刚查文档发现UIScrollView有个keyboardDismissMode属性，设置成UIScrollViewKeyboardDismissModeOnDrag就可以在拖拽ScrollView的时候自动缩起键盘，好用哭了。#看文档总有新惊喜#04/14/2016

What is lazy loading?
懒汉模式，只在用到的时候才去初始化。也可以理解成延时加载。我觉得最好也最简单的一个列子就是tableView中图片的加载显示了。一个延时载，避免内存过高，一个异步加载，避免线程堵塞。

instancetype是一个初始化方法或工厂方法的返回值类型,功能类似于id,
  -(id)init;
  -(instancetype)init;  //iOS7开始的用法

但是，instancetype和id是不同的：
id是可以用来定义属性，变量，参数类型的
而instancetype只能用来做初始化方法或工厂方法的返回值类型，不能出现在属性，变量，参数的类型定义处。
id  a;//OK
instancetype b;//ERROR

完成界面跳转的模式修改，采用导航栏控制器(视图控制器容器)，解决两个视图控制器互相present的逻辑缺陷。

NSArray * VCS = self.navigationController.viewControllers;
    for (UIViewController * VC  in VCS) {
        if ( [VC isKindOfClass:[YZHomeCameraViewController class]]) {
            [self.navigationController popToViewController:VC animated:YES];
        }
    }
- (IBAction)stepperOnClick:(UIStepper
*)sender {
   
self.stepperLabel.text = [NSString stringWithFormat:@"%.0f",sender.value
];
}
//修改switch控件的值 IBOutlet IBAction方向

- (
IBAction)changeSwitchValue:(id
)sender {
   
UISwitch
* switch1 = sender;
   
   
if (switch1.on
) {
        [
self.mySwitch setOn:NO animated:NO
];
    }
else
{
        [
self.mySwitch setOn:YES animated:NO
];
    }
}

//随机数据
UIImage*image = [UIImageimageNamed:[NSStringstringWithFormat:@"%i",arc4random_uniform(10) +1]];

[self.window makeKeyAndVisible];
由于iPhone是单窗口程序，所以也就只有这么一个Window对象，而且是UIWindow，不是NSWindow。而根据文档上所说：
“这个是便捷方法，去使被使用对象的主窗口显示到屏幕的最前端。你也可以使用hiddenUIView方法隐藏这个窗口”
所以基本上来说，对于编程者的区别仅仅在于在其前添加代码，或在其后添加代码。

//手势 
UISwipeGestureRecognizer*swipeGesture = [[UISwipeGestureRecognizeralloc]initWithTarget:selfaction:@selector(swipe:)];
    swipeGesture.numberOfTouchesRequired=1
;
    swipeGesture.
direction=UISwipeGestureRecognizerDirectionRight
;
   
self.textView.userInteractionEnabled=YES;
    [self.textViewaddGestureRecognizer:swipeGesture];

//手机靠近面部放在耳朵旁，那么声音将通过听筒输出，屏幕变暗
[defaultCenteraddObserver:selfselector:@selector(sensorStateChange:)name:@"UIDeviceProximityStateDidChangeNotification"object:nil];

-(void)sensorStateChange:(NSNotificationCenter
*)notification{
   
NSLog(@"sensorStateChange"
);
   
//如果此时手机靠近面部放在耳朵旁，那么声音将通过听筒输出，并将屏幕变暗
   if([[UIDevicecurrentDevice]proximityState] ==YES){
        [[EngineAgentsharedEngine]setSpeakerOn:TRUE];
    }else
{
        [[
EngineAgentsharedEngine]setSpeakerOn:FALSE
];
    }
}
//开机显示页面 基数次A 偶数次B
- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{
   
NSUserDefaults *ud = [NSUserDefaults standardUserDefaults
];
   
int runTimes = [ud integerForKey:@"runTimes"
];
    [ud
setInteger:++runTimes forKey:@"runTimes"
];
    [ud
synchronize
];
   
if (runTimes%2==0
) {
       
UIViewController *vc = [self.window.rootViewController.storyboard instantiateViewControllerWithIdentifier:@"bvc"
];
       
self.window.rootViewController
= vc;
    }
   
return YES;
}

//屏幕旋转
如果在UIViewController上，则在UIViewController对应的.m文件中加入三个函数即可。
如果在UITabBarController上，则在UITabBarController对应的.m文件中加入三个函数即可。
如果在UINavigationController上，则在UINavigationController对应的.m文件中加入三个函数即可。

//竖屏  根视图
#pragma mark - InterfaceOrientation
-(BOOL)shouldAutorotate{
   returnYES
;
}

-(NSUInteger)supportedInterfaceOrientations{
   returnUIInterfaceOrientationMaskPortrait;
}
//横屏
#pragma mark - InterfaceOrientation
-(BOOL)shouldAutorotate{
   returnYES
;
}

-(NSUInteger)supportedInterfaceOrientations{
   returnUIInterfaceOrientationMaskLandscape;
}

-(BOOL)shouldAutorotate{
   returnNO;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
   return(interfaceOrientation ==UIInterfaceOrientationLandscapeRight
);
}

-(NSUInteger)supportedInterfaceOrientations{
   returnUIInterfaceOrientationMaskLandscapeRight;
}
#pragma mark - 监听屏幕旋转
-(void)viewDidAppear:(BOOL
)animated{
   
UIDevice *device = [UIDevice currentDevice]; //Get the device object

    [device
beginGeneratingDeviceOrientationNotifications
];
   
   
NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter]; //Get the notification centre for the app
    [defaultCenter addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification  object:device];
}

-(void)orientationChanged:(NSNotification*)notify{
    //popView.hidden = YES;//太灵敏了
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    switch
(orientation) {
       
case UIDeviceOrientationPortrait:            // Device oriented vertically, home button on the bottom

           
//

           
break
;
       
case UIDeviceOrientationPortraitUpsideDown:  // Device oriented vertically, home button on the top

           
//

           
break
;
       
case UIDeviceOrientationLandscapeLeft:      // Device oriented horizontally, home button on the right

            [[
UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight animated:YES];
            //
            break
;
       
case UIDeviceOrientationLandscapeRight:      // Device oriented horizontally, home button on the left

            [[
UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeLeft animated:YES];
            //
            break
;
       
default
:
           
break
;
    }
}

//二维码
- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
   // 1.实例化二维码滤镜
   CIFilter*filter = [CIFilterfilterWithName:@"CIQRCodeGenerator"];
   // 2.恢复滤镜的默认属性(因为滤镜有可能保存上一次的属性)
    [filtersetDefaults];
   // 3.将字符串转换成NSdata
   NSData*data  = [@"[http://www.itheima.com](http://www.itheima.com)"dataUsingEncoding:NSUTF8StringEncoding];
   // 4.通过KVO设置滤镜,传入data,将来滤镜就知道要通过传入的数据生成二维码
    [filter setValue:data forKey:@"inputMessage"];
   // 5.生成二维码
    CIImage*outputImage = [filteroutputImage];
   UIImage*image = [UIImage imageWithCIImage:outputImage];
   // 6.设置生成好得二维码到imageview上
   self.iv.image= image;
   
}
初级程序员 别人分析好了 自己写代码；高级程序员，自己去分析。
初始阶段———>高级程序员    具有独立分析问题的能力。

/*表视图的自动布局问题 拉伸处理  部分子控件代码控制固定边缘*/

    /*登录互动教室过程中禁止界面切换或退出 */

/**保留注释  **/
   
   
CGRect frame = _movieResolutionTableView.frame
;
    frame.
size.height = _movieResolutionList.count * Row_Height
;
   
/* 总是这些莫名其妙的坐标显示 */
    //frame.origin.y = 140- (_movieResolutionList.count-4)*32;//140 iphone6以上显示有问题
    frame.origin.y = self.view.bounds.size.height-52-frame.size.height;// 代码固定
    _movieResolutionTableView.frame = frame;

[[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad

    //播放器界面上方 欢迎字幕
//    _marqueeLabel.textColor = [UIColor blueColor];
//    _marqueeLabel.text = @"Welocme to eduClass";
//    _marqueeLabel.repeatTimes = 5;
//    _marqueeLabel.hidden = NO;
//    [_marqueeLabel restartLabel];

 CGFloat height = [UIScreen mainScreen].bounds.size.height;
        height -= 49 + 44 + 20;//

/*** 获取本地文件大小 ***/

   
NSData *fileData=[[NSFileManager defaultManager] contentsAtPath:file.tempPath
];
   
NSInteger receivedDataLength=[fileData length];
    file.fileReceivedSize=[NSString stringWithFormat:@"%d",receivedDataLength];//2

 _serverArray = [[NSMutableArray alloc] initWithCapacity:10];//容量10组数据 指定了数组的容量，这个容量值只是为了Cocoa能够对其它进行一定的优化，并不是用其限定死数组的容量大

        NSLog(@"----网络URL--%@",fileInfo.fileURL);// 属性列表文件中获取

       
//[http://192.168.0.207:9090/cwvideo/%E8%83%A1%E5%BD%A6%E6%96%8C%20-%20%E4%B8%80%E8%A8%80%E9%9A%BE%E5%B0%BD.mp4](http://192.168.0.207:9090/cwvideo/%E8%83%A1%E5%BD%A6%E6%96%8C%20-%20%E4%B8%80%E8%A8%80%E9%9A%BE%E5%B0%BD.mp4)

       
NSLog(@"---路径-----%@",fileInfo.targetPath
);
       
///var/mobile/Applications/FC467EC4-D5F2-4A29-9038-38A8475788E3/Documents/Downloads/mp4/一言难尽.mp4
//        NSURL* fileURLstr = [NSURL fileURLWithPath:fileInfo.targetPath];
//        NSLog(@"---本地URL--%@",fileURLstr);
        //file:///var/mobile/Applications/1391E772-6D9D-4DB4-8213-96AD3A701953/Documents/Downloads/mp4/sz001%E8%AF%BE%E4%BB%B606.mp4

//Xcode5.1以上需要补充以下一个方法  类对象  注册Cell类型
    [self.tableView registerClass:[UITableViewCell class]forCellReuseIdentifier:identifier];

//导航栏贴图
UIImageView* imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"anyv_login_logo.png"]];
imageView.frame = CGRectMake(0, 0, 40, 40) ;
self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:imageView];

// iOS Version check for iOS 8.0.0
#define SYSTEM_VERSION_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)

//获取系统时间
NSDate* date = [NSDate date];
        NSLog(@"date %@",date);//香港标准时间

       
       
NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
       
       
NSString* lastOperation = [formatter stringFromDate:[NSDate date]];
        NSLog(@"lastOperation:%@",lastOperation);

// default is YES. if YES, image is drawn darker when highlighted(pressed)
    button.adjustsImageWhenHighlighted = NO;

 NSArray* liveUrlList = [[EngineAgent sharedAgent]FtpLivingRoomURL
:notify];
   
/* 默认选中标清其次分辨率最低  排序 超 高 标 流畅*/

   
//vpid = 1-超清 2-高清 3-标清 4-流畅

   
_sortedArray = [liveUrlList sortedArrayUsingComparator:^NSComparisonResult(id obj1, id
obj2){
          
NSNumber* number1 = [obj1 objectForKey:@"vpid"];  
NSNumber* number2 = [obj2 objectForKey:@"vpid"];    
       
if ([number1 intValue]<[number2 intValue]) {
           
return (NSComparisonResult)NSOrderedSame;
        }else{
           
return (NSComparisonResult)NSOrderedDescending;//升序

        }}]; 
        
moviePlayer.movieResolutionList = [NSMutableArray arrayWithArray:_sortedArray];

 //    _userInfo = [[EngineAgent sharedAgent] getUserInfo];// 10046 246133   10046 246133 //更换用户 10048 246133

 //暂停下载时 下载速度应该显示为0.00K/s 一次只下载一个文件 当做该文件的缓存速率 不准确
   
// Get a rough average (for the last 5 seconds) of how much bandwidth is being used, in bytes
    //_bandwithLab.text = [NSString stringWithFormat:@"%@/S",[CommonHelper getFileSizeString:[NSString stringWithFormat:@"%lu",[ASIHTTPRequest averageBandwidthUsedPerSecond]]]] ;

_alert = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"Failed to interactive classroom", nil) delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [_alert show];
    [self performSelector:@selector(alertViewDismiss) withObject:self afterDelay:1.0f];

-(void*)alertViewDismiss{
    [_alert dismissWithClickedButtonIndex:-1 animated:YES];//模拟点击事件 自动消失~
_alert = nil;
}

[self.navigationItem setRightBarButtonItem:[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showPeoplePicker:)] autorelease]];

//尺寸的计算
CGFloat  width;
UIScreen *currentScreen = [UIScreen mainScreen];
if (currentScreen.applicationFrame.size.height<568) {
   width = _toolview.frame.size.width/7;
  } else {
 width = _toolview.frame.size.width/6;
        }

 if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

不要问张总怎么搞，张总是请小星星来解决问题的。

//导航栏字体颜色self.navigationController.navigationBar.tintColor = [[UIColor alloc] initWithRed:65.0/255.0 green:121.0/255.0 blue:189.0/255.0 alpha:1.0];

//description 输出字符串
-(NSString *)description {
    return [NSString stringWithFormat:@"unescapedUrl:%@ width:%f height:%f",self.thumbURL,self.width,self.height];
}
//清空输入框 应用如textView的输入提示 当点击文本框时 提示文字消失
    self.myTF.text = @"";

// If you size your text using the constrainedToSize: methods below, you should draw the text using the drawInRect: methods using the same line break mode for consistency
    
//设定文本框视图的尺寸 自动换行
CGSize size = [message sizeWithFont:[UIFont systemFontOfSize:22] constrainedToSize:CGSizeMake(260, 1000
)];
    
//绘制字符串
    [message drawInRect:CGRectMake(20, 200, size.width, size.height) withFont:[UIFont systemFontOfSize:22]];

视力测试表 单VC push 只有一个视图
- (IBAction)onClickBack:(id
)sender {
    
//创建一个VC 自己push自己
[self.navigationController pushViewController[[TRViewController alloc]initWithNibName:@"TRViewController" bundle:nil] animated:YES];
    
}
- (void)viewDidLoad {
    [super viewDidLoad
];
    
static int i = 100;
    i -= 10;
    
UILabel* label = [[UILabel alloc]init];
    label.text = @"E";
    label.frame = CGRectMake(150, 150, 100, 100);
    label.font = [UIFont systemFontOfSize:i];    
    [self.view addSubview:label];
}

setNeedsLayout //刷新子控件
- (CGPoint)convertPoint:(CGPoint)point toView:(UIView *)view;   转化当前视图的坐标相对于另外一个视图的坐标
- (CGPoint)convertPoint:(CGPoint)point fromView:(UIView *)view; 转化另外视图坐标相对于当前视图的坐标

- (CGRect)convertRect:(CGRect)rect toView:(UIView *)view;转化当前视图的矩形坐标相对于另外一个视图的矩形
- (CGRect)convertRect:(CGRect)rect fromView:(UIView *)view;转化另外视图的矩形坐标相对于当前视图矩形

一般％加上一个其它字符组成NSString中的占位符，如％d表示一个整数。如果想在NSString中显示双引号，一般是用转义字符，如  \" ；
如果想在NSString中显示%就需要用%%,如：
NSString *strTest = [NSString stringWithFormat:@"%f%%",0.25];
NSlog("%@",strTest);
最后在控制台就会显示：  0.25％

float d=3141.592653;
printf("%1.2f  %2.2f  %3.2f  %4.2f  %5.2f  %6.2f  %7.2f",d,d,d,d,d,d,d);

这边的%m.n意思是输出时宽度占m格，如果要输出内容不足m则前面补空格，超过m则无视这个m，后面的n表精度，这边是截取2位小数的意思
/* Update alert message: A new version of {APP NAME} is available. Please update to version {NEW VERSION} now.*/
"A new version of %@ is available. Please update to version %@ now."="%@的新版本可用。请立即更新到%@版本。";

/* Update alert title */
"Update Available"="更新可用";

/* Update alert dismiss button title */
"Next time"="下一次";

/* Update alert skip button title */
"Skip this version"="跳过此版本";

/* Update alert skip button title */
"Update"="更新";
