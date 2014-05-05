json.array!(@task_items) do |task_item|
  json.extract! task_item, :id, :task_id, :task_list_id
  json.url task_item_url(task_item, format: :json)
end
