#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint root_checker_plus.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'root_checker_plus'
  s.version          = '1.1.0'
  s.summary          = 'Plugin used for detecting root device in android and jailbreak detection ios.'
  s.description      = <<-DESC
Plugin used for detecting root device in android and jailbreak detection ios.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'root_checker_plus/Sources/root_checker_plus/**/*.swift'
  s.dependency 'Flutter'
  s.dependency 'DTTJailbreakDetection'
  s.platform = :ios, '13.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
