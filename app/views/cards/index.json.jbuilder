json.array!(@cards) do |card|
  json.extract! card, :id, :title, :description, :color, :status, :tasks
end
