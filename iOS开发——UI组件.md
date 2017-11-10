iOS开发——UI组件（个人整理）
2015-11-11
作者：[神兽gcc](http://www.jianshu.com/users/1e4daa9fca80) 授权本站转载。

最近把iOS里的UI组件重新整理了一遍，简单来看一下常用的组件以及它们的实现。其实现在这些组件都可以通过Storyboard很快的生成，只是要向这些组件能够变得生动起来并且赋予它们更具生命力的事件，还是需要一番功夫的。

UIButton

这儿有一篇教程，挺全的，可以参考下：[http://www.cnblogs.com/chen1987lei/archive/2011/09/09/2172757.html](http://www.cnblogs.com/chen1987lei/archive/2011/09/09/2172757.html)

这个就不多说了，对照官方的文档也可以更多的去学习。插一句题外话，在学这些组件的时候，最令人头疼的不是你搞不定一个组件的某个属性或者方法，而是你压根儿不知道有这个东西。所以在学习这些组件的时候最好的方式还是通过官方文档，虽然已开始可能有些困难，但是硬着头皮去啃，就一定会有悟道的那一天。建议有问题先去看文档，如果实在不行再去Google啊，Stack Overflow啊神马的。

UIAlertController

弹出式的提示框。现在市面上的书籍包括网上的一些资料都还停留在iOS8之前的时代，那个时候的弹出框是一个叫做UIAlertView的东西，但是现在，在XCode7和iOS9的时代，你会发现这个东西被弃用了。苹果自iOS8开始，废除了UIAlertView而改用UIAlertController来控制提示框。

来看看UIAlertController的实现吧，下面这个程序是我在练习UITableView时的代码，实现了一个类似与通讯录的东西，我们抓住主要矛盾，来看点击某一行cell后，弹出的消息提示框是怎么实现的。以下代码在ViewController.m中实现。

//创建提示框窗口
UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"System Info" message:[contact getName] preferredStyle:UIAlertControllerStyleAlert];
//实例化取消按钮
UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
//点击取消按钮后控制台打印语句。
NSLog(@"The \"Okay/Cancel\" alert's cancel action occured.");
}];
//实例化确定按钮
UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
NSLog(@"The \"Okay/Cancel\" alert's other action occured.");
//下面这段代码不用管它，简单点讲就是获取当前行的一个字符串。
UITextField *textfield = alertController.textFields[0];
KCContactGroup *group = _contacts[_selectedIndexPath.section];
KCContact *contact = group.contacts[_selectedIndexPath.row];
contact.phoneNumber = textfield.text;
NSArray *indexPaths = @[_selectedIndexPath];
[_tableview reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationLeft];
}];
//向弹出框中添加按钮和文本框
[alertController addAction:cancelAction];
[alertController addAction:otherAction];
[alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
// 可以在这里对textfield进行定制，例如改变背景色等
textField.text = contact.phoneNumber;
}];
//将提示框弹出
[self presentViewController:alertController animated:YES completion:nil];

实现了大概就是这个样子，文本框里的东西是从cell里面提取的。

