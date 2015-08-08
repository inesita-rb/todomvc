class Header
  include Inesita::Component

  def render
    dom do
      header class: 'header' do
        h1 do
          text "todos"
        end
        input class: 'new-todo', ref: 'newField', placeholder: 'What needs to be done?', autofocus: true
      end
    end
  end
end
