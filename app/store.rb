class Store
  include Inesita::Injection

  def initialize
    @todos = get_from_local_storage || {}
  end

  def add_item(name)
    id = SecureRandom.uuid

    @todos[id] = {
      id: id,
      name: name,
      completed: false,
      editing: false
    }
    put_to_local_storage
  end

  def change_item_completed(id, value)
    @todos[id][:completed] = value
    put_to_local_storage
  end

  def change_item_editing(id, value)
    @todos[id][:editing] = value
    put_to_local_storage
  end

  def change_item_name(id, value)
    @todos[id][:name] = value
    put_to_local_storage
  end

  def delete_item(id)
    @todos.delete(id)
    put_to_local_storage
  end

  def change_all_items_completed(value)
    @todos.each do |k, v|
      @todos[k][:completed] = value
    end
    put_to_local_storage
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
    put_to_local_storage
  end

  def get_from_local_storage
    JSON.parse(`localStorage.getItem("todo-mvc")`)
  end

  def put_to_local_storage
    `localStorage.setItem("todo-mvc", #{@todos.to_json})`
  end
end
