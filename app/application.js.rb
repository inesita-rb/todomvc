require 'virtual-dom'
require 'opal'
require 'securerandom'
require 'browser'
require 'browser/effects'
require 'inesita'

require 'router'
require 'store'
require_tree './components'

$document.ready do
  Inesita::Application.new(
    router: Router,
    store: Store,
    layout: Layout
  ).mount_to($document['todoapp'])
end

