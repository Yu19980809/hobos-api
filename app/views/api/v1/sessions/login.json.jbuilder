json.user do
  json.extract! @user, :id, :nickname, :open_id, :role, :slogan, :experience
end
