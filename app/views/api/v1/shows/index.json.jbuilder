json.shows do
  json.array! @shows do |show|
    json.extract! show, :id, :name, :description, :date, :start_time, :end_time, :address
  end
end
