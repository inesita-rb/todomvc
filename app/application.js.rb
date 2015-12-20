require 'inesita'

require 'securerandom'
require 'browser/storage'
require 'browser/effects'

require 'layout'
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
