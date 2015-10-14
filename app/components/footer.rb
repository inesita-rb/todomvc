class Footer
  include Inesita::Component

  def clear_completed(e)
    store.clear_completed_items
    update_dom
  end

  def render
    footer class: 'footer' do
      span class: 'todo-count' do
        strong do
          text store.active.length
        end
        text ' items left'
      end
      ul class: 'filters' do
        li do
          a href: router.url_for(:all), class: "#{"selected" if router.current_url?(:all)}" do
            text 'All'
          end
        end
        li do
          a href: router.url_for(:active), class: "#{"selected" if router.current_url?(:active)}" do
            text 'Active'
          end
        end
        li do
          a href: router.url_for(:completed), class: "#{"selected" if router.current_url?(:completed)}" do
            text 'Completed'
          end
        end
      end
      if store.completed.length > 0
        button class: 'clear-completed', onclick: -> { clear_completed } do
          text 'Clear completed'
        end
      end
    end
  end
end
