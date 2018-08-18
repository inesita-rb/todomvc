require 'inesita'
require 'inesita-router'

require 'securerandom'

require 'browser'
require 'browser/storage'
require 'browser/effects'

require 'router'
require 'store'

require_tree './components'

class Application
  include Inesita::Component

  inject Store
  inject Router

  def toggle_all(e)
    store.change_all_items_completed(e.target.checked?)
    render!
  end

  def render
    div class: 'container' do
      component Header
      section.main do
        input class: 'toggle-all', type: 'checkbox', onclick: method(:toggle_all)
        ul.todo_list do
          component router
        end
      end
      component Footer
    end
  end
end

$document.ready do
  Application.mount_to($document['todoapp'])
end
