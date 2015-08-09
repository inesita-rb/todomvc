class Header
  include Inesita::Component

  def new_todo_key_down(e)
    return unless `e.which` == 13
    return if `e.target.value` == ''
    Item.create(name: `e.target.value`, completed: false)
    `e.target.value = ''`
    update_dom!
  end

  def render
    dom do
      header class: 'header' do
        h1 do
          text "todos"
        end
        input id: 'new-todo', class: 'new-todo', placeholder: 'What needs to be done?', autofocus: true, onkeydown: ->(e) { new_todo_key_down(e) }
      end
    end
  end
end
