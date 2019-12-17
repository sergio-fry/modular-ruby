say "Installing thin, pry, awesome_print, better_errors, and hirb..."

inject_into_file GEMSPEC_FILE, before: %r{^end$} do
  <<-CODE
  spec.add_development_dependency 'byebug'
  CODE
end

bundle
