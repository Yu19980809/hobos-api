json.user do
  json.extract! @current_user, :id, :nickname, :role, :slogan, :experience
  json.avatar @current_user.avatar.attached? ? @current_user.avatar.url : 'https://hobos.oss-cn-shanghai.aliyuncs.com/avatar/default-avatar.jpg'
end
