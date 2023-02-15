json.show do
  json.extract! @show, :id, :name, :description, :date, :start_time, :end_time, :address
  json.poster @show.poster.attached? ? @show.poster.url : 'https://hobos.oss-cn-shanghai.aliyuncs.com/poster/default-poster.jpg'
  json.club @club
  json.comedians @comedians
  json.audiences do
    json.array! @audiences do |audience|
      json.extract! audience, :id
      json.avatar audience.avatar.attached? ? audience.avatar.url : 'https://hobos.oss-cn-shanghai.aliyuncs.com/avatar/default-avatar.jpg'
    end
  end
end
