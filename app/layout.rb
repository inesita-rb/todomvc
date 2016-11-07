class Layout
  include Inesita::Component

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
          component router
        end
      end
      component Footer
    end
  end
end
