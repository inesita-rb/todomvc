class Main
  include Inesita::Component

  components %i(
    _todos
  )

  def setup
    @_todos = case url
    when '/active'
      Item.where(completed: false).all
    when '/completed'
      Item.where(completed: true).all
    else
      Item.all
    end
  end

  def toggle_all(e)
    @_todos.each do |item|
      item.completed = `e.target.checked`
      item.save
    end
    update_dom!
  end

  def render
    dom do
      section class: 'main' do
        input class: 'toggle-all', type: 'checkbox', onclick: ->(e) { toggle_all(e) }
        ul class: 'todo-list' do
          _todos.each do |t|
            component t
          end
        end
      end
    end
  end
end
