Pod::Spec.new do |s|
  s.name         = "activityindicators"
  s.version      = "0.7"
  s.summary      = "A bunch of drop-in replacements to UIActivityIndicatorView. In Swift!"

  s.description  = <<-DESC
                   activityindicators is a bunch of drop-in replacements to the gray spinning
                   UIActivityIndicatorView that you can use for your projects. It's all in code,
                   so you don't have to worry about making your binary bigger by much. It is easy
                   to use too - just treat it as you would a UIActivityIndicatorView and
                   startAnimating()!
                   DESC
  s.homepage     = "https://github.com/maranas/activityindicators"
  s.screenshots  = "http://i.imgur.com/nrvdh6c.gif", "http://i.imgur.com/hbFgUny.gif", "http://i.imgur.com/5ONmq1c.gif", "http://i.imgur.com/qYioH0x.gif"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Moises" => "moises@ganglionsoftware.com" }
  s.platform     = :ios, '9.0'
  s.source       = { :git => "https://github.com/maranas/activityindicators.git", :tag => "0.7" }
  s.source_files  = "activityindicators/Classes"
  s.frameworks = 'UIKit'
end
