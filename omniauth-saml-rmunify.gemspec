require File.expand_path('../lib/omniauth-saml-rmunify/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'omniauth-saml-rmunify'
  gem.version       = OmniAuth::SAMLRMUnify::VERSION
  gem.summary       = 'A custom info auth hash translating the rm unify attributes. Subclass of omniauth-saml.'
  gem.description   = 'An RMUnify SAML strategy for OmniAuth.'
  gem.license       = 'MIT'

  gem.authors       = ['Henk van der Veen']
  gem.email         = 'henk.van.der.veen@gmail.com'
  gem.homepage      = 'https://github.com/hampei/omniauth-saml-rmunify'

  gem.add_runtime_dependency 'omniauth-saml', '~> 1.1.0'

  gem.files         = ['README.md', 'CHANGELOG.md'] + Dir['lib/**/*.rb']
  gem.require_paths = ["lib"]
end
