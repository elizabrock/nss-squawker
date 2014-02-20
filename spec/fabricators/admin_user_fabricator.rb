Fabricator(:admin_user) do
  email{ sequence(:admin_email) { |i| "adminuser#{i}@example.com" } }
  password "password"
  password_confirmation "password"
end
