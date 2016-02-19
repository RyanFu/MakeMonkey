
#define iPhone6 [UIScreen mainScreen].bounds.size.height==667
#define iPhone6plus  [UIScreen mainScreen].bounds.size.height==736

#define iPhone4 [UIScreen mainScreen].bounds.size.height==480
//判断是否是iPhone5
#define iPhone5 [UIScreen mainScreen].bounds.size.height==568  //iphone5

//主屏宽
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
//主屏高
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
//当前设备的ios版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define IOS7  ([[UIDevice currentDevice].systemVersion doubleValue] >=7.0)
//当前设备的语言
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

//软键盘高度
#define KEYBOARD_HEIGHT 216.0f
//状态栏高度
#define STATUS_HEIGHT 20.0f
//[[UIApplication sharedApplication] statusBarFrame].size.height
//导航栏高度
#define NAVIGATION_HEIGHT  44.0f
//(self.navigationController.navigationBar.frame.size.height)
//tabBar高度
#define BUTTOMBAR_HEIGHT 49.0f
//(self.tabBarController.tabBar.frame.size.height)

#define DEFAULT_FRAME CGRectMake(0.,0.,SCREEN_WIDTH,SCREEN_HEIGHT)
//设置系统字体大小
#define SystemFont(size) [UIFont systemFontOfSize:(size)];
//去掉状态栏和导航栏的视图大小
#define BOTTOM_FRAME CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT-STATUS_HEIGHT-NAVIGATION_HEIGHT)
//去掉状态栏,导航栏和TabBar的视图大小
#define MIDDLE_FRAME CGRectMake(0,NAVIGATION_HEIGHT,SCREEN_WIDTH,SCREEN_HEIGHT-STATUS_HEIGHT-NAVIGATION_HEIGHT-BUTTOMBAR_HEIGHT)
//默认采色
#define THEME_COLOR [UIColor colorWithRed:230.0/255.0 green:80.0/255.0 blue:78.0/255.0 alpha:1.0] //主题色
#define BACKGROUND_COLOR  [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1.0] //背景色

#define TEST_BIGBACKGROUND_COLOR [UIColor colorWithRed:212.0/255.0 green:213.0/255.0 blue:214.0/255.0 alpha:1.0] //答题大背景色

#define TEST_SMALLBACKGROUND_COLOR [UIColor colorWithRed:235.0/255.0 green:236.0/255.0 blue:237.0/255.0 alpha:1.0] //答题小题目背景色

//空值
#define NULL_VALUE @""

#define Y_Version  [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString*)kCFBundleVersionKey]

//#define API_BASE_URL_STRING(_URL_) [NSString stringWithFormat:@"%@%@",@"http://112.74.194.198:8080/pinpin/",_URL_] //测试环境

#define API_BASE_URL_STRING(_URL_) [NSString stringWithFormat:@"%@%@",@"http://172.16.10.27/",_URL_] //正式环境
#define URL_QUERY @"AppInfoManage/query.php" //查询
#define URL_INSERT @"AppInfoManage/insert.php" //插入


#define MD5KEY @"LJR1AmH5ZwRjBQtjZTWxMt=="
#define VLog(v) NSLog(@#v":%@",v)

//获取UserDefault
#define SYSTEM_USERDEFAULTS [NSUserDefaults standardUserDefaults]

//RGB颜色转换（16进制->10进制）
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define ShareAppDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


//获取当前应用版本号
#define Y_APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]


//typedef void (^)(AFHTTPRequestOperation *operation, id responseObject) blockOperation;
