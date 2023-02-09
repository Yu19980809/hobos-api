json.comedians do
  json.array! @comedians do |comedian|
    json.extract! comedian, :id, :nickname, :slogan, :experience
  end
end
