Pod::Spec.new do |s|
  s.name             = 'DynamicButton'
  s.version          = '1.0.0'
  s.license          = 'MIT'
  s.summary          = 'Yet another animated flat buttons in Swift'
  s.homepage         = 'https://github.com/yannickl/DynamicButton.git'
  s.social_media_url = 'https://twitter.com/yannickloriot'
  s.authors          = { 'Yannick Loriot' => 'contact@yannickloriot.com' }
  s.source           = { :git => 'https://github.com/yannickl/DynamicColor.git', :tag => s.version }
  s.screenshot       = 'http://yannickloriot.com/resources/dynamicbutton.gif'

  s.ios.deployment_target = '9.0'

  s.framework    = 'UIKit'
  s.source_files = 'DynamicButton/*.swift'
  s.requires_arc = true
end
