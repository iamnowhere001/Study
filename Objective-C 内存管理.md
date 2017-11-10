Objective-C 内存管理

8.Objective-C的内存管理
参考答案： 现在内存管理几乎都采用ARC，也就是Automatic Reference Counting，意思是自动引用计数。由编译器在编译时自动为添加retain、release等代码。

如果问的MRC，也就是Manual Reference Counting，意思是手动内存管理。

黄金法则：谁使对象的引用计数+1，不再使用该对象时，谁就应该使该对象的引用计数-1。
8、描述一下iOS的内存管理，在开发中对于内存的使用和优化包含哪些方面。我们在开发中应该注意哪些问题。
参考答案：

内存管理准则：谁强引用过，谁就在不再使用时使引用计数减一。

对于内存的使用和优化常见的有以下方面：

重用问题：如UITableViewCells、UICollectionViewCells、UITableViewHeaderFooterViews设置正确的reuseIdentifier，充分重用。
尽量把views设置为不透明：当opque为NO的时候，图层的半透明取决于图片和其本身合成的图层为结果，可提高性能。
不要使用太复杂的XIB/Storyboard：载入时就会将XIB/storyboard需要的所有资源，包括图片全部载入内存，即使未来很久才会使用。那些相比纯代码写的延迟加载，性能及内存就差了很多。
选择正确的数据结构：学会选择对业务场景最合适的数组结构是写出高效代码的基础。比如，数组: 有序的一组值。使用索引来查询很快，使用值查询很慢，插入/删除很慢。字典: 存储键值对，用键来查找比较快。集合: 无序的一组值，用值来查找很快，插入/删除很快。
gzip/zip压缩：当从服务端下载相关附件时，可以通过gzip/zip压缩后再下载，使得内存更小，下载速度也更快。
延迟加载：对于不应该使用的数据，使用延迟加载方式。对于不需要马上显示的视图，使用延迟加载方式。比如，网络请求失败时显示的提示界面，可能一直都不会使用到，因此应该使用延迟加载。
数据缓存：对于cell的行高要缓存起来，使得reload数据时，效率也极高。而对于那些网络数据，不需要每次都请求的，应该缓存起来，可以写入数据库，也可以通过plist文件存储。
处理内存警告：一般在基类统一处理内存警告，将相关不用资源立即释放掉
重用大开销对象：一些objects的初始化很慢，比如NSDateFormatter和NSCalendar，但又不可避免地需要使用它们。通常是作为属性存储起来，防止反复创建。
避免反复处理数据：许多应用需要从服务器加载功能所需的常为JSON或者XML格式的数据。在服务器端和客户端使用相同的数据结构很重要。
使用Autorelease Pool：在某些循环创建临时变量处理数据时，自动释放池以保证能及时释放内存。
正确选择图片加载方式：详情阅读[细读UIImage加载方式](http://www.henishuo.com/image-loaded-method/)2、谈谈Objective-C的内存管理方式及过程参考答案：对于Objective-C，在MRC下内存是手动管理的，而在ARC下，我们不用手动去添加retain/release，但是其内存管理法则是一样的。内存管理黄金法则：谁使对象的引用计数+1，谁就负责管理使该对象的引用计数-1。说说内存管理的过程：在MRC下，对于需要手动释放的对象的内存管理，我们通过release使对象引用计数-1，若其引用计数变成0，则对象会被立刻释放掉。对于autorelease交给自动释放池管理的对象，每个runloop循环结束就会去自动释放池中使所有autorelease类型对象的引用计数减一，若变成0，则释放之。在ARC下，我们没有不能直接调用retain/release来管理释放，都是交给自动释放池来管理的。因此，若创建临时变量，想要使用完就释放之，需要在临时变量放到新创建的自动释放池里，这样就可以使用完后就到达了自动释放池的一个循环，就会去使对象引用计数减一，变成0后释放之。最后：对于交给自动释放池管理的对象，是在每个run loop事件循环结束时才会去使对象引用计数减一，此时引用计数为0的才会得到释放。

iOS 是如何管理内存的？
这个问题的话上篇文章也提到过,讲下block的内存管理,ARC下的黄金法则

这里说下swift里的内存管理:
delgate照样weak修饰,闭包前面用[weak self],swift里的新东西,unowned,举例,如果self在闭包被调用的时候可能为空,则用weak,反之亦然,如果为空时使用了unowned,程序会崩溃,类似访问了悬挂指针,在oc中类似于unsafe_unretained,类似assign修饰了oc对象,对象被销毁后,被unowned修饰的对象不会为空,但是unowned访问速度更快,因为weak需要unwarp后才能使用

autorelease原理：
1.先建立一个autorelease pool
2.对象从这个autorelease pool里面生成。
3.对象生成之后调用autorelease函数，这个函数的作用仅仅是在autorelease pool中做个标记，让pool记得将来release一下这个对象。

当pool要把池中的对象release的时候，pool本身也需要rerlease, 此时pool会把每一个标记为autorelease的对象release一次。如果某个对象此时retain count大于1，这个对象还是没有被销毁。（被标为autorelease的对象，并不是等程序结束时才release，如：在viewDidLoad中创建一个autorelease对象，在viewDidLoad走完，一次消息循环完毕，这个autorelease pool中的对象就会被release，button的点击事件，点击代码执行完会release一下autolease类型的变量）

上面这个例子应该这样写：
ClassName *myName = [[ClassName alloc] init] autorelease];//标记为autorelease
[classA setName:myName]; //retain count == 2  (如果myName的属性是retain的话)
[myName release]; //retain count==1，注意，在ClassA的dealloc中不能release name，否则release pool时会release这个retain count为0的对象，这是不对的。

