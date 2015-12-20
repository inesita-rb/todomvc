class Header
  include Inesita::Component

  def new_todo_key_down(e)
    return unless e.code == 13
    return if e.target.value == ''
    store.add_item(e.target.value)
    e.target.value = ''
    render!
  end

  def render
    header class: 'header' do
      h1 { 'todos' }
      input id: 'new-todo', class: 'new-todo', placeholder: 'What needs to be done?', autofocus: true, onkeydown: method(:new_todo_key_down)
    end
  end
end
