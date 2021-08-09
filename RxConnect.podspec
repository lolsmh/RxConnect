
Pod::Spec.new do |spec|

  spec.name         = "RxConnect"
  spec.version      = "0.1.1"
  spec.summary      = "Extension on RxSwift library, that makes binding code much cleaner"
  spec.description  = <<-DESC
      RxConnect offers to you a connect closure as a way to deal with disposing your subscriptions
                   DESC
  spec.homepage     = "https://github.com/lolsmh/RxConnect"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Daniil" => "setterinsweater@gmail.com" }
  
  spec.ios.deployment_target = "9.0"
  spec.osx.deployment_target = "10.10"
  spec.watchos.deployment_target = "3.0"
  spec.tvos.deployment_target = "9.0"

  spec.source       = { :git => "https://github.com/lolsmh/RxConnect.git", :tag => "#{spec.version}-beta" }
  
  spec.source_files  = "Sources/**/*.{swift}"
    
  spec.dependency 'RxSwift', '~> 6.0'
  spec.dependency 'RxCocoa', '~> 6.0'
  spec.dependency 'NSObject+Rx'
  
  spec.swift_version    = '5.0'
end
