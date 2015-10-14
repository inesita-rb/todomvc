class Item
  include Inesita::Component

  def on_delete
    store.delete_item(props[:id])
    update_dom
  end

  def on_check(e)
    store.change_item_completed(props[:id], e.target.checked)
    update_dom
  end

  def on_start_edit(e)
    store.change_item_editing(props[:id], true)
    update_dom
    $document[props[:id]].focus
  end

  def on_edit(e)
    key = e.which
    return if key != 13 && key != 27
    store.change_item_name(props[:id], e.target.value) if key == 13
    on_lost_focus
  end

  def on_lost_focus
    store.change_item_editing(props[:id], false)
    update_dom
  end

  def render
    li class: "#{"completed" if props[:completed]} #{"editing" if props[:editing]}" do
      div class: 'view' do
        input class: 'toggle', type: 'checkbox', checked: props[:completed], onchange: ->(e) { on_check(e) }
        label ondblclick: ->(e) { on_start_edit(e) } do
          text props[:name]
        end
        button class: 'destroy', onclick: -> { on_delete }
      end
      input id: props[:id], class: 'edit', value: props[:name], onkeydown: ->(e) { on_edit(e) }, onblur: -> { on_lost_focus }
    end
  end
end
