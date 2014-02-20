def path_to path_descriptor
  case path_descriptor
  when "the homepage"
    root_path
  when "the admin portal"
    admin_root_path
  when "the sign in page"
    new_user_session_path
  when 'the admin section for "users"'
    admin_users_path
  when 'my profile page'
    user_path(@user)
  when /(.*?)'s profile page/
    user = User.where(username: $1 ).first
    user_path(user)
  else
    raise "Oh noes! You need to specify where this route goes in step_defintions/path_steps.rb"
  end
end

When /^I (?:go to|am on) (.*)$/ do |path_descriptor|
  visit path_to(path_descriptor)
end

Then /^I should be on (.*)$/ do |path_descriptor|
  current_path.should == path_to(path_descriptor)
end
