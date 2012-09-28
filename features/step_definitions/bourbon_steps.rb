Given /^bourbon is already installed$/ do
  install_bourbon
end

When /^I install bourbon files$/ do
  install_bourbon
end

When /^I update bourbon files$/ do
  update_bourbon
end

Then /^the sass directories(?: with "([^"]+)" prefix)? should have been generated$/ do |prefix|
  sass_directories = ["addons", "css3", "functions"]
  sass_directories.map!{ |directory| bourbon_path(prefix, directory) }
  check_directory_presence(sass_directories, true)
end

Then /^the master bourbon partial should have been generated(?: within "([^"]+)" directory)?$/ do |prefix|
  check_file_presence([bourbon_path(prefix, '_bourbon.scss')], true)
end

Then /^the lib files should have been generated(?: within "([^"]+)" directory)?$/ do |prefix|
  check_file_presence([bourbon_path(prefix, 'lib/bourbon.rb')], true)
  check_directory_presence([bourbon_path(prefix, 'lib/bourbon')], true)
  check_file_presence([bourbon_path(prefix, 'lib/bourbon/sass_extensions.rb')], true)
  check_directory_presence([bourbon_path(prefix, 'lib/bourbon/sass_extensions')], true)
end

Then /^bourbon should not have been generated$/ do
  check_directory_presence(['bourbon'], false)
end
