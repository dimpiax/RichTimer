Pod::Spec.new do |s|
  s.name             = "RichTimer"
  s.version          = "1.0.2"
  s.summary          = "An Extension on `NSTimer` that manage and accepts generic parameters"
  s.description      = <<-DESC
                            RichTimer – it's easy NSTimer managment and compact visual appearance.
                            Accepts generic parameters for common functions
                       DESC

  s.homepage         = "https://github.com/dimpiax/RichTimer"
  s.license          = 'MIT'
  s.author           = { "Pilipenko Dima" => "dimpiax@gmail.com" }
  s.source           = { :git => "https://github.com/dimpiax/RichTimer.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/dimpiax'

  s.platforms = { :ios => "8.0" }
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*.swift'

  s.frameworks = 'Foundation'
end
