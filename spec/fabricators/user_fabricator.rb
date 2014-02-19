Fabricator(:user) do
  username{ sequence(:username) { |i| "user#{i}" } }
  email{ sequence(:email) { |i| "user#{i}@example.com" } }
  password "password"
  password_confirmation "password"
end
