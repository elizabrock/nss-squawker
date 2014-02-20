Fabricator(:squeek) do
  body{ sequence(:body) { |i| "Squeek #{i}" } }
  consumers_only false
  user
end

Fabricator(:consumer_only_squeek, from: :squeek) do
  consumers_only true
end
