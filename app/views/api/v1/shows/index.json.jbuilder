json.shows do
  json.array! @shows do |show|
    json.extract! show, :id, :name, :description, :date, :start_time, :end_time, :address
    json.poster show.poster.attached? ? show.poster.url : 'https://hobos.oss-cn-shanghai.aliyuncs.com/poster/default-poster.jpg'
  end
end
