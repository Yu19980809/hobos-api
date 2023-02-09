json.clubs do
  json.array! @clubs do |club|
    json.extract! club, :name, :address, :description
  end
end
