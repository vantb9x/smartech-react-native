require 'json'
package_json = JSON.parse(File.read('package.json'))

Pod::Spec.new do |s|
  s.name           = "smartech-react-native"
  s.version        = package_json["version"]
  s.summary        = package_json["description"]
  s.homepage       = "https://github.com/NetcoreSolutions/Smartech-React-Native"
  s.license        = package_json["license"]
  s.author         = { package_json["author"] => package_json["author"] }
  s.platform       = :ios, "7.0"
  s.source         = { :git => "git+https://github.com/NetcoreSolutions/Smartech-React-Native.git", :tag => "#{s.version}" }
  s.source_files   = 'ios/**/*.{h,m}'
  s.static_framework = true  
  # The "React" pod is required due to the use of RCTBridgeModule, RCTEventEmitter, etc
  # Ensuring we have version 0.13.0 or greater to avoid a cocoapods issue noted in React Native's release notes
  #   https://github.com/facebook/react-native/releases/tag/v0.13.0
  #   The last stable version on Cocapod's repo is 0.11.0 as we want to ignore it to always use the local copy.
  s.dependency 'React',  '>= 0.13.0', '< 1.0.0'

end

