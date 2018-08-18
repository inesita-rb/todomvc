class Item
  include Inesita::Component

  def on_delete
    store.delete_item(props[:id])
    render!
  end

  def on_check(e)
    store.change_item_completed(props[:id], e.target.checked)
    render!
  end

  def on_start_edit(_e)
    store.change_item_editing(props[:id], true)
    render!
    $document[props[:id]].focus
  end

  def on_edit(e)
    key = e.keyCode
    return if key != 13 && key != 27
    store.change_item_name(props[:id], e.target.value) if key == 13
    on_lost_focus
  end

  def on_lost_focus
    store.change_item_editing(props[:id], false)
    render!
  end

  def render
    li class: "#{'completed' if props[:completed]} #{'editing' if props[:editing]}" do
      div.view do
        input.toggle type: 'checkbox', checked: props[:completed], onchange: method(:on_check)
        label ondblclick: ->(e) { on_start_edit(e) } do
          text props[:name]
        end
        button.destroy onclick: -> { on_delete }
      end
      input.edit id: props[:id], value: props[:name], onkeydown: method(:on_edit), onblur: method(:on_lost_focus)
    end
  end
end
