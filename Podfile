source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '9.0'

use_frameworks!

target "SwiftStudyProject" do

    #pod 'AFNetworking'
    #pod 'MJRefresh'

pod 'SnapKit'#Swift自动布局 AutoLayout框架OC Masonry
pod 'RxSwift'#iOS MVVM之ReactiveCocoa 函数响应编程
pod 'RxCocoa'
pod 'Moya'#Swift 网络请求 包含Moya、Alamofire ,OC AFNetworking
#pod 'JRefresh' #OC MJRefresh
pod 'ObjectMapper'#网络请求回来的JSON解析
pod 'ReachabilitySwift'#用来检查应用当前的网络连接状况。

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_BITCODE'] = 'NO'
        end
    end
end

