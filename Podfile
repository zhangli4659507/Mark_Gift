
workspace ‘Mark_Gift_WorkSpace’
target ‘Mark_Gift’ do
platform :ios, '9.0'
use_frameworks!
pod 'UIColor_Hex_Swift'
pod 'Masonry'
pod 'SDWebImage'
pod 'ObjectMapper’, :git => ‘https://github.com/Hearst-DD/ObjectMapper.git’, :branch => ‘master’
pod 'Networking’, :git => ‘https://github.com/3lvis/Networking.git’, :branch => ‘master’
end 
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end
