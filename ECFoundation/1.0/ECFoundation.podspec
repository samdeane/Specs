#
# Be sure to run `pod lint ECFoundation.podspec' to ensure this is a
# valid spec.
#
# Remove all comments before submitting the spec.
#
Pod::Spec.new do |s|
  s.name     = 'ECFoundation'
  s.version  = '1.0'
  s.license  = 'MIT'
  s.summary  = 'A collection of Cocoa utility classes from Elegant Chaos'
  s.homepage = 'http://github.com/samdeane/ECFoundation/wiki'
  s.author   = { 'Sam Deane' => 'sam@elegantchaos.com' }
  s.source   = { :git => 'git://github.com/samdeane/ECFoundation.git', :tag => '1.0' }

  s.clean_paths = 'Extras'

  def s.copy_header_mapping(from)
    from.relative_path_from(Pathname.new('Modules'))
  end

  s.subspec 'ECCore' do |eccore|
    eccore.description = 'Core utilities'
    eccore.source_files = 'Modules/ECCore/Generic/*.{h,m}', 'Modules/ECCore/iOS/*.{h,m}'
  end

  s.subspec 'ECAnalytics' do |ecanalytics|
    ecanalytics.description = 'Generic analytics engine, with support for various Analytics and Crash Reporting SDKs'
    ecanalytics.source_files = 'Modules/ECAnalytics/iOS/*.{h,m}'
    ecanalytics.dependency 'ECFoundation/ECLogging'
  end
  
  s.subspec 'ECLogging' do |eclogging|
    eclogging.description = 'Logging system supporting multiple named channels, multiple log handers'
    eclogging.source_files = 'Modules/ECLogging/Generic/*.{h,m}', 'Modules/ECLogging/iOS/*.{h,m}'
    eclogging.dependency 'ECFoundation/ECCore'
  end

  s.subspec 'ECText' do |ectext|
    ectext.description = 'Logging system supporting multiple named channels, multiple log handers'
    ectext.source_files = 'Modules/ECText/Generic/*.{h,m}'
    ectext.dependency 'ECFoundation/ECLogging'
  end

  s.subspec 'ECTouch' do |ectouch|
    ectouch.description = 'Various iOS utility classes'
    ectouch.source_files = 'Modules/ECTouch/*.{h,m}'
    ectouch.dependency 'ECFoundation/ECLogging'
    
    ectouch.subspec 'ECTable' do |ectable|
        ectable.description = 'pseudo-bindings system for iOS tables'
        ectable.source_files = 'Modules/ECTouch/ECTables/*.{h,m}'
        ectable.dependency 'ECFoundation/ECLogging'
    end
    
    ectouch.subspec 'ECViews' do |ecviews|
        ecviews.description = 'custom view classes for iOS'
        ecviews.source_files = 'Modules/ECTouch/ECViews/*.{h,m}'
        ecviews.dependency 'ECFoundation/ECLogging'
    end
    
  end

  s.subspec 'ECAppKit' do |ecappkit|
    ecappkit.description = 'Various MacOS utility classes'
    ecappkit.source_files = 'Modules/ECAppKit'
    ecappkit.dependency 'ECFoundation/ECLogging'
  end

end
