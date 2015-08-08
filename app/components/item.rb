class Item
  include Inesita::Component

  def render
    dom do
      li class: '' do
        div class: 'view' do
          input class: 'toggle', type: 'checkbox'
          label do
            text 'todo'
          end
          button class: 'destroy'
        end
        input class: 'edit', ref: 'editField'
      end
    end
  end
end
