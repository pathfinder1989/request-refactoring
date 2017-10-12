Pod::Spec.new do |s|
 s.name         = "MSRequest"
 s.version      = "0.0.1"
 s.summary      = "网络请求初级版"
 s.description  = <<-DESC
                      MSRequest
                      * Markdown 格式
                   DESC

s.homepage     = 'http://meishi.cc/'
s.license      = { :type => "MIT", :file => "license" }
s.author       = { 'meishi' => 'http://meishi.cc/' }

s.platform     = :ios, "7.0"
s.source       = { :git => "${SRCROOT}/MSPhotosAsset" }
s.source_files  = '**/*.{h,m}'

s.requires_arc  = true
s.framework = "CFNetwork"
s.dependency "AFNetworking", "~> 3.1.0"
end