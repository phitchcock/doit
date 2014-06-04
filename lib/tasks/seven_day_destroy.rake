task delete_items: :development do
  Task.where("created_at <= ?", Time.now - 7.days).destroy_all
end