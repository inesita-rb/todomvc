require 'virtual-dom'
require 'opal'
require 'browser'
require 'inesita'
require 'active_record'

ActiveRecord::Base.connection = ActiveRecord::LocalStorageStore.new(LocalStorage.new)

require_tree './components'

$document.ready do
  Inesita::Application.new(
    routes: {
      '/' => App
    }
  ).mount($document['todoapp'])
end

