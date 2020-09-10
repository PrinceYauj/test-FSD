seed = YAML::load_file('db/seeds.yml')
todos = seed["projects"].map{ |h| h.delete("todos") }
Project.create!(seed["projects"])

todos.each_with_index do |arr, ind|
  arr.each do |hsh|
    hsh[:project_id] = ind + 1
    Todo.create!(hsh)
  end
end
