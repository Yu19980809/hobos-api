json.comedian do
  json.extract! @comedian, :id, :nickname, :slogan, :experience
  json.avatar @comedian.avatar.attached? ? @comedian.avatar.url : 'https://hobos.oss-cn-shanghai.aliyuncs.com/avatar/default-avatar.jpg'
  json.shows do
    json.array! @shows do |show|
      json.extract! show, :id, :name, :description, :date, :start_time, :end_time, :address
      json.club_name show.club.name
      json.poster show.poster.attached? ? show.poster.url : 'https://hobos.oss-cn-shanghai.aliyuncs.com/poster/default-poster.jpg'
    end
  end
end