![](http://upload-images.jianshu.io/upload_images/1336268-93208ff957f34343.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

这里还有一句题外话要讲。网上是没有任何关于最新的UIAlertController的使用教程的，我自己用了整整一个下午看官方文档一步一步调试才实现了这个恼人的提示框。官方的文档真的是个好东西，越用越强大！！

UISegmentedControl

分段控件，就是一栏按钮集成在一排里。很简单，就像Button一样。这个样子的：

![](http://upload-images.jianshu.io/upload_images/1336268-00423220a3cd83b7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

UISwtich

按钮控件，手机里开飞行模式的那个东西。通过Storyboard可以很快很方便的建立，不要忘了关联起来就好。

这里简单讲一下它的纯代码实现，其实包括上面的UISegmentedControl，还有下面的一些简单控件它们手写实现的方法都是一样的。截张图给大家说明一下就好了，都是一样的，后面的类似的控件也不多啰嗦了。

![](http://upload-images.jianshu.io/upload_images/1336268-f530bf0dba484221.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

UISlider

进度条型的选择控件，对应数值，可以进行设置音量等操作，根据官方文档可以看到很多关于它的设置，基本实现同上。

UIPageControl

这是个好东西。

这是个好东西。

这是个好东西。

重要的事情说三遍。个人认为，它虽然很小，但绝对逼格够高，搭配UIScrollView，绝对让你的界面高端起来。

关于这个的代码不小心被我删掉了，没法给大家展示，不过过几天我会用这个做一个APP的欢迎界面，到时候再展示咯。

UITextField

简单控件，可以参考先前的传值操作（传送门：[iOS开发——从一道题看Delegate](http://xdgcc.github.io/2015/10/19/iOS%E5%BC%80%E5%8F%91%E2%80%94%E2%80%94%E4%BB%8E%E4%B8%80%E9%81%93%E9%A2%98%E7%9C%8BDelegate/)），基本上把这个的用法实现的差不多了，要想更多地设置它————官方文档见。

UIDatePicker

顾名思义，日期选择控件。实现同上。

UIScrollView

有的时候呢，我们的照片，或者图片会很大，而允许我们输出的窗口却不够大，那么我们就需要这个家伙来帮忙了，它可以让一张图片在一个视图里滚动展示，效果类似于。。。做B超？（天，怎么会有这种脑洞大开的比喻）

大概就是这样整的：

![](http://upload-images.jianshu.io/upload_images/1336268-2549c2d87a033d02.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

UITextView

还是一个可编辑文本框，与先前的UITextField不同的是，这个可以显示更多行的内容，还可以对他进行编辑的监控，通过代理方法，我们可以获取该文本框中的内容，在实际的应用中，发布什么长微博啊，文本啊，都能用到它。

这里实现没什么好说的，主要来看看它的几个代理方法：

![](http://upload-images.jianshu.io/upload_images/1336268-19eef3bdfb34ea59.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

UIToolbar

开发中经常会用到的控件之一，实现起来也很简单，与此同时我们还要知道 UIBarButtonItem 和 Fixed Space Bar Button Item，这两个小东西是在Bar上的按钮和间距，都被对象化了。

来看代码：

#import "ViewController.h"
@interface ViewController ()
//声明
@property (nonatomic, strong) UIToolbar *mytoolbar;
@end
@implementation ViewController
- (void)viewDidLoad {
[super viewDidLoad];
//实例化
self.mytoolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 30)];
//添加到视图
[self.view addSubview:self.mytoolbar];
//选择风格，这里我们选择黑色风格
self.mytoolbar.barStyle = UIBarStyleBlack;
//添加按钮和按钮之间的间距，这些都被对象化了，按钮是可以实现方法的
UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithTitle:@"hello" style:UIBarButtonItemStylePlain target:self action:@selector(sayhello)];
UIBarButtonItem *fixed = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithTitle:@"bye" style:UIBarButtonItemStylePlain target:self action:@selector(saybye)];
//实例化的UIToolbar里面有items属性，是一个数组，用来存放我们要加上去的按钮
self.mytoolbar.items = @[item1, fixed, item2];
}
//点击item要实现的方法，输出hello或者bye
- (IBAction)sayhello{
NSLog(@"hello");
}
- (IBAction)saybye{
NSLog(@"bye");
}
- (void)didReceiveMemoryWarning {
[super didReceiveMemoryWarning];
// Dispose of any resources that can be recreated.
}
@end

UIPickerView

与前面的时间选择类似，只不过这个你可以自己设置内容。

UITableView

BOOM!

强大，异常强大。不多说，我推荐看[iOS开发系列--UITableView全面解析](http://www.cnblogs.com/kenshincui/p/3931948.html)这篇文章，写得很棒。

我自己也把大部分的学习时间用在了它的学习上，至今为止我觉得我还没能真正做到熟练地使用它，等以后成熟了，再写吧。

UICollectionView

又是一个庞大的家伙，在很多壁纸类APP中我们可以看到它的影子。

关于它的实现，我总结为以下几步：

.h文件声明代理和数据源
.m文件具体实现
声明UICollectionView
实例化，包括设置大小，位置，颜色等等
加载代理和数据源到实例化的view
注册cell（这里需要）
将实例化的UICollectionView加入到View中
实现数据源方法（包括必须实现的和选择实现的）
实现代理方法（包括必须实现的和选择实现的）

关于数据源方法和代理方法，在这里需要特别说明一下，我们还是会出现不知道这个数据源或者代理中到底有什么的困惑，我们要command进去这些代理或者数据源去发现和寻找，文档还是我们学习的最终归宿。

按照上面的步骤，实现代码：

#import "ViewController.h"
@interface ViewController ()
@property (nonatomic, strong) UICollectionView *collectionView;
@end
static NSString *cid = @"cid";
@implementation ViewController
- (void)viewDidLoad {
[super viewDidLoad];
// Do any additional setup after loading the view, typically from a nib.
UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc]init];
CGRect flame = CGRectMake(20, 40, self.view.frame.size.width-40, self.view.frame.size.height-60);
self.collectionView = [[UICollectionView alloc]initWithFrame:flame collectionViewLayout:flowlayout];
self.collectionView.dataSource = self;
self.collectionView.delegate = self;
[self.view addSubview:self.collectionView];
//注册cell
[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cid];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
return 50;
}
// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cid forIndexPath:indexPath];
cell.backgroundColor = [UIColor blueColor];
return cell;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
return CGSizeMake(120, 100);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
cell.backgroundColor = [UIColor yellowColor];
NSLog(@"%ld",indexPath.row);
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
cell.backgroundColor = [UIColor blueColor];
}
- (void)didReceiveMemoryWarning {
[super didReceiveMemoryWarning];
// Dispose of any resources that can be recreated.
}
@end

