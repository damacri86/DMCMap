#
# Be sure to run `pod lib lint DMCMap.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DMCMap'
  s.version          = '0.1.0'
  s.summary          = 'Map view with vitamins.'
  s.description      = 'MKMapView with accessories.'
  s.homepage         = 'https://github.com/damacri86/DMCMap'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'damacri86' => 'damacri86@gmail.com' }
  s.source           = { :git => 'https://github.com/damacri86/DMCMap.git', :tag => 0.1 }
  s.ios.deployment_target = '9.0'
  s.source_files = 'DMCMap/Classes/**/*'
  s.frameworks = 'UIKit', 'MapKit', 'Foundation'
end
