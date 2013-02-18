# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.author = "niuage"
  s.name = "hovercard"
  s.summary = "Hovercards giving access to important actions and additional information on an item."
  s.description = "Hovercards giving access to important actions and additional information on an item."
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  s.version = "1.2"
end
