Pod::Spec.new do |s|
  s.name             = 'PlayonNetworkSdk'
  s.version          = '1.0.0'
  s.summary          = 'PLAYON Network SDK'
  s.description      = 'PLAYON Network SDK'
  s.homepage         = 'http://playon.network'
  s.license          = { :file => 'LICENSE' }
  s.author           = { 'PLAYON Network' => 'devs@playon.network' }
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.platform         = :ios, '12.0'

  s.dependency 'Flutter'
  s.dependency 'FlutterPluginRegistrant'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
