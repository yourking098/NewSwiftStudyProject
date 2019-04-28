source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '9.0'

use_frameworks!

target "SwiftStudyProject" do

    #Framework的制作与使用教程
    #pod 'AFNetworking'
pod 'Moya'#Swift 网络请求 包含Moya、Alamofire【1、HTTP网络操作库Alamofire使用详解   2、网络抽象层库Moya的使用详解】【Moya 作为一个基于 Alamofire 的更高层网络请求封装抽象层，拥有更好更清晰的网络管理】

pod 'SnapKit'#Swift自动布局 AutoLayout框架OC Masonry【2、自动布局库SnapKit的使用详解】
pod 'ObjectMapper'#网络请求回来的JSON解析【3、使用ObjectMapper实现模型转换】
pod 'RxSwift'#iOS MVVM之ReactiveCocoa 函数响应编程【4、RxSwift的使用详解】
pod 'RxCocoa'

pod 'MJRefresh'#第三方下拉刷新组件MJRefresh【5、MJRefresh库的使用详解】
#pod 'JRefresh' #OC MJRefresh

pod 'ReachabilitySwift'#用来检查应用当前的网络连接状况。

pod 'SwipeCellKit'#第三方单元格滑动按钮库SwipeCellKit【 单元格滑动按钮库SwipeCellKit使用详解】
pod 'Charts'#第三方图表库Charts【第三方图表库Charts使用详解】
pod 'CryptoSwift'#第三方加密库CryptoSwift【 第三方加密库CryptoSwift使用详解】
pod 'MBProgressHUD'#第三方透明指示器MBProgressHUD【第三方透明指示器MBProgressHUD使用详解】
pod 'PromiseKit'#第三方异步编程库PromiseKit【异步编程库PromiseKit使用详解】
pod 'SideMenu'#第三方侧栏菜单组件SideMenu【第三方侧栏菜单组件SideMenu使用详解】

pod 'FMDB'#第三方SQLite库FMDB【第三方SQLite库FMDB使用详解】
#pod 'AAInfographics'#第三方图表库AAInfographics【第三方图表库AAInfographics使用详解】
pod 'SwiftDate'#第三方日期处理库SwiftDate【第三方日期处理库SwiftDate使用详解】
#pod 'PagingMenuController'#【分页菜单的实现（使用PagingMenuController库实现tab标签切换）】
pod 'SwiftForms'#【SwiftForms的使用详解（第三方Form表单组件 ）】

pod 'GCDWebServer'#【GCDWebServer使用详解1（介绍、安装配置、HTTP服务实现）】
#pod 'GCDWebServer/WebUploader'
#pod 'GCDWebServer/WebDAV'

pod 'XCGLogger'#【日志框架XCGLogger的使用详解】


end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_BITCODE'] = 'NO'
        end
    end
end

