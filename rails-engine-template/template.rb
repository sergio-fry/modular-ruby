error = false

# unless try(:name) && File.exist?(File.join(destination_root, 'lib', name, 'engine.rb'))
  # say "ERROR: This is for engines only. You need to create a new engine with"
  # say "       'rails plugin new' and specify '--mountable' or '--full'."
  # error = true
# end

if File.exist?(File.join(destination_root, 'test'))
  say "ERROR: You need to generate the plugin with -T specified so it doesn't"
  say "       create a test setup. Delete the plugin directory and try again."
  error = true
end

exit 1 if error

def bundle
  run "bundle install --quiet"
end

GEMSPEC_FILE = File.join(destination_root, "#{name}.gemspec")
RECIPE_PATH = File.join(File.dirname(rails_template), "recipes")
RECIPES = %w{gemspec dummy_app rspec developer_gems}

RECIPES.each do |recipe|
  apply File.join(RECIPE_PATH, "#{recipe}.rb")
end

say "Garbage collecting git..."
git gc: '--quiet'

say %{
  Things to do:
    - edit #{name}.gemspec to set correct info and remove bundler warnings.
    - rake db:migrate
}
