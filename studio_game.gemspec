Gem::Specification.new do |s|
  s.name         = "quantum_waver_prag_studio_game"
  s.version      = "1.0.0"
  s.author       = "Jeff Sholl"
  s.email        = "Jeff@highersymmetry.com"
  s.homepage     = "https://github.com/QuantumWaver"
  s.summary      = "The game in the Pragmatic Studio Online Ruby Course"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README.md'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README.md)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'prag_studio_game' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec'
end
