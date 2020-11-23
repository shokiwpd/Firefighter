platform :ios, '11.0'
use_frameworks!

target 'FireFighters' do
    pod 'Firebase/Core'
    pod 'Firebase/Database'
    pod 'Firebase/Auth'
    pod 'Firebase/Storage'
    pod 'Firebase/Messaging'
    pod 'MBProgressHUD'
    pod 'ReachabilitySwift'
    pod 'iosMath'
    pod 'IQKeyboardManagerSwift'

    post_install do |pi|
        pi.pods_project.targets.each do |t|
          t.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
          end
        end
    end

end

