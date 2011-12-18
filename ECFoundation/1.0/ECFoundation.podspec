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
  s.source   = { :git => 'git@github.com:samdeane/ECFoundation.git', :tag => '1.0' }

  s.clean_paths = 'Extras'

  def s.copy_header_mapping(from)
    from.relative_path_from(Pathname.new('Modules'))
  end

  s.subspec 'ECCore' do |eccore|
    eccore.description = 'Core utilities'
    eccore.source_files = 'Modules/ECCore/Generic/*.{h,m}', 'Modules/ECCore/iOS/*.{h,m}'
  end

end
