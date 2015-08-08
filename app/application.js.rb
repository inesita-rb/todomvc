require 'virtual-dom'
require 'opal'
require 'browser'
require 'inesita'

require_tree './models'
require_tree './components'

$document.ready do
  Inesita::Application.new(
    routes: {
      '/' => App
    }
  ).mount($document['todoapp'])
end

#require 'test'

#require 'browser/storage'

#store = $window.storage('inesita-todos')
#store['sdfsdf'] = 'sdfsdf'
#store['vvv'] = 'xcvxcv'
#store.save
