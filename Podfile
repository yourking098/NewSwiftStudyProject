source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '9.0'

use_frameworks!

target "SwiftStudyProject" do

    #pod 'AFNetworking'
    
pod 'SnapKit'#Swift自动布局 AutoLayout框架OC Masonry
pod 'RxSwift'#iOS MVVM之ReactiveCocoa 函数响应编程
pod 'RxCocoa'
pod 'Moya'#Swift 网络请求 包含Moya、Alamofire ,OC AFNetworking
#pod 'JRefresh' #OC MJRefresh
pod 'ObjectMapper'#网络请求回来的JSON解析
pod 'ReachabilitySwift'#用来检查应用当前的网络连接状况。


pod 'SwipeCellKit'#第三方单元格滑动按钮库SwipeCellKit
pod 'Charts'#第三方图表库Charts
pod 'CryptoSwift'#第三方加密库CryptoSwift
pod 'MBProgressHUD'#第三方透明指示器MBProgressHUD
pod 'PromiseKit'#第三方异步编程库PromiseKit
pod 'SideMenu'#第三方侧栏菜单组件SideMenu
pod 'MJRefresh'#第三方下拉刷新组件MJRefresh

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_BITCODE'] = 'NO'
        end
    end
end

