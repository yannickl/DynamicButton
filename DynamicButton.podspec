Pod::Spec.new do |s|
  s.name             = 'DynamicButton'
  s.version          = '6.1.0'
  s.license          = 'MIT'
  s.summary          = 'Yet another animated flat buttons in Swift'
  s.homepage         = 'https://github.com/yannickl/DynamicButton.git'
  s.social_media_url = 'https://twitter.com/yannickloriot'
  s.authors          = { 'Yannick Loriot' => 'contact@yannickloriot.com' }
  s.source           = { :git => 'https://github.com/yannickl/DynamicButton.git', :tag => s.version }
  s.screenshot       = 'http://yannickloriot.com/resources/dynamicbutton.gif'

  s.ios.deployment_target  = '8.0'
  s.tvos.deployment_target = '9.0'

  s.ios.framework  = 'UIKit'
  s.tvos.framework = 'UIKit'

  s.source_files = 'Sources/**/*.swift'
  s.requires_arc = true
end
