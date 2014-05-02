json.array!(@tasks) do |task|
  json.extract! task, :id, :title, :description, :excerpt, :image_url, :duration
  json.url task_url(task, format: :json)
end
