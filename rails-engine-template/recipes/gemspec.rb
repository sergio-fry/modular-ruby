say "Remove TODO from gemspec..."

gsub_file GEMSPEC_FILE, /homepage\s+= \"TODO\"/, 'homepage    = "http://example.com"'
gsub_file GEMSPEC_FILE, /summary\s+= \"TODO.+\"/, 'summary     = "Summary"'
gsub_file GEMSPEC_FILE, /description\s+= \"TODO.+\"/, 'description = "Description"'
