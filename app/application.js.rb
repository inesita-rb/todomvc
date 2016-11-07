require 'inesita'
require 'inesita-router'

require 'securerandom'
require 'browser'
require 'browser/storage'
require 'browser/effects'

require 'virtual_dom/support/browser'

require 'layout'
require 'router'
require 'store'
require_tree './components'

class Application
  include Inesita::Component

  inject Store
  inject Router

  def render
    component Layout
  end
end

Inesita::Browser.ready? do
  Application.mount_to($document['todoapp'])
end
