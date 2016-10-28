#
# Be sure to run `pod lib lint CMPageControl.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CMPageControl'
  s.version          = '0.0.1'
  s.summary          = 'CMPageControl is a UIPageControl customisable'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'CMPageControl is a UIControl working like a UIPageControl but support horizontal
vertical display and is customisable. Currently you can customize the borderWidth, the backgroundColor, the borderColor and an image if you want images instead of basic views'

  s.homepage         = 'https://github.com/Mycose/CMPageControl'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Clément Morissard' => 'morissard@gmail.com' }
  s.source           = { :git => 'https://github.com/Mycose/CMPageControl.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CMPageControl/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CMPageControl' => ['CMPageControl/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
