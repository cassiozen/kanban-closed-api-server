json.array! @cards do |card|
  json.(card, :id, :title, :description, :color, :status)

  json.tasks card.tasks do |tasks|
    json.(tasks, :id, :name, :done)
  end
end
