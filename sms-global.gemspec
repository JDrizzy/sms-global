lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sms_global/version'

Gem::Specification.new do |spec|
  spec.name          = 'sms-global'
  spec.version       = SmsGlobal::VERSION
  spec.authors       = ['Jarrad Muir']
  spec.email         = ['jarrads@live.com']

  spec.summary       = 'Ruby library for SMS Global'
  spec.homepage      = 'https://github.com/JDrizzy/sms-global'
  spec.license       = 'MIT'

  spec.metadata['source_code_uri'] = 'https://github.com/JDrizzy/sms-global'
  spec.metadata['changelog_uri'] = 'https://github.com/JDrizzy/sms-global/releases'

  spec.files = Dir['LICENSE.txt', 'README.md', 'lib/**/*']
  spec.test_files = `git ls-files -- test/*`.split("\n")
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'byebug', '~> 11.0', '>= 11.0.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rubocop', '~> 0.79.0'
  spec.add_development_dependency 'simplecov', '~> 0.17.1'
  spec.add_development_dependency 'webmock', '~> 3.7', '>= 3.7.6'
end
