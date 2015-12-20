class Layout
  include Inesita::Layout

  def toggle_all(e)
    store.change_all_items_completed(e.target.checked?)
    render!
  end

  def render
    div class: 'container' do
      component Header
      section class: 'main' do
        input class: 'toggle-all', type: 'checkbox', onclick: method(:toggle_all)
        ul class: 'todo-list' do
          component outlet
        end
      end
      component Footer
    end
  end
end
