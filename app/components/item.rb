class Item < ActiveRecord::Base
  include Inesita::Component

  def name
    @attributes[:name]
  end

  def completed
    @attributes[:completed]
  end

  def editing
    @attributes[:editing]
  end

  def item_edit_id
    "item-edit-#{@attributes[:id]}"
  end

  def on_delete
    self.destroy
    update_dom!
  end

  def on_check(e)
    self.completed = `e.target.checked`
    save
    update_dom!
  end

  def on_start_edit(e)
    self.editing = true
    save
    update_dom!
    `document.getElementById(#{item_edit_id}).focus()`
  end

  def on_edit(e)
    key = `e.which`
    return if key != 13 && key != 27

    if key == 13
      self.name = `e.target.value`
    end
    on_lost_focus
  end

  def on_lost_focus
    self.editing = false
    save
    update_dom!
  end

  def render
    dom do
      li class: "#{"completed" if completed} #{"editing" if editing}" do
        div class: 'view' do
          input class: 'toggle', type: 'checkbox', checked: completed, onchange: ->(e) { on_check(e) }
          label ondblclick: ->(e) { on_start_edit(e) } do
            text name
          end
          button class: 'destroy', onclick: -> { on_delete }
        end
        input id: item_edit_id, class: 'edit', value: name, onkeydown: ->(e) { on_edit(e) }, onblur: -> { on_lost_focus }
      end
    end
  end
end