UIViewController

接下来我们来聊聊ViewController。视图控制器在我们开发中最重要的 MVC模式 中扮演着重要的角色，作为显示和数据的调度者，它的存在决定了我们的程序到底以怎样的形式呈现在用户面前。

这个最基础的Controller就不多说了，在目前的XCode中，一般来说新建的第一个Single View就是用的这个。

UINavigationController

很重要的一个东西。导航视图控制器。说简单点它就是一个来存放视图的栈，原则上先进后出，一层一层的来管理在它里面的视图。在学习它的过程中还要掌握UINavigationBar、UINavigationitem等控件，还要熟悉几个pop、push方法。

既然是导航视图控制器，导航自然不是导的一个视图，而是管理多个视图，实现的时候有很多需要注意的地方，我们一步一步的来看。

首先新建一个工程，我们要纯手写代码来搞定之。

第一步，建立我们需要管理的多个视图。

“command+N”新建Cocoa Touch Class，命名为myViewController，Subclass of选择为UIViewController，重复四次，我们获得了四个试图控制器，也就是四个视图，接下来我们将用导航视图控制器来管理它们。

第二步，初始界面设置

在这里，我们需要来到AppDelegate.m文件，来配置初始界面，自定义- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 方法。

代码如下：

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
// Override point for customization after application launch.
//获取屏幕大小
UIScreen *screen = [UIScreen mainScreen];
//初始化窗口
self.window = [[UIWindow alloc]initWithFrame:screen.bounds];
//将视图1设置为初始视图
myViewController1 *vc1 = [[myViewController1 alloc]init];
//来个背景颜色区分一下
vc1.view.backgroundColor = [UIColor blueColor];
//实例化导航视图控制器并添加视图1进来
UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:vc1];
//将导航视图控制器设置为窗口根视图
self.window.rootViewController = nc;
//设置窗口可见
[self.window makeKeyAndVisible];
return YES;
}

第三步，配置各个视图

我们要在第一个视图中实例化第二个视图，并通过某种方式，使用UINavigationController跳转到第二个视图；在第二个视图中实例化第三个视图，以此类推直到最后一个视图。当然，我们也可以选择直接跳到某个你想要去的视图，比如从第四个视图跳到第一个或者第二个。

我们现在视图一中添加一个按钮，添加一个点击按钮的事件，注意，我们就是通过这个事件方法来实现页面的跳转的，myViewController1.m代码：

#import "myViewController1.h"
#import "myViewController2.h"
@interface myViewController1 ()
@end
@implementation myViewController1
- (void)viewDidLoad {
[super viewDidLoad];
//设置视图二样式，添加一个按钮，点击触发事件，跳转到下一页面
UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
[btn setTitle:@"GO" forState:UIControlStateNormal];
btn.frame = CGRectMake(160, 100, 30, 36);
[btn addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
[self.view addSubview:btn];
UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(160, 160, 100, 36)];
lable.text = @"第一页";
[self.view addSubview:lable];
}
//这里才是实现页面跳转的重点！！！！
-(IBAction)go:(id)sender{
myViewController2 *vc2 = [[myViewController2 alloc]init];
vc2.view.backgroundColor = [UIColor greenColor];
//看这里！！！！！push方法将视图一推向视图二
[self.navigationController pushViewController:vc2 animated:YES];
}
- (void)didReceiveMemoryWarning {
[super didReceiveMemoryWarning];
// Dispose of any resources that can be recreated.
}

类似的，我们编写myViewController2.m，myViewController3.m，myViewController4.m的代码。我们稍微修改一下myViewController4.m中的go方法，让视图四直接跳到视图二：

-(IBAction)go:(id)sender{
//[self.navigationController popViewControllerAnimated:YES]; pop方法跳回前一视图
//[self.navigationController popToRootViewControllerAnimated:YES]; popToRoot方法直接跳回第一视图
NSArray *controllers = self.navigationController.viewControllers;
//popToViewController方法，我们可以选择要跳到的视图
[self.navigationController popToViewController:[controllers objectAtIndex:1] animated:YES];
}

UITabbarController

区别于UINavigationController的顶部导航，UITabbarController是底部导航，功能上差不多，可以直接切换多个视图，典型的应用非常多，微信，QQ都是，实现起来也是类似于上面的UINavigationController。

可以参考这篇资料：[iOS开发UI篇—UITabBarController简单介绍](http://www.cnblogs.com/wendingding/p/3775488.html)

简单地总结到这里，只是很简单的实现，日后通过文档再慢慢地学习更深层次的内容。
