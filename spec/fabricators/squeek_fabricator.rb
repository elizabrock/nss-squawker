Fabricator(:squeek) do
  body{ sequence(:body) { |i| "Squeek #{i}" } }
  friends_only false
  user
end