记住一点：如果这个对象是你alloc或者new出来的，你就需要调用release。如果使用autorelease，那么仅在发生过retain的时候release一次（让retain count始终为1）。 

objc的内存管理
     如果您通过分配和初始化（比如[[MyClass alloc] init]）的方式来创建对象，您就拥有这个对象，需要负责该对象的释放。这个规则在使用NSObject的便利方法new 时也同样适用.

如果您拷贝一个对象，您也拥有拷贝得到的对象，需要负责该对象的释放.
如果您保持一个对象，您就部分拥有这个对象，需要在不再使用时释放该对象。

如果您从其它对象那里接收到一个对象，则您不拥有该对象，也不应该释放它（这个规则有少数的例外，在参考文档中有显式的说明）。

自动释放池是什么,如何工作

     当您向一个对象发送一个autorelease消息时，Cocoa就会将该对 象的一个引用放入到最新的自动释放池。它仍然是个正当的对象，因此自动释放池定义的作用域内的其它对象可以向它发送消息。当程序执行到作用域结束的位置时，自动释放池就会被释放，池中的所有对象也就被释放。

内存泄漏解释　　简单的说就是申请了一块内存空间，使用完毕后没有释放掉。它的一般表现方式是程序运行时间越长，占用内存越多，最终用尽全部内存，整个[系统崩溃](http://baike.baidu.com/view/765121.htm)。由程序申请的一块内存，且没有任何一个指针指向它，那么这块内存就泄露了。
一般我们常说的内存泄漏是指堆内存的泄漏。堆内存是指程序从堆中分配的，大小任意的（内存块的大小可以在程序运行期决定），使用完后必须显示释放的内存。[应用程序](http://baike.baidu.com/view/330120.htm)一般使用malloc，realloc，new等函数从堆中分配到一块内存，使用完后，程序必须负责相应的调用free或delete释放该内存块，否则，这块内存就不能被再次使用，我们就说这块内存泄漏了。使用leaks工具帮助查看内存泄漏问题.在的XCode工具列，Run=>“Run with Perfromance Tool=>Leak
在iPhone程式开发中，使用NSLog直接在控制台印出retainCount也是一个检视內存泄漏的方法，但是的XCode提供了更方便的泄漏工具供开发者使用。

[http://blog.csdn.net/cloudhsu/archive/2010/07/22/5754818.aspx](http://blog.csdn.net/cloudhsu/archive/2010/07/22/5754818.aspx)
   （重要）
内存泄漏的表现   怎样判断内存泄漏?内存泄漏有哪些表现？
-(void)addFile:(id)fileName //注意下面对这个函数的调用。 函数参数名就是一个局部变量。
{   //[computers  setObjectValue:[NSCalendarDate date]];//设置当前时间
ImageData *data = [[[ImageData alloc] init] autorelease]; ImageVideo *tempData=[[ImageVideo alloc] init]; [data setFileName:fileName];//特别注意fileName是上面addFile这个函数的参数   fileName作为一个局部变量，作为一个参数传值给函数setFileName。
[data setFilePath:fileName];//这里并不是c语言中，的实参传形参。实参和形参是相对而言， fileName在这里作为实参传给函数
setFileName
[data
setFileDate:[[NSCalendarDate date] description]];//注意此行的写法。
[data setImage:[NSImage imageNamed:@"100元人民币.jpg"]];

[tempData
setFileName
:fileName];
[tempData
setFilePath
:fileName];

tempData.
imageID=@"2"
;
// tempData.videoView=[NSImage imageNamed:@"100
元人民币.jpg"];
tempData.videoView=[NSImage imageNamed:fileName];

[
computers addObject
:tempData];
[tempData
release]; [browserView reloadData];
[imagesbrowserView reloadData];//这句话很关键。动态加载 通知表格视图重新装载（reload）数据。
}

3. 属性readwrite，readonly，assign，retain，copy，nonatomic 各是什么作用，在那种情况下用？
readwrite 是可读可写特性；需要生成getter方法和setter方法时
readonly 是只读特性  只会生成getter方法 不会生成setter方法 ;不希望属性在类外改变
assign 是赋值特性，setter方法将传入参数赋值给实例变量；仅设置变量时；
retain 表示持有特性，setter方法将传入参数先保留，再赋值，传入参数的retaincount会+1;
copy 表示赋值特性，setter方法将传入对象复制一份；需要完全一份新的变量时。
nonatomic 非原子操作，决定编译器生成的setter getter是否是原子操作，atomic表示多线程安全，一般使用nonatomic

Objective-C的内存管理主要有三种方式ARC（自动内存计数）、手动内存计数、内存池。
 
9.内存管理的几条原则时什么？按照默认法则.那些关键字生成的对象
需要手动释放？在和property结合的时候怎样有效的避免内存泄露？
谁申请，谁释放；
遵循Cocoa Touch的使用原则；
内存管理主要要避免“过早释放”和“内存泄漏”，对于“过早释放”需要注意@property设置特性时，一定要用对特性关键字，对于“内存泄漏”，一定要申请了要负责释放，要细心。
关键字alloc 或new 生成的对象需要手动释放；
设置正确的property属性，对于retain需要在合适的地方释放，

1.栈、堆
     栈
     1.栈内存是由系统管理的
     2.栈是用来存放局部变量
     3.当代码执行到定义哪一行为这个局部变量分配存储空间
     4.当程序执行到定义变量的代码块结束的时候，就会回收这个变量
     堆：
     1，堆内存是由程序员管理（动态存储区）
     2. OC中的对象时在堆内存中
 
 2.引用计数器：
 OC中每一个对象，都有4个字节存储空间，用来存放引用计数的值
 作用：
    引用计数器的值，就是当前有多少个人在使用对象
    当引用计数器为0时候，系统会立即回收这个对象
 在OC中判断一个对象是否被回收的唯一依据：就是看这个对象的引用计数器是否为0
 
 如何操作引用计数器：
     1.当新创建一个对象的时候，他引用计数器为1（new,alloc,copy,multableCopy）
     2.当给一个对象发送retain消息，它的引用计数器+1
     3.当给一个对象发送release消息，它的引用计算器-1
 
 当一个对象的引用计数器为0时候，系统就会调用dealloc
 作用：1.验证对象是否被回收了
      2.释放对象自己的资源

 当一个对象的引用计数器为0的时候，这个对象就是僵尸对象
 
 3.野指针：
 当一个对象指针指向一个僵尸对象的时候，那么这个指针就是野指针
 当定义一个指针，而这个指针没有进行初始化
 
 操作野指针是非常危险的：1.程序崩溃了 2.数据错误

 4.内存管理是来管理“OC对象”的内存的
 
 内存管理不当造成两个问题：
     一个对象不再使用了，但是依然占据内存，内存泄露
     一个对象正在被使用，但却已经释放了，野指针。
 
 5.空指针：
 nil：OC实例对象的指针指向nil时，这个指针就是一个空指针
 1.给空指针发送消息不会报错 2、它不会去调用方法
 
 当一个指针已经被release了那么还要对该指针做一个清空的操作（person = nil）
 防止后面使用到该指针的时候导致程序崩溃
 
 6.nil ，Nil ,NULL,NSNull的区别
 nil  ：OC对象的空指针
 Nil  ：OC类对象的空指针
 NULL ：C语言的空指针
 NSNull：是一个单例对象，用来在OC的集合中占的位置

 7.内存管理的原则：
     1、当有人使用这个对象就不要释放这个对象
     2、当没有人使用这个对象就释放该对象
 
 8.OC手动内存管理的黄金法则：
 凡是调用alloc，new,copy,multableCopy创建一个新对象或调用retain
 让对象的引用计数+1，都必须相应的调用一次release或者autorelease
 
 9.@property参数
 管理内存
 retain 生产内存管理的代码
 assign 没有内存管理的代码（默认）
 
 当使用OC对象时候，就用retain
 当使用非OC对象(基本数据类型，枚举，结构体)时候，就用assign
 当使用NSString，Block对象时候，就用copy

 控制线程安全
 nonatomic : 非线程安全的，不加锁，速度快（iOS基本都是用这个）
 atomic：线程安全的，加锁，速度慢（默认的）
 
 控制访问权限
 readonly 表示只读，只生成getter方法，不生产setter方法
 readwrite 表示可读写的，既生成getter又生产setter方法
 
 修改getter和setter方法名称
 getter=getter方法的名称
 setter=setter方法的名称:
 
 一般当一个成员变量是BOOL类型时候，需要修改getter方法名称，为is+属性名称首字母大写
 
 10.@class 使用格式
 @lass 类名;
 作用：告诉编译器，@class后面是一个类，但是类中有什么样属性，什么方法都不知道
 
 @class 主要功能就是用来解决循环导入问题
 在头文件中使用@class说明这个类
 如果在实现文件中有用到这个类的方法或属性，就必须在实现文件(.m文件）导入这个类
 
 11.循环retain，导致在环中的所有对象对象都不能释放，（内存泄露）
 解决方法：
 只要环中有一条线用retain的，另一条线是assign
 注意：用assign的一端在重写dealloc方法时不需要给对方的对象做release释放操作
 
 12.autorelease 基本使用
 作用：延迟对象的释放时间
 原理：
 当一个对象调用autorelease时候，就会把这个对象放到自动释放池中，这时候对象应用计数器没有发生改变
 当自动释放池销毁的时候，会对池中所有对象进行一次release操作
 当你给一个对象发送多少次autorelease消息，那么当自动释放池销毁时候，就会相应的调用多少次release

进程空间  一个进程就是一个程序
    代码区：只读。
    全局区：进程启动时分配，进行结束时释放。
    栈：局部变量，自动创建、自动释放空间

   堆：自己创建、自己回收释放，对象是保存在堆区的。

    内存管理：主要对堆内存进行管理，所谓的管理，内存的分配（创建）和释放（回收）。

IOS的内存管理方式 RC:Reference（引用）Counting(计数器)
     MRC   Manual 手动的
     ARC    Automatic 自动的

MRC(手动内存管理)
   a.每个对象都有自己的引用计数器，引用计数器是用来计算对象被引用的次数。
   b.创建对象时(alloc、new)，此时通知引用计数器加1 。RC: +1
   c.当你需要使用一个别人创建好的对象时，为了防止在使用此对象期间别人释放了这个对象，我们要将此对象的引用计数器加1(程序员通知引用计数器)，只要给对象发送retain消息，引用计数器就会加1. RC:+1
   d.当你使用的对象不再使用时，你有责任通知引用计数器减1，发送release消息。RC:-1
   e.当对象的引用计数器为0时，说明已经没有任何引用指向对象，对象就会被系统销毁，系统销毁对象之前，会自动向对象发送一条消息"dealloc"消息，对象所占的空间就会被释放，千万不要自己去调用dealloc消息。
   f.可以使用"retainCount消息"，查看当前引用计数器的值。
   g.当你指向的对象，不再使用时，如果忘了发送release消息，内存泄漏。(资源浪费)
   h.当引用指向对象，已经不存在了，继续向对象发送消息，会发生问题，异常、crash
   i.没有相应内存的指针，野指针。
   j.会使用空指针，解决野指针问题，而在OC中，向空指针发送消息，是不会报错的。stu = nil;

IOS6声明属性的使用（附加属性）  声明属性默认情况下，并没有解决内存问题
定义属性的时候，内存管理的描述
     @property(nonatomic,strong)…;
     @property(nonatomic,weak)…;
    当使用@property(retain) 引用数据类型 …，帮我们解决了，setter使用中的内存问题，但dealloc中的release操作，我们自己来做。
     语法格式
    @property(参数1,参数2)引用类型* 变量名；
    @property(nonatomic, retain)TRStudent* stu;
     参数2
    retain 如果属性是对象(引用数据类型)，就会使用此关键字，解决内存问题。
    assign 如果属性是基本数据类型（不存在内存问题），默认值就是assign，不会解决内存问题。
    copy 一些特殊对象类型（字符串），如果不希望和别人共享一个对象，用copy会自动创建一个新的对象。 NSString 
    readonly 只读，去掉setter，只保留getter 
    retain与copy的区别： retain相当于引用复制(浅拷贝)；copy相当于内容复制(深拷贝)
-(void)setBook:(TRBook *)book{
    //assign
    _book = book; //_book
实例变量

    //retain
    _book = [book retain];
 
    //copy
对book对象copy一次 副本

    _book = [book copy];
}
使用assign: 对基础数据类型 （NSInteger，CGFloat）和C数据类型（int, float, double, char, 等等）
使用copy： 对NSString
使用retain： 对其他NSObject和其子类
delegate 用 assign 而不使用 retain
循环引用，引用计数增加，很容易内存泄漏
assign 不增加计数
retain 增加技数

    参数1 多线程(UI Foundation高级) 多线程 耗资源
    nonatomic 非原子性操作 安全性低，效率高。
    atomic 原子性操作，在多线程使用的时候，一般来防止写未完成的时候，被另一个线程读取，造成数据安全性问题，这种操作是耗费资源的。
    手机不可以同时用两个软件打开一个文件 同时使用一个资源的可能性低    ios8支持多任务

autoreleasepool 自动释放池
    通过自动释放池来管理对象，只需要一个自动释放池，可以管理很多对象，当自动释放池结束的时候，会自动向池中的每个对象都发送release消息。自动释放池是可以嵌套的，会先释放里面的，再释放外面的。工厂方法通常都实现了发送autorelease消息。
 
内存管理ARC自动引用计数器管理
ARC IOS5.0以后才支持，IOS7.0以后强制使用ARC。ARC "Automatic" Refercences Counting
    使用引用计数器来管理内存，只是引用计数器的操作方式不同，由程序员发送消息转换为“编译器”帮我们自动发送消息，会在合适的位置自动加入retain、release、autorelease消息来进行计数器的管理，ARC是一种编译期语法。
     在ARC中，程序中不能出现retain、release、autorelease…程序不能在dealloc方法中显式调用父类的dealloc方法，一切在MRC中和内存相关的操作，ARC中都不能使用。

强引用 在程序中定义的引用，默认为强引用，所谓的强引用指向一个对象时，对象的引用计数器会自动加1，当引用超出作用域"{}"，对象的引用计数器就会减1.
   __strong TRStudent* student = [TRStudent alloc]init];
当一个对象被强引用指向时，此对象会隐式的retain一次，当强引用超出作用域时，指向的对象会隐式的发送release消息一次。引用在使用的时候，会根据作用域的范围，自动做加1或减1的操作。
弱引用
    __weak TRStudent* student;
仅仅就是指向对象，但不会隐式的发送retain消息，出了作用域也不会发送realse消息。
     当一个弱引用指向的对象，未销毁时，向对象发送消息，(此弱引用会自动的变为强引用。)(xcode4.x)版本
当一个弱引用指向的对象被销毁时，弱引用本身会自动的赋值为空。(nil)
       zeroing weak reference

其它修饰关键字 @property(nonatomic,unsafe_unretained)int age;
     unsafe_unretained等同于"assign"，功能和__weak几乎一样，唯一不同，没有"zeroing weak reference"，通常使用在基本数据类型。
     __autoreleaseing 用在方法的返回值，将返回值的对象放入到自动释放池中。
     +(id)student{
         __autoreleaseing TRStudent* student = [[TRStudent alloc]init];
         return student;
     }

dealloc方法
     在ARC下，dealloc方法不允许调用父类的dealloc方法，当然也不允许向任何对象发送release消息，所以说dealloc方法几乎无用。 
     在一些特殊情况下需要重写dealloc方法。
 1)在类中使用了C语言中的函数malloc分配内存。
 2)在类中使用了C++语言中的函数new等方式创建内存空间。
    此时需要在dealloc中对这些特殊的空间进行释放。

声明引用自动置空
    在ARC下，如果定了一个引用没有赋值，编译会自动的初始化设置引用为空值。TRStudent* student;
    为了尊重C语言的规范，基本数据类型没有初始化值，依然是垃圾值。

MRC和ARC混用
     a.把MRC的代码转换成ARC的代码(手动)  retain=>strong 
          release、autorelease、[super dealloc]删除掉。
     b.xcode提供了自动将MRC转换成ARC的功能。
       菜单栏(Edit)->Refacotor(重构)->Convert to Objective-C ARC
     c.在ARC项目中继续使用MRC编译的类 在编译选项中标识MRC文  "-fno-objc-arc”

关于 retain copy assign strong weak的辨别
1.MRC
    @property(nonatomic,retain)TRBook* stu;
    //setter
    _stu = stu;            //地址传递
    _stu = [stu retain];//通知引用计数器加1
    @property(nonatomic,copy)NSString* name;
    //setter
    _name = name;
    _name = [name copy];//复制了参数对象
    @property(nonatomic,assign)int age;
    //setter
    _age = age;//值传递
2.ARC
     retain
    @property(nonatomic,strong)TRBook* stu;
    //setter
    _stu = stu; //强引用指向对象时，会自动通知引用计数器加1
      assign
    @property(nonatomic,weak)TRBook* stu;
    //setter
    _stu = stu; //弱引用指向对象时，不会自动通知引用计数器加1
    @property(nonatomic,copy)NSString* name;
    //setter
    _name = [name copy];//复制了参数对象
      assign
    @property(nonatomic,unretain__unsafe)int age;
    //setter
    _age = age;//值传递
