#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint uikit.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'uikit_bindings'
  s.version          = '0.0.1'
  s.summary          = 'Bindings of UIKit components for Flutter using FFI'
  s.description      = <<-DESC
Bindings of UIKit components for Flutter using FFI
                       DESC
  s.homepage         = 'https://github.com/orestesgaolin/uikit-bindings'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Dominik Roszkowski' => 'email@example.com' }

  # This will ensure the source files in Classes/ are included in the native
  # builds of apps using this FFI plugin. Podspec does not support relative
  # paths, so Classes contains a forwarder C file that relatively imports
  # `../src/*` so that the C sources can be shared among all target platforms.
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*.{h,m}'
  s.dependency 'Flutter'
  s.frameworks = 'UIKit'
  s.platform = :ios, '13.0'
  s.swift_version = '5.0'
end
