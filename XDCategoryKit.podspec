
Pod::Spec.new do |s|
  s.name             = 'XDCategoryKit'
  s.version          = '0.1.1'
  s.summary          = 'category tool'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/MR-WXD/XDCategoryKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wxd' => 'wangxd_code@163.com' }
  s.source           = { :git => 'https://github.com/MR-WXD/XDCategoryKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.default_subspec = 'framework'
  s.subspec 'source' do |source|
     source.source_files = 'XDCategoryKit/Classes/**/*'
     
  end
  s.subspec 'framework' do |framework|

    framework.ios.vendored_frameworks = 'XDCategoryKit/Pod/*.framework'
  end
  
  
  # s.resource_bundles = {
  #   'XDCategoryKit' => ['XDCategoryKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
