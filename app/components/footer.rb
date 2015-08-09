class Footer
  include Inesita::Component

  def uncomplete_items
    Item.where(completed: false).count
  end

  def completed_items
    Item.where(completed: true).count
  end

  def clear_completed
    Item.where(completed: true).map(&:destroy)
    update_dom!
  end

  def render
    dom do
      footer class: 'footer' do
        span class: 'todo-count' do
          strong do
            text uncomplete_items
          end
          text ' items left'
        end
        ul class: 'filters' do
          li do
            a href: '/', class: "#{"selected" if url == '/'}" do
              text 'All'
            end
          end
          li do
            a href: '/active', class: "#{"selected" if url == '/active'}" do
              text 'Active'
            end
          end
          li do
            a href: '/completed', class: "#{"selected" if url == '/completed'}" do
              text 'Completed'
            end
          end
        end
        if completed_items > 0
          button class: 'clear-completed', onclick: -> { clear_completed } do
            text 'Clear completed'
          end
        end
      end
    end
  end
end
