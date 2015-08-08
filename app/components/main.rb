class Main
  include Inesita::Component

  components %i(
    _item
    _todos
  )

  def initialize
    @_item ||= Item.new
    @_todos = [
      Item.new,
      Item.new,
      Item.new,
      Item.new,
    ]
  end

  def render
    dom do
      section class: 'main' do
        input class: 'toggle-all', type: 'checkbox'
        ul class: 'todo-list' do
          _todos.each do |t|
            component t
          end
        end
      end
    end
  end
end
