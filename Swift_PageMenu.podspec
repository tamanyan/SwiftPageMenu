#
#  Be sure to run `pod spec lint SwiftPageMenu.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
    s.name         = "Swift_PageMenu"
    s.version      = "1.4.2"
    s.summary      = "Customizable Page Tab Menu Controller 👍"
    s.license      = { :type => 'MIT', :file => 'LICENSE' }
    s.homepage     = "https://github.com/tamanyan/SwiftPageMenu"
    s.author       = { "Taketo Yoshida" => "tamanyan.ttt@gmail.com" }
    s.source       = { :git => "https://github.com/tamanyan/SwiftPageMenu.git", :tag => "#{s.version}" }
    s.requires_arc = true
    s.source_files = 'Sources/**/*.{swift}'
    s.swift_version = "5.0"
    s.ios.deployment_target  = '10.0'
end
