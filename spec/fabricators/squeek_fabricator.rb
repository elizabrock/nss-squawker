Fabricator(:squeek) do
  body{ sequence(:body) { |i| "Squeek #{i}" } }
  user
end