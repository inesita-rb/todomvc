class Footer
  include Inesita::Component

  def render
    dom do
      footer class: 'footer' do
        span class: 'todo-count' do
          strong do
            text '0'
          end
          text '0 left'
        end
        ul class: 'filters' do
          li do
            a href: '/', class: 'selected' do
              text 'All'
            end
          end
          li do
            a href: '/active' do
              text 'Active'
            end
          end
          li do
            a href: '/completed' do
              text 'Completed'
            end
          end
        end
        button class: 'clear-completed' do
          text 'Clear completed'
        end
      end
    end
  end
end
