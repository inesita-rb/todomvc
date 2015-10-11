class Store
  include Inesita::Store

  def initialize
    @todos = {}
  end

  def add_item(name)
    id = SecureRandom.uuid

    @todos[id] = {
      id: id,
      name: name,
      completed: false,
      editing: false
    }
  end

  def change_item_completed(id, value)
    @todos[id][:completed] = value
  end

  def change_item_editing(id, value)
    @todos[id][:editing] = value
  end

  def change_item_name(id, value)
    @todos[id][:name] = value
  end

  def delete_item(id)
    @todos.delete(id)
  end

  def change_all_items_completed(value)
    @todos.each do |k, v|
      @todos[k][:completed] = value
    end
  end

  def all
    @todos.values
  end

  def active
    @todos.values.select { |i| i[:completed] == false }
  end

  def completed
    @todos.values.select { |i| i[:completed] == true }
  end

  def clear_completed_items
    completed.each do |item|
      @todos.delete(item[:id])
    end
  end
end
