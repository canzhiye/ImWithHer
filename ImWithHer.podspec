#
# Be sure to run `pod lib lint ImWithHer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ImWithHer'
  s.version          = '0.1.2'
  s.summary          = 'Solicit donations on behalf of Hillary with just a few lines of code.'

  s.description      = 'Donald Trump is unacceptable and we must do everything we can to stop him. This pod allows you to prompt your users to donate to Hillary with just a few lines of code.'

  s.homepage         = 'https://github.com/canzhiye/ImWithHer'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'canzhiye' => 'canzhiye@gmail.com' }
  s.source           = { :git => 'https://github.com/canzhiye/ImWithHer.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/canzhiye'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ImWithHer/Classes/**/*'
end
