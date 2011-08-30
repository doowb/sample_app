# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{spork}
  s.version = "0.9.0.rc8"
  s.platform = %q{x86-mingw32}

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tim Harper", "Donald Parish"]
  s.date = %q{2011-05-27}
  s.description = %q{A forking Drb spec server}
  s.email = ["timcharper+spork@gmail.com"]
  s.executables = ["spork"]
  s.extra_rdoc_files = ["MIT-LICENSE", "README.rdoc"]
  s.files = ["bin/spork", "MIT-LICENSE", "README.rdoc"]
  s.homepage = %q{http://github.com/timcharper/spork}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{spork}
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{spork}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<win32-process>, [">= 0"])
    else
      s.add_dependency(%q<win32-process>, [">= 0"])
    end
  else
    s.add_dependency(%q<win32-process>, [">= 0"])
  end
end
