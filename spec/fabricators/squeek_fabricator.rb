Fabricator(:squeek) do
  body{ sequence(:body) { |i| "Squeek #{i}" } }
  consumers_only false
  user
end
